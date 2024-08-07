## 1. Choice of Base Image
 The base image used to build the containers is `node:16-alpine3.18`. It is derived from the Alpine Linux distribution, making it lightweight and compact. 
 Used 
 1. Client:`node:16-alpine3.18`
 2. Backend: `node:16-alpine3.18`
 3.Mongo : `mongo:6.0 `
       

## 2. Dockerfile directives used in the creation and running of each container.
  Dockerfile: TO build client
  dockerfile : To  build backend

**Client Dockerfile**

```
# Build stage
FROM node:16-alpine3.18 as build-stage
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

```
**Backend Dockerfile**

```
# Use the official Node.js image as the base image
FROM node:14-alpine3.18

# Set the working directory inside the container
WORKDIR /backend

# Install the dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . /backend
# Expose the application port (adjust if your app runs on a different port)
EXPOSE 5000

# Prune the node_modules directory to remove development dependencies and clears the npm cache and removes any temporary files
RUN npm prune --production && \
    npm cache clean --force && \
    rm -rf /tmp/*

# Start the application
CMD ["node", "serve"]

```

## 3. Docker Compose Networking
The (docker-compose.yml) defines the networking configuration for the project. It includes the allocation of application ports. The relevant sections are as follows:


```
services:
  backend:
    # ...
    ports:
      - "5000:5000"
    networks:
      - my_network

  client:
    # ...
    ports:
      - "3000:3000"
    networks:
      - my_network
  
  mongodb:
    # ...
    ports:
      - "27017:27017"
    networks:
      - my_network

networks:
  my_network:
    driver: bridge
```
In this configuration, the backend container is mapped to port 5000 of the host, the client container is mapped to port 3000 of the host, and mongodb container is mapped to port 27017 of the host. All containers are connected to the yolo-network bridge network.


## 4.  Docker Compose Volume Definition and Usage
The Docker Compose file includes volume definitions for MongoDB data storage. The relevant section is as follows:

yaml

```
volumes:
  mongo-data:  # Define Docker volume for MongoDB data
    driver: local

```
This volume, mongodb-data, is designated for storing MongoDB data. It ensures that the data remains intact and is not lost even if the container is stopped or deleted.

## 5. Git Workflow to achieve the task

To achieve the task the following git workflow was used:

1. Fork the repository from the original repository.
2. Clone the repo: `https://github.com/jeremymordecai628/yolo.git`
3. Create a .gitignore file to exclude unnecessary     files and directories from version control.
4. Added Dockerfile for the client to the repo:
`git add client/Dockerfile`
5. Add Dockerfile for the backend to the repo:
`git add backend/dockerfile2`
6. Committed the changes:
`git commit -m "Added Dockerfiles"`
7. Added docker-compose file to the repo:
`git add docker-compose.yml`
8. Committed the changes:
`git commit -m "Added docker-compose file"`
9. Pushed the files to github:
`git push `
10. Built the client and backend images:
`docker compose build`
11. Pushed the built imags to docker registry:
`docker compose push`
12. Deployed the containers using docker compose:
`docker compose up`
13. Updated  explanation.md
