# Сборка
FROM node:16-alpine as build

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

# Запустим на alpine
FROM nginx:1.27-alpine

COPY nginx.tmpl /etc/nginx/templates/default.conf.template
COPY --from=build /app/dist/frontend /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]