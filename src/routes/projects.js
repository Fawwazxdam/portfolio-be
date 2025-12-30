const express = require("express");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const router = express.Router();

// GET all projects with optional filters
router.get("/", async (req, res) => {
  const { tag, year, limit, published } = req.query;

  const where = {};

  if (tag) {
    where.tags = {
      some: {
        tag: {
          slug: tag
        }
      }
    };
  }

  if (year) {
    const startDate = new Date(`${year}-01-01`);
    const endDate = new Date(`${parseInt(year) + 1}-01-01`);
    where.createdAt = {
      gte: startDate,
      lt: endDate
    };
  }

  if (published !== undefined) {
    where.published = published === 'true';
  }

  const projects = await prisma.project.findMany({
    where,
    include: {
      author: true,
      tags: { include: { tag: true } }
    },
    orderBy: { createdAt: "desc" },
    take: limit ? parseInt(limit) : undefined
  });

  res.json(projects);
});

// CREATE project
router.post("/", async (req, res) => {
  console.log('Request body:', req.body);
  const { title, description, content, demoUrl, githubUrl, technologies, authorId, tags = [] } = req.body;

  const authorIdNum = Number(authorId) || 1; // Default to admin (id: 1) if invalid

  const slug = title.toLowerCase().replace(/\s+/g, "-");

  const project = await prisma.project.create({
    data: {
      title,
      slug,
      description,
      content,
      demoUrl,
      githubUrl,
      ...(technologies && { technologies }),
      author: { connect: { id: authorIdNum } },
      tags: {
        create: tags.filter(t => t).map((t) => {
          const tagName = typeof t === 'string' ? t : t.name;
          if (!tagName) return null;
          const tagSlug = tagName.toLowerCase().replace(/\s+/g, '-');
          return {
            tag: {
              connectOrCreate: {
                where: { slug: tagSlug },
                create: { name: tagName, slug: tagSlug }
              }
            }
          };
        }).filter(Boolean)
      }
    },
    include: { tags: { include: { tag: true } } }
  });

  res.json(project);
});

// GET single project
router.get("/:id", async (req, res) => {
  const id = Number(req.params.id);

  const project = await prisma.project.findUnique({
    where: { id },
    include: {
      author: true,
      tags: { include: { tag: true } }
    }
  });

  if (!project) return res.status(404).json({ message: "Not found" });

  res.json(project);
});

// UPDATE project
router.put("/:id", async (req, res) => {
  const id = Number(req.params.id);
  const { title, description, content, published, demoUrl, githubUrl, technologies, tags } = req.body;

  const updateData = { title, description, content, published, demoUrl, githubUrl, ...(technologies !== undefined && { technologies }) };

  if (tags) {
    // Delete existing tags
    await prisma.projectTag.deleteMany({
      where: { projectId: id }
    });

    // Add new tags
    updateData.tags = {
      create: tags.filter(t => t).map((t) => {
        const tagName = typeof t === 'string' ? t : t.name;
        if (!tagName) return null;
        const tagSlug = tagName.toLowerCase().replace(/\s+/g, '-');
        return {
          tag: {
            connectOrCreate: {
              where: { slug: tagSlug },
              create: { name: tagName, slug: tagSlug }
            }
          }
        };
      }).filter(Boolean)
    };
  }

  const updated = await prisma.project.update({
    where: { id },
    data: updateData,
    include: { tags: { include: { tag: true } } }
  });

  res.json(updated);
});

// DELETE project
router.delete("/:id", async (req, res) => {
  const id = Number(req.params.id);
  await prisma.project.delete({ where: { id } });

  res.json({ message: "Project deleted" });
});

module.exports = router;