# Overview

`fullstack-productivity-suite` is the top-level portfolio repository for a connected set of full-stack projects.

The suite is composed of four linked repositories:

- `symfony-client-invoice-saas`: a Symfony MVC application for client and invoice management
- `symfony-task-api-service`: a Symfony-based API for task management and shared backend logic
- `react-analytics-dashboard`: a React/Next.js dashboard that consumes the API for analytics and reporting
- `flutter-task-manager-app`: a Flutter mobile client that consumes the same API for task workflows

## Integration Flow

The API service is the shared integration point for the dashboard and mobile app. The Symfony SaaS application stands as a separate full-stack MVC example inside the same portfolio ecosystem.

## Purpose

This repository provides a portfolio-level entrypoint, architecture context, and cross-repository documentation for the full suite.
