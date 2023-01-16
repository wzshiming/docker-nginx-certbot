FROM docker.io/library/nginx:1.21.4-alpine

RUN apk add --update certbot-nginx tzdata && \
    echo '0 1 * * * certbot renew --nginx' > /var/spool/cron/crontabs/root

COPY entrypoint.sh /entrypoint.sh
