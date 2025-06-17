FROM nginx:alpine

# Install envsubst for template processing
RUN apk add --no-cache gettext

# Copy nginx template and entrypoint
COPY nginx.conf.template /etc/nginx/templates/
COPY entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Copy content templates
COPY content/ /usr/share/nginx/templates/

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
