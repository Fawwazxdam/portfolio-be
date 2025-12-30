# API Documentation

## Overview
This is a REST API for a blog-like application built with Express.js and Prisma ORM, using MySQL as the database.

## Database Structure

### User Model
- `id`: Int (Primary Key, Auto Increment)
- `name`: String (Required)
- `email`: String (Required, Unique)
- `phone_number`: String (Required)
- `articles`: Relation to Article[]
- `projects`: Relation to Project[]
- `comments`: Relation to Comment[]
- `createdAt`: DateTime (Default: now())
- `updatedAt`: DateTime (Updated At)

### Article Model
- `id`: Int (Primary Key, Auto Increment)
- `title`: String (Required)
- `slug`: String (Required, Unique)
- `content`: Text (Required)
- `published`: Boolean (Default: false)
- `author`: Relation to User
- `authorId`: Int (Foreign Key)
- `comments`: Relation to Comment[]
- `tags`: Relation to ArticleTag[]
- `createdAt`: DateTime (Default: now())
- `updatedAt`: DateTime (Updated At)

### Project Model
- `id`: Int (Primary Key, Auto Increment)
- `title`: String (Required)
- `slug`: String (Required, Unique)
- `description`: Text (Optional)
- `content`: String (Optional)
- `published`: Boolean (Default: false)
- `demoUrl`: String (Optional)
- `githubUrl`: String (Optional)
- `technologies`: Json (Optional, Array of strings)
- `author`: Relation to User
- `authorId`: Int (Foreign Key)
- `tags`: Relation to ProjectTag[]
- `createdAt`: DateTime (Default: now())
- `updatedAt`: DateTime (Updated At)

### Comment Model
- `id`: Int (Primary Key, Auto Increment)
- `content`: String (Required)
- `author`: Relation to User
- `authorId`: Int (Foreign Key)
- `article`: Relation to Article
- `articleId`: Int (Foreign Key)
- `createdAt`: DateTime (Default: now())
- `updatedAt`: DateTime (Updated At)

### Tag Model
- `id`: Int (Primary Key, Auto Increment)
- `name`: String (Required, Unique)
- `slug`: String (Required, Unique)
- `articleTags`: Relation to ArticleTag[]
- `projectTags`: Relation to ProjectTag[]

### ArticleTag Model (Junction Table)
- `article`: Relation to Article
- `articleId`: Int (Foreign Key)
- `tag`: Relation to Tag
- `tagId`: Int (Foreign Key)
- Primary Key: (articleId, tagId)

### ProjectTag Model (Junction Table)
- `project`: Relation to Project
- `projectId`: Int (Foreign Key)
- `tag`: Relation to Tag
- `tagId`: Int (Foreign Key)
- Primary Key: (projectId, tagId)

### Image Model
- `id`: Int (Primary Key, Auto Increment)
- `url`: String (Required)
- `alt`: String (Optional)
- `imageableType`: String (Required, "Article" or "Project")
- `imageableId`: Int (Required)
- `createdAt`: DateTime (Default: now())
- `updatedAt`: DateTime (Updated At)

## API Implementation

### Base URL
The API is served at `http://localhost:4000` by default (configurable via `PORT` environment variable).

### Middleware
- **Helmet**: Security headers
- **CORS**: Cross-Origin Resource Sharing
- **Rate Limiting**: 100 requests per minute
- **JSON Parser**: Parses incoming JSON requests

### Endpoints

#### Articles

##### GET /api/articles
Retrieves all articles with author, comments, and tags included. Supports optional query parameters for filtering.
- **Method**: GET
- **Query Parameters** (optional):
  - `tag`: Filter by tag slug (e.g., `?tag=react`)
  - `year`: Filter by creation year (e.g., `?year=2023`)
  - `limit`: Limit the number of results (e.g., `?limit=5`)
  - `published`: Filter by published status (e.g., `?published=true`)
- **Response**: 200 OK
  ```json
  [
    {
      "id": 1,
      "title": "Sample Article",
      "slug": "sample-article",
      "content": "Article content...",
      "published": true,
      "author": {
        "id": 1,
        "name": "John Doe",
        "email": "john@example.com",
        "phone_number": "1234567890"
      },
      "comments": [...],
      "tags": [
        {
          "tag": {
            "id": 1,
            "name": "react",
            "slug": "react"
          }
        }
      ],
      "createdAt": "2023-01-01T00:00:00.000Z",
      "updatedAt": "2023-01-01T00:00:00.000Z"
    }
  ]
  ```

##### POST /api/articles
Creates a new article.
- **Method**: POST
- **Payload**:
  ```json
  {
    "title": "New Article",
    "content": "Article content here",
    "authorId": 1,
    "tags": ["javascript", "nodejs"]
  }
  ```
- **Response**: 200 OK
  ```json
  {
    "id": 2,
    "title": "New Article",
    "slug": "new-article",
    "content": "Article content here",
    "published": false,
    "authorId": 1,
    "tags": [
      {
        "tag": {
          "id": 2,
          "name": "javascript",
          "slug": "javascript"
        }
      }
    ],
    "createdAt": "2023-01-01T00:00:00.000Z",
    "updatedAt": "2023-01-01T00:00:00.000Z"
  }
  ```

##### GET /api/articles/:id
Retrieves a single article by ID with author, comments, and tags.
- **Method**: GET
- **Parameters**: `id` (Number)
- **Response**: 200 OK or 404 Not Found
  ```json
  {
    "id": 1,
    "title": "Sample Article",
    "slug": "sample-article",
    "content": "Article content...",
    "published": true,
    "author": {
      "id": 1,
      "name": "John Doe",
      "email": "john@example.com",
      "phone_number": "1234567890"
    },
    "comments": [
      {
        "id": 1,
        "content": "Great article!",
        "author": {
          "id": 2,
          "name": "Jane Smith",
          "email": "jane@example.com",
          "phone_number": "0987654321"
        },
        "createdAt": "2023-01-01T00:00:00.000Z"
      }
    ],
    "tags": [...],
    "createdAt": "2023-01-01T00:00:00.000Z",
    "updatedAt": "2023-01-01T00:00:00.000Z"
  }
  ```

##### PUT /api/articles/:id
Updates an existing article.
- **Method**: PUT
- **Parameters**: `id` (Number)
- **Payload**:
  ```json
  {
    "title": "Updated Title",
    "content": "Updated content",
    "published": true,
    "tags": ["updated-tag", "another-tag"]
  }
  ```
- **Response**: 200 OK
  ```json
  {
    "id": 1,
    "title": "Updated Title",
    "slug": "sample-article",
    "content": "Updated content",
    "published": true,
    "authorId": 1,
    "createdAt": "2023-01-01T00:00:00.000Z",
    "updatedAt": "2023-01-01T00:00:00.000Z"
  }
  ```

##### DELETE /api/articles/:id
Deletes an article by ID.
- **Method**: DELETE
- **Parameters**: `id` (Number)
- **Response**: 200 OK
  ```json
  {
    "message": "Article deleted"
  }
  ```

#### Projects

##### GET /api/projects
Retrieves all projects with author and tags included. Supports optional query parameters for filtering.
- **Method**: GET
- **Query Parameters** (optional):
  - `tag`: Filter by tag slug (e.g., `?tag=react`)
  - `year`: Filter by creation year (e.g., `?year=2023`)
  - `limit`: Limit the number of results (e.g., `?limit=5`)
  - `published`: Filter by published status (e.g., `?published=true`)
- **Response**: 200 OK
  ```json
  [
    {
      "id": 1,
      "title": "Sample Project",
      "slug": "sample-project",
      "description": "Project description...",
      "content": "Project content...",
      "published": true,
      "demoUrl": "https://demo.example.com",
      "githubUrl": "https://github.com/user/repo",
      "technologies": ["React", "Node.js"],
      "author": {
        "id": 1,
        "name": "John Doe",
        "email": "john@example.com",
        "phone_number": "1234567890"
      },
      "tags": [
        {
          "tag": {
            "id": 1,
            "name": "react",
            "slug": "react"
          }
        }
      ],
      "createdAt": "2023-01-01T00:00:00.000Z",
      "updatedAt": "2023-01-01T00:00:00.000Z"
    }
  ]
  ```

##### POST /api/projects
Creates a new project.
- **Method**: POST
- **Payload**:
  ```json
  {
    "title": "New Project",
    "description": "Project description",
    "content": "Project content",
    "demoUrl": "https://demo.example.com",
    "githubUrl": "https://github.com/user/repo",
    "technologies": ["React", "Node.js"],
    "authorId": 1,
    "tags": ["javascript", "react"]
  }
  ```
- **Response**: 200 OK
  ```json
  {
    "id": 2,
    "title": "New Project",
    "slug": "new-project",
    "description": "Project description",
    "content": "Project content",
    "published": false,
    "demoUrl": "https://demo.example.com",
    "githubUrl": "https://github.com/user/repo",
    "technologies": ["React", "Node.js"],
    "authorId": 1,
    "tags": [
      {
        "tag": {
          "id": 2,
          "name": "javascript",
          "slug": "javascript"
        }
      }
    ],
    "createdAt": "2023-01-01T00:00:00.000Z",
    "updatedAt": "2023-01-01T00:00:00.000Z"
  }
  ```

##### GET /api/projects/:id
Retrieves a single project by ID with author and tags.
- **Method**: GET
- **Parameters**: `id` (Number)
- **Response**: 200 OK or 404 Not Found
  ```json
  {
    "id": 1,
    "title": "Sample Project",
    "slug": "sample-project",
    "description": "Project description...",
    "content": "Project content...",
    "published": true,
    "demoUrl": "https://demo.example.com",
    "githubUrl": "https://github.com/user/repo",
    "technologies": ["React", "Node.js"],
    "author": {
      "id": 1,
      "name": "John Doe",
      "email": "john@example.com",
      "phone_number": "1234567890"
    },
    "tags": [...],
    "createdAt": "2023-01-01T00:00:00.000Z",
    "updatedAt": "2023-01-01T00:00:00.000Z"
  }
  ```

##### PUT /api/projects/:id
Updates an existing project.
- **Method**: PUT
- **Parameters**: `id` (Number)
- **Payload**:
  ```json
  {
    "title": "Updated Title",
    "description": "Updated description",
    "content": "Updated content",
    "published": true,
    "demoUrl": "https://updated-demo.example.com",
    "githubUrl": "https://github.com/user/updated-repo",
    "technologies": ["React", "Express"],
    "tags": ["updated-tag", "another-tag"]
  }
  ```
- **Response**: 200 OK
  ```json
  {
    "id": 1,
    "title": "Updated Title",
    "slug": "sample-project",
    "description": "Updated description",
    "content": "Updated content",
    "published": true,
    "demoUrl": "https://updated-demo.example.com",
    "githubUrl": "https://github.com/user/updated-repo",
    "technologies": ["React", "Express"],
    "authorId": 1,
    "createdAt": "2023-01-01T00:00:00.000Z",
    "updatedAt": "2023-01-01T00:00:00.000Z"
  }
  ```

##### DELETE /api/projects/:id
Deletes a project by ID.
- **Method**: DELETE
- **Parameters**: `id` (Number)
- **Response**: 200 OK
  ```json
  {
    "message": "Project deleted"
  }
  ```

#### Images

##### GET /api/images
Retrieves all images.
- **Method**: GET
- **Response**: 200 OK
  ```json
  [
    {
      "id": 1,
      "url": "https://example.com/image.jpg",
      "alt": "Sample image",
      "imageableType": "Article",
      "imageableId": 1,
      "createdAt": "2023-01-01T00:00:00.000Z",
      "updatedAt": "2023-01-01T00:00:00.000Z"
    }
  ]
  ```

##### POST /api/images
Creates a new image.
- **Method**: POST
- **Payload**:
  ```json
  {
    "url": "https://example.com/new-image.jpg",
    "alt": "New image",
    "imageableType": "Project",
    "imageableId": 1
  }
  ```
- **Response**: 200 OK
  ```json
  {
    "id": 2,
    "url": "https://example.com/new-image.jpg",
    "alt": "New image",
    "imageableType": "Project",
    "imageableId": 1,
    "createdAt": "2023-01-01T00:00:00.000Z",
    "updatedAt": "2023-01-01T00:00:00.000Z"
  }
  ```

##### GET /api/images/:id
Retrieves a single image by ID.
- **Method**: GET
- **Parameters**: `id` (Number)
- **Response**: 200 OK or 404 Not Found
  ```json
  {
    "id": 1,
    "url": "https://example.com/image.jpg",
    "alt": "Sample image",
    "imageableType": "Article",
    "imageableId": 1,
    "createdAt": "2023-01-01T00:00:00.000Z",
    "updatedAt": "2023-01-01T00:00:00.000Z"
  }
  ```

##### PUT /api/images/:id
Updates an existing image.
- **Method**: PUT
- **Parameters**: `id` (Number)
- **Payload**:
  ```json
  {
    "url": "https://example.com/updated-image.jpg",
    "alt": "Updated alt text"
  }
  ```
- **Response**: 200 OK
  ```json
  {
    "id": 1,
    "url": "https://example.com/updated-image.jpg",
    "alt": "Updated alt text",
    "imageableType": "Article",
    "imageableId": 1,
    "createdAt": "2023-01-01T00:00:00.000Z",
    "updatedAt": "2023-01-01T00:00:00.000Z"
  }
  ```

##### DELETE /api/images/:id
Deletes an image by ID.
- **Method**: DELETE
- **Parameters**: `id` (Number)
- **Response**: 200 OK
  ```json
  {
    "message": "Image deleted"
  }
  ```

#### Comments

##### POST /api/comments
Creates a new comment.
- **Method**: POST
- **Payload**:
  ```json
  {
    "articleId": 1,
    "authorId": 2,
    "content": "This is a great article!"
  }
  ```
- **Response**: 200 OK
  ```json
  {
    "id": 1,
    "content": "This is a great article!",
    "authorId": 2,
    "articleId": 1,
    "createdAt": "2023-01-01T00:00:00.000Z",
    "updatedAt": "2023-01-01T00:00:00.000Z"
  }
  ```

##### GET /api/comments/article/:id
Retrieves all comments for a specific article.
- **Method**: GET
- **Parameters**: `id` (Article ID, Number)
- **Response**: 200 OK
  ```json
  [
    {
      "id": 1,
      "content": "This is a great article!",
      "author": {
        "id": 2,
        "name": "Jane Smith",
        "email": "jane@example.com",
        "phone_number": "0987654321"
      },
      "articleId": 1,
      "createdAt": "2023-01-01T00:00:00.000Z",
      "updatedAt": "2023-01-01T00:00:00.000Z"
    }
  ]
  ```

##### DELETE /api/comments/:id
Deletes a comment by ID.
- **Method**: DELETE
- **Parameters**: `id` (Number)
- **Response**: 200 OK
  ```json
  {
    "message": "Comment deleted"
  }
  ```

### Running the Server
- Start the server: `npm start` or `node src/server.js`
- The server will run on the specified port (default: 4000)

### Database Setup
- Uses Prisma ORM with MySQL
- Run migrations: `npx prisma migrate dev`
- Seed database: `npx prisma db seed`