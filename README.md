# Fullstack Productivity Suite

Portfolio entrypoint for a connected ecosystem of applications that share a
task API and demonstrate backend, frontend, mobile, and MVC product work.

## Projects

### Symfony SaaS

Client and invoice manager built as a Symfony MVC application.

https://github.com/deaxner/symfony-client-invoice-saas

### API Service

Symfony 6.4 task management API with JWT authentication, user-scoped task CRUD,
pagination, filtering, Docker support, CORS support, and a repeatable demo
seeder.

https://github.com/deaxner/symfony-task-api-service

### React Dashboard

React + Vite analytics dashboard that authenticates against the Symfony API,
derives task analytics client-side, supports dark mode, and ships with Docker +
nginx proxy integration.

https://github.com/deaxner/react-analytics-dashboard

### Flutter App

Flutter task manager client that consumes the same Symfony API for mobile and
web preview flows.

https://github.com/deaxner/flutter-task-manager-app

---

## Architecture

- `symfony-task-api-service` is the shared service layer.
- `react-analytics-dashboard` consumes the API for analytics, filtering, and reporting views.
- `flutter-task-manager-app` consumes the same API for task management workflows.
- `symfony-client-invoice-saas` is a separate Symfony MVC product in the same portfolio.

## Verified Local Stack

- The Symfony API runs in Docker with MySQL on the shared `task_api_network`.
- The React dashboard runs in Docker behind nginx and proxies `/api` to the Symfony API container.
- The API includes a demo seed command that creates 2 users and 100 tasks.
- The dashboard has been verified against the live seeded API dataset.

Demo credentials:

- `alex@example.com / Password123`
- `jamie@example.com / Password123`

---

## Tech Stack

- PHP / Symfony
- React / Vite / Sass
- Flutter / Dart
- MySQL
- Docker / nginx / Apache
