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
- `fullstack-productivity-suite` now provides one top-level Docker Compose stack for portfolio startup.

## Verified Local Stack

- The Symfony API runs in Docker with MySQL inside the suite-level stack.
- The React dashboard runs in Docker behind nginx and proxies `/api` to the Symfony API container.
- The Symfony client and invoice SaaS app runs fully in Docker with its own MySQL container.
- The Flutter task manager web preview is available as an optional Compose profile.
- The API includes a demo seed command that creates 2 users and 100 tasks.
- The SaaS app includes a demo seed command that creates 2 users, 6 clients, and 24 invoices.
- The dashboard has been verified against the live seeded API dataset.
- The Symfony client and invoice SaaS app has been verified with live Dockerized register, login, dashboard, and invoice form flows.
- The suite stack now auto-runs Symfony migrations on startup and auto-seeds demo data for both Symfony apps by default.

Demo credentials:

- `alex@example.com / Password123`
- `jamie@example.com / Password123`
- `owner@example.com / Password123`
- `finance@example.com / Password123`

---

## Tech Stack

- PHP / Symfony
- React / Vite / Sass
- Flutter / Dart
- MySQL
- Docker / nginx / Apache

## Full Stack Docker

Start the main portfolio stack:

```powershell
./docker-up.ps1
```

Stop it:

```powershell
./docker-down.ps1
```

The suite stack exposes:

- API: `http://localhost:8002`
- Dashboard: `http://localhost:3000`
- Symfony SaaS: `http://localhost:8085`
- Flutter web: `http://localhost:8080` when started with the `flutter` profile

The shared Docker network used by the stack is:

```text
portfolio_suite_network
```

### Optional Profiles

Start Flutter web preview too:

```powershell
docker compose --profile flutter up --build -d
```

Start the workspace tools container for repo retrieval and Docker-based builds:

```powershell
docker compose --profile tools up -d workspace-tools
docker exec -it fullstack-workspace-tools bash
```

The tools container includes `git` and the Docker CLI, with the workspace mounted at `/workspace` and the Docker socket mounted so it can retrieve repos and trigger image builds.

### Repo-Local Development

The repo-local `compose.yaml` and `docker-up.ps1` files still exist for isolated development inside each repository. Use the suite-level stack when you want one Docker Desktop app and one command to start the portfolio.

### Demo Data

The suite stack seeds both Symfony apps by default. To rerun them manually:

```powershell
docker compose exec symfony-task-api-app php bin/console app:seed-demo-data
docker compose exec symfony-client-invoice-saas-app php bin/console app:seed-demo-data
```
