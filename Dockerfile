FROM ruby:2.4-alpine

RUN apk add --no-cache build-base gcc bash \
    && gem install jekyll

EXPOSE 4000

WORKDIR /workspace

COPY docker-entrypoint.sh /usr/local/bin/

# on every container start we'l'
ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD [ "bundle", "exec", "jekyll", "build" ]
