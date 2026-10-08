# Upstream's deployments/Dockerfile with these changes: the app folder is copied from app/
# (upstream's build context is the app folder itself), and the variables upstream's
# deployments/generate-env.sh writes to deployments/.dockers.env at `make install` (random user,
# password and JWT secret) are baked in with fixed values.
FROM docker.io/library/node:8.15.1-alpine
WORKDIR /
ADD app/ /
ENV SECRET=1813424919 \
    DB_HOST=mysqldb \
    DB_PORT=3306 \
    DB_DATABASE=a5db \
    DB_USER=User2373914027 \
    DB_PASSWORD=Pass1932627703
# To workaround 'not get uid/gid'
RUN npm config set unsafe-perm true
RUN apk update && \
    npm install package.json && \
    npm install -g gulp@3.9.1
CMD gulp && node src/app.js
