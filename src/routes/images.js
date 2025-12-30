const express = require("express");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const router = express.Router();

// GET all images
router.get("/", async (req, res) => {
  const images = await prisma.image.findMany({
    orderBy: { createdAt: "desc" }
  });

  res.json(images);
});

// CREATE image
router.post("/", async (req, res) => {
  const { url, alt, imageableType, imageableId } = req.body;

  const image = await prisma.image.create({
    data: {
      url,
      alt,
      imageableType,
      imageableId: Number(imageableId)
    }
  });

  res.json(image);
});

// GET single image
router.get("/:id", async (req, res) => {
  const id = Number(req.params.id);

  const image = await prisma.image.findUnique({
    where: { id }
  });

  if (!image) return res.status(404).json({ message: "Not found" });

  res.json(image);
});

// UPDATE image
router.put("/:id", async (req, res) => {
  const id = Number(req.params.id);
  const { url, alt } = req.body;

  const updated = await prisma.image.update({
    where: { id },
    data: { url, alt }
  });

  res.json(updated);
});

// DELETE image
router.delete("/:id", async (req, res) => {
  const id = Number(req.params.id);
  await prisma.image.delete({ where: { id } });

  res.json({ message: "Image deleted" });
});

module.exports = router;