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

## Jenkins (CI/CD)
<details>
 <summary>GUI Based</summary>
 <br>
 --- <a href="https://youtu.be/pMO26j2OUME?si=esENpKJteUtMDoHS">Set Up</a> ---
 <br>
   
 | | Command | Description |
 | --------------- | --------------- | --------------- |
 | 1 | `docker run -p 8080:8080 -p 50000:50000 [master/slave communication] -d -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts` | Run the jenkins container |
 | 2 | `docker logs` | See the admin password generated |
 | 3 | `localhost:8080` | Create an admin account |

 --- <a href="https://youtu.be/tuxO7ZXplRE?si=Xflhhb4-xfHwvMc5">Create Multibranch Pipeline</a> ---
 
 | | Command | Description |
 | --------------- | --------------- | --------------- |
 | 1 | | Click 'new item'/'create new job' |
 | 2 | | Add the name, choose 'multibranch pipeline' and save |
 | 3 | | In 'Branch sources', choose 'git'. |
 | 4 | | Clone the project repo using https and paste it in 'project repository' |
 | 5 | | Behaviours > Discover branches > add > Filter by name (with regular expression) to choose which branches to track |
 | 6 | `.*` <br> `^dev\|master\|feature.*$` | Track all branches <br> Track only the branches selected |
 | 7 | | Create credentials for the pipeline created |
 | 8 | | Add the credentials in the configuration |
 | 9 | | save and it will scan right away for the branches|

 --- <a href="https://youtu.be/MY1w7sWW5ms?si=J7D8YJ12CX605HXG">Jenkinsfile - Jenkins Pipeline</a>

 | | Command | Description |
 | --------------- | --------------- | --------------- |
 | 1 | | Create Jenkinsfile in branch and scan |
 | 2 | `my-pipeline > branches > dev > stages` | Check out the stages and their status |
 | 3 | `my-pipeline > dev > #1 > Replay` | Replay a pipeline (easy way instead of modifying Jenkinsfile, checkout and commit all over again) |
 | 4 | `my-pipeline > dev > #1 > Restart from stage` | Restart from specific stage (build, test, deploy, etc) |
</details>
