# Use Node.js base image
FROM node:18-alpine

# Install Git
RUN apk add --no-cache git

# Install Repomix globally
RUN npm install -g repomix

# Set the working directory in the container
WORKDIR /app

# Default command to run Repomix in the container
CMD ["repomix"]
