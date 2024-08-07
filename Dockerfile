# Use the official Node.js image as the base image
FROM node:16-alpine3.18 AS base

# Set the working directory inside the container
WORKDIR /client

# Install the dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . /client

# Expose the application port (adjust if your app runs on a different port)
EXPOSE 3000

# Start the application
CMD ["npm", "start"]

#Stage1:Run Test
FROM base AS test
#run test
RUN  npm test


#Stage2 : Build 
FROM base AS build
#Run build command for production 
RUN npm build