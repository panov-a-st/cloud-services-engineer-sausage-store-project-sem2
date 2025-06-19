# Сборка
FROM node:16-alpine as build

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

# Запустим на alpine
FROM nginx:1.28-alpine

COPY nginx.tmpl /etc/nginx/templates/default.conf.template
COPY --from=build /app/dist/frontend/ /usr/share/nginx/html

# Добавим healthcheck
HEALTHCHECK --interval=60s --timeout=5s CMD curl -f http://127.0.0.1/ || exit 1

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]