FROM ruby:3.1.0-alpine3.15

LABEL maintainer="Sasha Klepikov <kai@list.ru>"

RUN set -xe \
    && apk add --no-cache \
        libstdc++ \
        sqlite-libs \
    && apk add --no-cache --virtual .build-deps \
        build-base \
        sqlite-dev \
    && gem install mailcatcher \
    && apk del .build-deps

EXPOSE 1025 1080

CMD ["mailcatcher", "--foreground",  "--no-quit", "--ip=0.0.0.0"]
