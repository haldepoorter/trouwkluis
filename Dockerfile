FROM nginx:alpine

# Serveer de statische escape-room site
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80
