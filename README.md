# DevOps — Interview live session

## Application

Go HTTP server. Endpoints: `/` (HTML page), `/healthz` (health check).

```shell
go build -o server .
PORT=8080 MY_DOMAIN=example.com ./server
```

## Prerequisites

- Docker
- Helm 3
- Terraform 1.5+

---

### 1. Docker

Build the image and fix any errors. Then review and optimize the Dockerfile.

```shell
docker build -f .docker/Dockerfile -t devops-app .
docker run -p 8080:8080 -e MY_DOMAIN=test.com devops-app
```

---

### 2. Helm

Run `helm template .helm` — fix the error. Then:
- Each domain gets its own Deployment + Service + `MY_DOMAIN` env var

---

### 3. Terraform

Review `.terraform/main.tf` and refactor into a reusable module.

```shell
cd .terraform && terraform init -backend=false && terraform validate
```

---

### Bonus: GitLab CI/CD

Implement `.gitlab-ci.yml`: build & push image, validate helm chart, deploy & rollback
