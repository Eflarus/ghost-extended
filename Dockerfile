FROM ghost:5.105.0-alpine
LABEL version="5.105.0-alpine"
LABEL name="ghost-extended"
RUN sed -i '84s/.*/"maxLength": 1500/' /var/lib/ghost/current/node_modules/@tryghost/admin-api-schema/lib/schemas/posts.json && sed -i '84s/.*/"maxLength": 1500/' /var/lib/ghost/current/node_modules/@tryghost/admin-api-schema/lib/schemas/pages.json && sed -i 's/customExcerpt||"",0,300/customExcerpt||"",0,1500/g' /var/lib/ghost/current/core/built/admin/assets/ghost-*.js && sed -i '89s/300/1500/' /var/lib/ghost/current/core/server/data/schema/schema.js && sed -i '424s/300/1500/' /var/lib/ghost/current/core/server/data/schema/schema.js
