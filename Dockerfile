FROM node:23.11.1-alpine AS builder

WORKDIR '/opt/webserver'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /opt/webserver/build /usr/share/nginx/html
