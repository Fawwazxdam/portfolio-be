const express = require("express");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const router = express.Router();

// CREATE comment
router.post("/", async (req, res) => {
  const { articleId, authorId, content } = req.body;

  const comment = await prisma.comment.create({
    data: {
      content,
      article: { connect: { id: Number(articleId) } },
      author: { connect: { id: Number(authorId) } }
    }
  });

  res.json(comment);
});

// List comments of article
router.get("/article/:id", async (req, res) => {
  const articleId = Number(req.params.id);

  const comments = await prisma.comment.findMany({
    where: { articleId },
    include: { author: true },
    orderBy: { createdAt: "asc" }
  });

  res.json(comments);
});

// DELETE comment
router.delete("/:id", async (req, res) => {
  const id = Number(req.params.id);

  await prisma.comment.delete({ where: { id } });

  res.json({ message: "Comment deleted" });
});

module.exports = router;
