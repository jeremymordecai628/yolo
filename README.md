# Requirements
Make sure that you have the following installed:
- [node](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-18-04) 
- npm 
- [MongoDB](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/) and start the mongodb service with `sudo service mongod start`

## Navigate to the Client Folder 
 `cd client`

## Run the folllowing command to install the dependencies 
 `npm install`

## Run the folllowing to start the app
 `npm start`

## Open a new terminal and run the same commands in the backend folder
 `cd ../backend`

 `npm install`

 `npm start`
 # Images
 - I created two versions of the  backend and client image 
## The link to the docker  backend  Repository
 - https://hub.docker.com/repository/docker/mjix/backend/general 
## The link to the docker  client   Repository
 - https://hub.docker.com/repository/docker/mjix/client/general
 ## Virtual machine   
 the ansible.cfg file and the  invetory file connects to a virtual machine using ansible 
 ## playbook
 -The playbook.yaml  uses the vars files to download docker and docker compose and also the file it self clones a repo  into the virtual machine 

 ### Go ahead a nd add a product (note that the price field only takes a numeric input)