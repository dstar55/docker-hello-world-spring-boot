Hello World sample shows how to deploy [SpringBoot](http://projects.spring.io/spring-boot/) RESTful web service application with [Docker](https://www.docker.com/)

#### Prerequisite

Installed: [Docker](https://www.docker.com/), [Java 1.8 or 1.11](https://www.oracle.com/technetwork/java/javase/overview/index.html), [Maven 3.x](https://maven.apache.org/install.html), [git](https://www.digitalocean.com/community/tutorials/how-to-contribute-to-open-source-getting-started-with-git), optional [Docker-Compose](https://docs.docker.com/compose/install/)

#### Steps

##### Clone source code from git
```
$  git clone https://github.com/dstar55/docker-hello-world-spring-boot .
```

##### Build Docker image
```
$ docker build -t="hello-world-java" .
```
This will first run maven build to create jar package and then build hello-world image using built jar package.

>Note:if you run this command for first time it will take some time in order to download base image from [DockerHub](https://hub.docker.com/)

##### Run Docker Container
```
$ docker run -p 8080:8080 -it --rm hello-world-java
```

##### Test application

```
$ curl localhost:8080
```

the respone should be:
```
Hello World
```

#####  Stop Docker Container:
```
docker stop `docker container ls | grep "hello-world-java:*" | awk '{ print $1 }'`
```

## Run with docker-compose 

Build and start the container by running 

```
$ docker-compose up -d 
```

##### Test application with command

```
$ curl localhost:8080
```

the respone should be:
```
Hello World
```

##### Stop Docker Container:
```
docker-compose down
```
