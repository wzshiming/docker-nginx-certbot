FROM docker.io/library/nginx:1.23.3-alpine

RUN apk add --update certbot-nginx tzdata

COPY crontabs /var/spool/cron/crontabs

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]