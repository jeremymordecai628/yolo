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
   ## Summary
  