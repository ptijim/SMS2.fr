#!/bin/sh
set -e

: "${PORT:=9090}"
if [ -z "$REDIS_URL" ]; then
  echo "ERROR: REDIS_URL not set" >&2
  exit 1
fi

: "${SMTP_HOST:?Need SMTP_HOST}"
: "${SMTP_PORT:=587}"
: "${SMTP_SECURE:=false}"
: "${SMTP_USER:?Need SMTP_USER}"
: "${SMTP_PASS:?Need SMTP_PASS}"
: "${SMTP_FROM:=sms@localhost}"

cat > /app/textbelt/lib/config.js <<'EOF'
const nodemailer = require('nodemailer');

exports.mailOptions = { from: process.env.SMTP_FROM || 'sms@localhost' };

exports.transport = nodemailer.createTransport({
  host: process.env.SMTP_HOST,
  port: Number(process.env.SMTP_PORT || 587),
  secure: String(process.env.SMTP_SECURE || 'false') === 'true',
  auth: {
    user: process.env.SMTP_USER,
    pass: process.env.SMTP_PASS
  }
});

exports.throttle = {
  ip: { burst: 50, rate: 1 },
  phone: { burst: 10, rate: 0.5 }
};
EOF

echo "Starting Textbelt on port ${PORT} with Redis ${REDIS_URL} ..."
cd /app/textbelt
PORT="$PORT" REDIS_URL="$REDIS_URL" node server/app.js
