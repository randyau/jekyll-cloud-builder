FROM ruby:3.0-bullseye

RUN apk add --no-cache build-base gcc bash \
    && gem install jekyll

EXPOSE 4000

WORKDIR /workspace

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD [ "bundle", "exec", "jekyll", "build" ]
