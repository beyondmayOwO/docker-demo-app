# demo app - developing with Docker

This demo app shows a simple user profile app set up using 
- index.html with pure js and css styles
- nodejs backend with express module
- mongodb for data storage

All components are docker-based

---

## Docker
<details>
     <summary>With Docker</summary>
 <br>
   
  |  | Command | Description |
  | --------------- | --------------- | --------------- |
  | 1 | `- docker pull mongo:4.2.1` <br> `- docker pull mongo-express:0.49` | Pull the mongo and mongo-express images from Dockerhub |
  | 2 | `docker network create mongo-network` | Create docker network |
  | 3 | `docker network ls` | Check the network list |
  | 4 | `docker run -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=admin` <br> `-e MONGO_INITDB_ROOT_PASSWORD=password --name mongodb` <br> `--net mongo-network mongo:4.2.1` | Start mongodb (optional, omit `--net` to use the default) |
  | 5 | `docker run -d -p 8081:8081 -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin` <br> `-e ME_CONFIG_MONGODB_ADMINPASSWORD=password ` <br> `--net mongo-network` <br> `--name mongo-express -e ME_CONFIG_MONGODB_SERVER=mongodb mongo-express:0.49` | Start mongo-express |
  | 6 | `http://localhost:8081` | Open mongo-express from browser |
  | 7 | `- npm install` <br> `- node server.js` | Start your nodejs application locally - go to `app` directory of project |
  | 8 | `http://localhost:3000` | Access you nodejs application UI from browser |
  | 9 | |create `user-account` _db_ and `users` _collection_ in mongo-express |
  | 10 | | 'Edit Profile' and make changes |
  | 11 | | Reload mongo express. Data appears in mongo-express. Reload the html page also persists the data changes. |
</details>

<details>
 <summary>With Docker Compose</summary>
 <br>

 | | Command | Description |
 | --------------- | --------------- | --------------- |
 | 1 | | Stop all the containers running in previous steps |
 | 2 | | Change 'mongoUrlLocal' to 'mongoUrlDocker' in server.js |
 | 3 | | Create Dockerfile and image for app |
 | 4 | | Add app, mongo, mongo-express containers to the services in docker-compose |
 | 5 | `docker compose up` | Start docker-compose |
 | 6 | `http://localhost:8080` | Access the mongo-express |
 | 7 | `http://localhost:3000` | Access the nodejs application |
 | 8 | | In mongo-express, create a new database "my-db", then a new collection "users" in "my-db" |
 | 9 | | 'Edit Profile' and make changes |
 | 10 | | Reload mongo express. Data appears in mongo-express. Reload the html page also persists the data changes |
 | 11 | `docker compose down` | Stop mongodb and mongo-express containers in docker-compose (_Takes down the containers as well as the network_) |
</details>

<details>
 <summary>Push An Image to The Cloud Container Registry (IBM Cloud)</summary>
 <br>

 | | Command | Description |
 | --------------- | --------------- | --------------- |
 | 1 | | Install ibm cloud CLI and register for the container registry and the region (_Follow the docs to push the image on the cloud registry page._) |
 | 2 | | Log in to the IBM Cloud |
 | 3 | `ibmcloud cr login` | Log in the docker to the cloud |
 | 4 | `docker tag my-app:1.0 us.icr.io/imagehub/my-app:1.0` | Tag the image |
 | 5 | `docker push us.icr.io/imagehub/my-app:1.0` | Push the image |
 | 6 | `ibmcloud cr image-list` | Verify |
</details>