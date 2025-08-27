# Textbelt (Open Source) Deploy Template

## Render deployment
1. Push this repo to GitHub.
2. On Render, create a new Blueprint from repo. It reads `render.yaml`.
3. Set env vars: REDIS_URL, SMTP_HOST, SMTP_USER, SMTP_PASS (+ optional SMTP_FROM).
4. Deploy → your URL will be https://<service>.onrender.com

## Railway deployment
1. Create a new Railway project, deploy from GitHub repo.
2. Add Redis service, copy URL to REDIS_URL.
3. Add SMTP_HOST, SMTP_USER, SMTP_PASS vars.
4. Deploy → get a Railway URL.

## Test
```bash
curl -X POST https://<your-service>/intl \
  -d number='+33612345678' \
  -d "message=Bonjour depuis Textbelt"
```