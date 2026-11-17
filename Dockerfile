FROM docker.io/searxng/searxng:latest

USER root
RUN apk add --no-cache caddy

COPY settings.yml /etc/searxng/settings.yml
COPY Caddyfile /etc/caddy/Caddyfile

EXPOSE 10000

CMD sh -c "caddy start --config /etc/caddy/Caddyfile && exec /usr/local/searxng/dockerfiles/docker-entrypoint.sh"
