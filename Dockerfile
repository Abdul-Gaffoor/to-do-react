# Use a multi-stage build for supporting different platforms
FROM --platform=$BUILDPLATFORM nginx AS builder

# Copy the app files
COPY build /usr/share/nginx/html

# Second stage for the final image
FROM nginx

# Copy the built files from the previous stage
COPY --from=builder /usr/share/nginx/html /usr/share/nginx/html

# Expose the default Nginx port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
