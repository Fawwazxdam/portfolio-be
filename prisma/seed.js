const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

async function main() {
  console.log("🌱 Seeding data...");

  // Create Users (admin + user)
  const admin = await prisma.user.upsert({
    where: { email: "admin@example.com" },
    update: {},
    create: {
      name: "Administrator",
      email: "admin@example.com",
      phone_number: "081234567890",
    },
  });

  const user = await prisma.user.upsert({
    where: { email: "user@example.com" },
    update: {},
    create: {
      name: "Regular User",
      email: "user@example.com",
      phone_number: "081234567891",
    },
  });

  // Create Tags
  const tags = ["react", "javascript", "backend", "laravel", "mysql", "jquery", "bootstrap", "next.js", "tailwind-css", "api-integration", "zustand"];
  const createdTags = [];

  for (const t of tags) {
    const tag = await prisma.tag.upsert({
      where: { slug: t },
      update: {},
      create: { name: t, slug: t },
    });
    createdTags.push(tag);
  }

  // Create Article
  const article = await prisma.article.upsert({
    where: { slug: "hello-world-article" },
    update: {},
    create: {
      title: "Hello World Article",
      slug: "hello-world-article",
      content: "This is my first seeded article.",
      published: true,
      author: { connect: { id: admin.id } },
      tags: {
        create: createdTags.slice(0, 3).map((tag) => ({
          tag: { connect: { id: tag.id } },
        })),
      },
    },
  });

  // Create Comment
  await prisma.comment.upsert({
    where: { id: 1 },
    update: {},
    create: {
      content: "Nice article! 🚀",
      author: { connect: { id: user.id } },
      article: { connect: { id: article.id } },
    },
  });

  // Create Projects
  const projectsData = [
    {
      title: "ERP System - Biliva Nature",
      description: "Integrated ERP system for stock management, transactions, customer service, and heavy equipment dealer using Laravel and other libraries and tools",
      tech: ["laravel", "mysql", "jquery", "bootstrap"],
      demo: "#",
      github: "#"
    },
    {
      title: "Muattrans & Muatparts Plus",
      description: "Modern web application with Next.js and backend API integration for dynamic data display",
      tech: ["next.js", "tailwind-css", "api-integration", "react", "zustand"],
      demo: "#",
      github: "#"
    },
    {
      title: "Ayo on Time",
      description: "Student attendance journal application that records student attendance in real-time using Next.js and backend API integration",
      tech: ["next.js", "tailwind-css", "api-integration", "laravel", "mysql", "zustand"],
      demo: "https://ayoontime.magentaa.space/",
      github: "https://github.com/Fawwazxdam/attendance-app-fe.git"
    }
  ];

  for (const proj of projectsData) {
    const slug = proj.title.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-+|-+$/g, "");
    await prisma.project.upsert({
      where: { slug },
      update: {},
      create: {
        title: proj.title,
        slug,
        description: proj.description,
        published: true,
        demoUrl: proj.demo,
        githubUrl: proj.github,
        technologies: proj.tech,
        author: { connect: { id: admin.id } },
        tags: {
          create: proj.tech.map((t) => ({
            tag: { connect: { slug: t } },
          })),
        },
      },
    });
  }

  console.log("🎉 Seeding done!");
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
