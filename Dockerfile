FROM ghost:5.75.0-alpine
LABEL version="5.75.0-alpine"
LABEL name="ghost-extended"
RUN sed -i '84s/.*/"maxLength": 1500/' /var/lib/ghost/current/node_modules/@tryghost/admin-api-schema/lib/schemas/posts.json && sed -i '84s/.*/"maxLength": 1500/' /var/lib/ghost/current/node_modules/@tryghost/admin-api-schema/lib/schemas/pages.json && sed -i 's/300)||(e.errors.add("customExcerpt","Excerpt cannot be longer than 300/1500)||(e.errors.add("customExcerpt","Excerpt cannot be longer than 1500/g' /var/lib/ghost/current/core/built/admin/assets/ghost-*.js && sed -i '88s/300/1500/' /var/lib/ghost/current/core/server/data/schema/schema.js
