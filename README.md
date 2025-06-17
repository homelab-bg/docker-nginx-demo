# Demo Nginx App

A demon app showcasing environment-based deployment with GitHub Actions and containerised nginx.

## Features

- 🎨 **Environment-specific styling** - Different colors and themes per environment
- 📊 **Dynamic content** - Shows deployment info, git commit, and environment details
- 🔌 **API endpoints** - Health checks and deployment information
- 🚀 **Automated deployment** - GitHub Actions with self-hosted runners
- 🐳 **Containerized** - Docker and Docker Compose for consistency

## Quick Start

### Local Development
```bash
# Clone the repository
git clone https://github.com/homelab-bg/docker-nginx-demo.git
cd docker-nginx-demo

# Run development environment
cp .env.dev .env
docker-compose up -d --build

# View at http://localhost:8080
```
