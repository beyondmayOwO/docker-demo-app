# [K8s in 1 hour](https://youtu.be/s_o8dwzRlu4?si=3crrMoD8GpdwRSFh)

## K8s manifest files
- mongo-config.yaml
- mongo-secret.yaml
- mongo.yaml
- webapp.yaml

<p align="center">
  <img src="https://github.com/user-attachments/assets/0b67e8c9-08b9-4bb9-ace0-d72c528025de" alt="Image 1" width="45%" />
  <img src="https://github.com/user-attachments/assets/db6f6ca5-bba8-4875-b696-c1fb3b446191" alt="Image 2" width="45%" />
</p>

---

<details>
 <summary>K8s Commands</summary>
 <br>

 | | Command | Description |
 | --------------- | --------------- | --------------- |
 | 1 | - Install minikube for linux. [Guide](https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download) <br><br> - `minikube start --driver docker` <br><br> - `minikube status` <br><br> _`kubectl` is installed as dependency. No need to install separately. `kubectl`: Configuring minikube cluster. `minikube cli`: start up/deleting the cluster_ | Setup minikube and kubectl |
 | 2 | <img src="https://github.com/user-attachments/assets/bc1903b0-5429-4bb8-8faa-c589a5f0b552" width="350"/> | mongo-config.yaml |
 | 3 | <img src="https://github.com/user-attachments/assets/faf5cdd8-2a3d-48a2-af39-b7230665f616" width="250"/> <br> **Base64 encoding for secret** <br><br> - `echo -n mongouser \| base64` <br> - `echo -n mongopassword \| base64` | mongo-secret.yaml |
 | 4 | <img src="https://github.com/user-attachments/assets/dac24d12-d644-4344-b108-acfcbc5f45f9" width="350"/> <br><br> **Label** <br> <img src="https://github.com/user-attachments/assets/0ed5ed21-e233-4b04-a338-5b9ea41d4d0a" width="350"/> <br><br> **matchLabels** <br> <img src="https://github.com/user-attachments/assets/41aa3d1c-6620-4fcb-b58d-3eef929b0955" width="350"/> | mongo-deployment in mongo.yaml |
 | 5 | <img src="https://github.com/user-attachments/assets/80219922-be48-4b53-bbdb-06cf818e1d14" width="350"/> <br><br> _Common practice to set the same port for `port` and `targetPort` to make it easier. `27017` for both._ | mongo-service in mongo.yaml |
 | 6 | The same as `mongo.yaml` except `label`, `port`, `targetPort`. `3000` for ports. | webapp.yaml for deployment and service |
 | 7 | **Assign the secret data to mongo generated root username and password as environment varariables** <br> <img src="https://github.com/user-attachments/assets/42876111-5328-4859-83e1-e63defc525cc" width="250"/> | Pass the secret data to mongo.yaml |
 | 8 | <img src="https://github.com/user-attachments/assets/3fc8d87f-5170-41fc-bacc-80a7c8f0480d" width="250"/> | Pass the secret data and configmap data to webapp.yaml |
 | 9 | <img src="https://github.com/user-attachments/assets/91757c5b-ae02-4470-9dd9-7caf15544dd4" width="350"/> | Configure external service in webapp-service to make it accessible from the outside |
 | 10 | **Start minikube** <br> - `minikube status` <br> - `minikube start --driver docker` <br><br> **Deploy from the configuration files** <br> - `kubectl apply -f mongo-config.yaml` <br> - `kubectl apply -f mongo-secret.yaml` <br> - `kubectl apply -f mongo.yaml` <br> - `kubectl apply -f webapp.yaml` | Deploy the services |
 | 11 | - `kubectl get all` <br> - `kubectl get configmap` <br> - `kubectl get secret` <br> - `kubectl get node` <br> - `kubectl get pod` <br> - `kubectl get svc` | Get basic infos about K8s components |
 | 12 | - `kubectl describe svc {svc-name}` <br> - `kubectl describe pod {pod-name}` | Get detailed infos about components |
 | 13 | **Get the logs** <br> - `kubectl logs {pod-name}` <br><br> **Screen the logs** <br> - `kubectl logs {pod-name} -f` | Get application logs |
 | 14 | `minikube stop` | Stop the minikube cluster |

 ---
 
 --- Summary of the Commands ---
 <br>

  | | Command | Description |
  | --------------- | --------------- | --------------- |
  | 1 | **Create Deployment** <br> `kubectl create deployment [name]` <br><br> **Edit Deployment** <br> `kubectl edit deployment [name]` <br><br> **Delete Deployment** <br> `kubectl delete deployment [name]` | CURD Commands |
  | 2 | `kubectl get nodes \| pod \| services \| replicaset \| deployment` | Status of different K8s components |
  | 3 | **Log to Console** <br> `kubectl logs [pod-name]` <br><br> **Get Interactive Terminal** <br> `kubectl exec -it [pod name] -- bin/bash` <br><br> **Get info about pod** <br> `kubectl describe pod [pod name]` | Debugging pods |
  | 4 | **Apply a configuration file** <br> `kubectl apply -f [file name]` <br><br> **Delete with Configuration File** <br> `kubectl delete -f [file name]` | Use configuration file for CRUD |

 ---
 
 --- Other Concepts ---
 <br>

  | | Command | Description |
  | --------------- | --------------- | --------------- |
  | 1 | **List the namespaces** <br> `kubectl get namespace` <br><br> **Create a namespace in command line** <br> `kubectl create namespace [namespace name]` <br><br> **Set the default namespace for the following contexts** <br> `kubectl config set-context --current --namespace=[namespace name]` | Namespaces |
  | 2 | `kubectl get nodes \| pod \| services \| replicaset \| deployment` | Status of different K8s components |
  | 3 | **Log to Console** <br> `kubectl logs [pod-name]` <br><br> **Get Interactive Terminal** <br> `kubectl exec -it [pod name] -- bin/bash` <br><br> **Get info about pod** <br> `kubectl describe pod [pod name]` | Debugging pods |
  | 4 | **Apply a configuration file** <br> `kubectl apply -f [file name]` <br><br> **Delete with Configuration File** <br> `kubectl delete -f [file name]` | Use configuration file for CRUD |
</details>
