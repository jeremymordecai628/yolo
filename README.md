# Requirements
Make sure that you have the following installed:
- [node](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-18-04) 
- npm 
- [MongoDB](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/) and start the mongodb service with `sudo service mongod start`

# Overview
This project involved the containerization and deployment of a full-stack yolo application using Docker.


# Requirements
Install the docker engine here:
- [Docker](https://docs.docker.com/engine/install/) 

## How to launch the application 
### Method 1 (faster)
- NOTE: This method does not require cloning of this repository

- Navigate to the launch_app folder and copy the contents of the [docker-compose.yaml] in the root of the project
- On your local machine, navigate to your desired directory and create
  a docker-compose.yaml file, paste the contents into it and save

  `touch docker-compose.yaml`

- Launch the application using docker compose up

  `docker compose up`

### Method 2
- NOTE: This requires cloning of this whole repository

- Clone this repository to your local machine

  `git clone https://github.com/jeremymordecai628/yolo.git`

- Navigate to the root directory of your cloned repository

  `cd yolo`

- Launch the application using the docker compose command

  `docker compose up`

## Access the application on your browser using the following URL
 `http://localhost:3000/`

## How to stop the application
- Navigate back to your terminal and press "ctrl+c" 

## How to terminate the application completely
 `docker compose down`

## The Docker images used in this application are sourced from this repository 
- https://hub.docker.com/repositories/mjix

# Screenshot  of  the project running 
![WhatsApp Image 2024-08-07 at 9 05 38 PM](https://github.com/user-attachments/assets/ae12a8c7-7ac2-44ec-a443-7f51a8d929f2)


# IP3

# Project Structure
    yolo/
    |
    |── playbook.yaml
    |── vars.yml
    |── hosts
    |── my_roles/
    │   ├── backend/
    │   │   └──tasks/
    │          └── main.yml
    │   │   
    │   ├── client/
    │   │   └── tasks/
    │   │       └── main.yml
    │   │   
    │   └── database/
    │        ├── tasks/
    │        │   └── main.yml
    │          
    └── Vagrantfile

# Summary Description and running of the project 
   ## Vangrant up command
   
  ![vagrannt up](https://github.com/user-attachments/assets/761a4df1-dfb9-415d-a93f-a38534567c08)


## YAML File Explanation

### Deployment

This section defines a Kubernetes Deployment for a backend application.

- **apiVersion: apps/v1**: Specifies the API version for the Deployment resource.
- **kind: Deployment**: Indicates that this is a Deployment resource.
- **metadata**:
  - **name: my_backend**: Names the Deployment "my_backend".
  - **labels**: Adds a label `app: backend` to the Deployment.
- **spec**:
  - **replicas: 3**: Specifies that three replicas (pods) of the application should be running.
  - **selector**:
    - **matchLabels**:
      - **app: backend**: Selects pods with the label `app: backend`.
  - **template**:
    - **metadata**:
      - **labels**:
        - **app: backend**: Adds the label `app: backend` to the pods.
    - **spec**:
      - **containers**:
        - **name: backend-container**: Names the container "backend-container".
        - **image: mjix/backend:V2.2**: Uses the Docker image `mjix/backend:V2.2`.
        - **resources**:
          - **limits**:
            - **memory: "256Mi"**: Limits the memory usage to 256 MiB.
            - **cpu: "500m"**: Limits the CPU usage to 500 millicores.
          - **requests**:
            - **memory: "128Mi"**: Requests 128 MiB of memory.
            - **cpu: "250m"**: Requests 250 millicores of CPU.
        - **ports**:
          - **containerPort: 5000**: Exposes port 5000 on the container.

### Service

This section defines a Kubernetes Service to expose the backend application.

- **apiVersion: v1**: Specifies the API version for the Service resource.
- **kind: Service**: Indicates that this is a Service resource.
- **metadata**:
  - **name: my_backend_service**: Names the Service "my_backend_service".
- **spec**:
  - **type: LoadBalancer**: Specifies that the Service type is LoadBalancer, which will expose the service externally.
  - **selector**:
    - **app: backend**: Selects pods with the label `app: backend`.
  - **ports**:
    - **port: 5000**: Exposes port 5000 on the Service.
    - **targetPort: 5000**: Forwards traffic to port 5000 on the pods.
    - **nodeport: 30100**: Exposes the Service on port 30100 on each node in the cluster.
