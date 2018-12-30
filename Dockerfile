FROM nginx:alpine

ENV CERTBOT_VENSION=0.29.1

RUN apk add -U --no-cache py-pip 

RUN apk add --no-cache --virtual .certbot-deps \
    libffi \
    libssl1.0 \
    openssl \
    ca-certificates \
    binutils

RUN apk add --no-cache --virtual .build-deps \
    gcc \
    linux-headers \
    openssl-dev \
    musl-dev \
    libffi-dev \
    python2-dev

RUN wget https://codeload.github.com/certbot/certbot/tar.gz/v${CERTBOT_VENSION} -O certbot.tar.gz \
    && mkdir certbot \
    && tar -xz --strip-components 1 -C certbot -f certbot.tar.gz 

RUN pip install --upgrade --no-cache-dir pip \
    &&pip install --no-cache-dir \
        --editable /certbot/acme \
        --editable /certbot \
        --editable /certbot/certbot-nginx

RUN apk del .build-deps \
    && rm -f certbot.tar.gz
