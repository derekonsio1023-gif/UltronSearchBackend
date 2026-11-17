FROM docker.io/caddy:2-alpine AS caddy_builder

FROM docker.io/searxng/searxng:latest

USER root
COPY --from=caddy_builder /usr/bin/caddy /usr/bin/caddy

COPY settings.yml /etc/searxng/settings.yml
COPY Caddyfile /etc/caddy/Caddyfile

EXPOSE 10000

CMD sh -c "caddy start --config /etc/caddy/Caddyfile && exec /usr/local/searxng/dockerfiles/docker-entrypoint.sh"
