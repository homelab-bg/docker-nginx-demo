#!/bin/sh
set -e

echo "🚀 Starting nginx deployment..."
echo "Environment: ${ENVIRONMENT}"
echo "Version: ${APP_VERSION}"
echo "Host: ${DEPLOYMENT_HOST}"

# Process nginx configuration template
echo "📝 Processing nginx configuration..."
envsubst '${SERVER_NAME} ${ENVIRONMENT} ${APP_VERSION} ${DEPLOYMENT_HOST} ${CACHE_DURATION} ${DEPLOY_TIME} ${GIT_COMMIT}' \
    < /etc/nginx/templates/nginx.conf.template \
    > /etc/nginx/conf.d/default.conf

# Process HTML content template
echo "🎨 Processing HTML content..."
envsubst '${ENVIRONMENT} ${APP_VERSION} ${DEPLOYMENT_HOST} ${DEPLOY_TIME} ${GIT_COMMIT} ${BACKGROUND_COLOR} ${TEXT_COLOR} ${FEATURE_MESSAGE}' \
    < /usr/share/nginx/templates/index.html.template \
    > /usr/share/nginx/html/index.html

# Copy static assets
cp /usr/share/nginx/templates/styles.css /usr/share/nginx/html/

# Validate nginx configuration
echo "✅ Validating nginx configuration..."
nginx -t

echo "🎉 Starting nginx server..."
exec "$@"
