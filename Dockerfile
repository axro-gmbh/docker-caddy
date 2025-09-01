FROM caddy:2-alpine

# Tools to change the uid/gid at runtime
RUN echo http://dl-2.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories && \
    apk add --no-cache shadow su-exec

COPY entrypoint-chuid /usr/local/bin
COPY Caddyfile /etc/caddy/Caddyfile

ENTRYPOINT ["entrypoint-chuid"]
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
