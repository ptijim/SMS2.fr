FROM node:18-alpine

RUN apk add --no-cache git

WORKDIR /app

# Clone Textbelt
RUN git clone https://github.com/typpo/textbelt.git

WORKDIR /app/textbelt
RUN npm install

WORKDIR /app
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 9090

CMD ["/entrypoint.sh"]