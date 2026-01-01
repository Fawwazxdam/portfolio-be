const express = require("express");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const router = express.Router();

// GET all articles with optional filters
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

  const articles = await prisma.article.findMany({
    where,
    include: {
      author: true,
      comments: true,
      tags: { include: { tag: true } }
    },
    orderBy: { createdAt: "desc" },
    take: limit ? parseInt(limit) : undefined
  });

  res.json(articles);
});

// CREATE article
router.post("/", async (req, res) => {
  const { title, content, authorId, tags = [] } = req.body;

  const authorIdNum = Number(authorId) || 1; // Default to admin (id: 1) if invalid

  // Check if author exists
  const author = await prisma.user.findUnique({
    where: { id: authorIdNum }
  });

  if (!author) {
    return res.status(400).json({ error: "Author not found" });
  }

  const slug = title.toLowerCase().replace(/\s+/g, "-");

  const article = await prisma.article.create({
    data: {
      title,
      content,
      slug,
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

  res.json(article);
});

// GET single article
router.get("/:id", async (req, res) => {
  const id = Number(req.params.id);

  const article = await prisma.article.findUnique({
    where: { id },
    include: {
      author: true,
      comments: { include: { author: true } },
      tags: { include: { tag: true } }
    }
  });

  if (!article) return res.status(404).json({ message: "Not found" });

  res.json(article);
});

// UPDATE article
router.put("/:id", async (req, res) => {
  const id = Number(req.params.id);
  const { title, content, published, tags } = req.body;

  const updateData = { title, content, published };

  if (tags) {
    // Delete existing tags
    await prisma.articleTag.deleteMany({
      where: { articleId: id }
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

  const updated = await prisma.article.update({
    where: { id },
    data: updateData,
    include: { tags: { include: { tag: true } } }
  });

  res.json(updated);
});

// DELETE article
router.delete("/:id", async (req, res) => {
  const id = Number(req.params.id);
  await prisma.article.delete({ where: { id } });

  res.json({ message: "Article deleted" });
});

module.exports = router;
