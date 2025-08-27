# Deploy on Railway

1. Create Project → Deploy from GitHub → this repo.
2. Add Redis service, copy connection URL.
3. Variables:
   - REDIS_URL
   - SMTP_HOST, SMTP_USER, SMTP_PASS
   - optional SMTP_FROM, SMTP_PORT, SMTP_SECURE
4. Deploy. Railway URL given.