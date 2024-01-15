# Use an official NGINX base image
FROM nginx:latest

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy your HTML files and other assets to the container
COPY . .

# Expose port 80 for NGINX
EXPOSE 80

# The default command to start NGINX and serve the content
CMD ["nginx", "-g", "daemon off;"]
