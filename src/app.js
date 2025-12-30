const express = require("express");
const cors = require("cors");
const helmet = require("helmet");
const rateLimit = require("express-rate-limit");

const articleRoutes = require("./routes/articles");
const projectRoutes = require("./routes/projects");
const imageRoutes = require("./routes/images");
const commentRoutes = require("./routes/comments");

const app = express();

app.use(helmet());
app.use(cors());
app.use(express.json());
app.use(rateLimit({ windowMs: 60000, max: 100 }));

app.get("/", (req, res) => {
    res.send("Hello World!");
});

app.use("/api/articles", articleRoutes);
app.use("/api/projects", projectRoutes);
app.use("/api/images", imageRoutes);
app.use("/api/comments", commentRoutes);

module.exports = app;
