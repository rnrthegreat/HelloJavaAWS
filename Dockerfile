# Use the official Nginx image as the base image
FROM nginx:alpine

# Set the working directory in the container
WORKDIR /usr/share/nginx/html

# Copy the contents of the website into the working directory
# Replace "./site" with the directory where your static files are located
COPY ./site1 /usr/share/nginx/html

# Expose port 80 to access the site
EXPOSE 80

# Start Nginx server (default command is already set in nginx:alpine)
