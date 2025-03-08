# demo app - developing with Docker

This demo app shows a simple user profile app set up using 
- index.html with pure js and css styles
- nodejs backend with express module
- mongodb for data storage

All components are docker-based

## With Docker
### 1. Pull the mongo and mongo-express images from Dockerhub
    docker pull mongo:4.2.1
    docker pull mongo-express:0.49

### 2. Create docker network
     docker network create mongo-network 
_NOTE: creating docker-network in optional. You can start both containers in a default network. In this case, just emit `--net` flag in `docker run` command_

### 3. Check the network list
    docker network ls

### 4. Start mongodb 
    docker run -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password --name mongodb --net mongo-network mongo:4.2.1
    
### 5. Start mongo-express
    docker run -d -p 8081:8081 -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin -e ME_CONFIG_MONGODB_ADMINPASSWORD=password --net mongo-network --name mongo-express -e ME_CONFIG_MONGODB_SERVER=mongodb mongo-express:0.49

### 6. Open mongo-express from browser
     http://localhost:8081

### 7. Start your nodejs application locally - go to `app` directory of project 
    npm install 
    node server.js

### 8. Access you nodejs application UI from browser
    http://localhost:3000

### 9. create `user-account` _db_ and `users` _collection_ in mongo-express

### 10. 'Edit Profile' and make changes.

### 11. Reload mongo express. Data appears in mongo-express. Reload the html page also persists the data changes.

## With Docker Compose

### 1. Stop all the containers running in previous steps

### 2. Add mongo and mongo-express containers to the services in docker-compose

### 3. Start mongodb and mongo-express
    docker compose up

### 4. Access the mongo-express
    http://localhost:8080

### 5. Start node server 
    node server.js

### 6. Access the nodejs application from browser
    http://localhost:3000

### 7. In mongo-express, create a new database "my-db", then a new collection "users" in "my-db"

### 8. 'Edit Profile' and make changes.

### 9. Reload mongo express. Data appears in mongo-express. Reload the html page also persists the data changes.

### 10. Stop mongodb and mongo-express containers in docker-compose.
    docker compose down
- Takes down the containers as well as the network.
  
#### To build a docker image from the application

    docker build -t my-app:1.0 .       
    
The dot "." at the end of the command denotes location of the Dockerfile.
