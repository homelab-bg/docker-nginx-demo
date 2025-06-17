FROM nginx:alpine

# Install envsubst for template processing
RUN apk add --no-cache gettext

# Copy nginx template and entrypoint (now from docker/ subdirectory)
COPY docker/nginx.conf.template /etc/nginx/templates/
COPY docker/entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Copy content templates (from content/ directory in repo root)
COPY content/ /usr/share/nginx/templates/

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
