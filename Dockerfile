# Start from the official, lightweight Alpine Linux image pre-packaged with Node.js version 20
FROM node:20-alpine

# Create a directory inside the container and set it as the working location for all subsequent commands
WORKDIR /usr/src/app

# Copy ONLY the package.json and package-lock.json files from your Mac into the container first
# PURPOSE: We do this before copying the code to leverage Docker's layer caching. If your code changes but dependencies don't, Docker skips the slow 'npm install' step.
COPY package*.json ./

# Execute the Node package manager to install the dependencies listed in package.json inside the container
RUN npm install

# Copy all the remaining application source code (like server.js) from your Mac into the container's working directory
COPY . .

# Document that this container is designed to listen for network traffic on port 3000
EXPOSE 3000

# Define the default command to execute when the container starts running
CMD ["node", "server.js"]
