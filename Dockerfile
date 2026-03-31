# Use official Nginx image
FROM nginx:latest

# Copy a simple HTML file into Nginx
COPY index.html /usr/share/nginx/html/index.html
