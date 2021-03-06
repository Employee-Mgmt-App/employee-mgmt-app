#1 node image for building front end assets
FROM node:16.14.0 AS base

WORKDIR /app

COPY package.json .
COPY package-lock.json .

# nginx state for serving content
COPY . .
RUN npm install
RUN npm run build

#2 ngix stage to serve the front end assets
# nginx state for serving content
FROM nginx:latest
COPY nginx.conf /etc/nginx/nginx.conf
# Copy static assets from builder stage
COPY --from=base /app/dist/ /usr/share/nginx/html
EXPOSE 8080
# Containers run nginx with global directives and daemon off
CMD ["nginx", "-g", "daemon off;"]
