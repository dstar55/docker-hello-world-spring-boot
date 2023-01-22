Hello World sample shows how to deploy [SpringBoot](http://projects.spring.io/spring-boot/) RESTful web service application with [Docker](https://www.docker.com/) and with [Kubernetes](https://kubernetes.io/)

#### Prerequisite 

Installed:   
[Docker](https://www.docker.com/)   
[git](https://www.digitalocean.com/community/tutorials/how-to-contribute-to-open-source-getting-started-with-git)   

Optional:   
[Docker-Compose](https://docs.docker.com/compose/install/)   
[Java 1.8 or 11.1](https://www.oracle.com/technetwork/java/javase/overview/index.html)   
[Maven 3.x](https://maven.apache.org/install.html)


#### Steps

##### Clone source code from git
```
git clone https://github.com/dstar55/docker-hello-world-spring-boot .
```

##### Build Docker image
```
docker build -t="hello-world-java" .
```
Maven build will be executes during creation of the docker image.

>Note:if you run this command for first time it will take some time in order to download base image from [DockerHub](https://hub.docker.com/)

##### Run Docker Container
```
docker run -p 8080:8080 -it --rm hello-world-java
```

##### Test application

```
curl localhost:8080
```

response should be:
```
Hello World
```

#####  Stop Docker Container:
```
docker stop `docker container ls | grep "hello-world-java:*" | awk '{ print $1 }'`
```

### Run with docker-compose 

Build and start the container by running 

```
docker-compose up -d 
```

#### Test application with ***curl*** command

```
curl localhost:8080
```

response should be:
```
Hello World
```

##### Stop Docker Container:
```
docker-compose down
```

### Deploy under the Kuberenetes cluster

#### Prerequisite

##### MiniKube

Installed:
[MiniKube](https://www.digitalocean.com/community/tutorials/how-to-use-minikube-for-local-kubernetes-development-and-testing)

Start minikube with command:
```
minikube start
```


#### Retrieve and deploy application

```
kubectl create deployment hello-spring-boot --image=dstar55/docker-hello-world-spring-boot:latest
```

#### Expose deployment as a Kubernetes Service
```
kubectl expose deployment hello-spring-boot --type=NodePort --port=8080
```

#### Check whether the service is running
```
kubectl get service hello-spring-boot
```

response should something like:
```
NAME                TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
hello-spring-boot   NodePort   xx.xx.xxx.xxx   <none>        8080:xxxxx/TCP   59m
```

#### Retrieve URL for application(hello-spring-boot)
```
minikube service hello-spring-boot --url
```

response will be http..., e.g:
```
http://127.0.0.1:44963
```

#### Test application with ***curl*** command(note: port is randomly created)

```
curl 127.0.0.1:44963
```

response should be:
```
Hello World
```
