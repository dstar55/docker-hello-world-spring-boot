Hello World sample shows how to deploy [SpringBoot](http://projects.spring.io/spring-boot/) [RESTful web service](https://spring.io/understanding/REST) application with [Docker](https://www.docker.com/)

#### Prerequisite

Installed: Docker, Java 1.8, Maven 3.x

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

##### Run Docker image
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

## Run with docker-compose 

Build and start the container by running 

```
$ docker-compose up -d 
```

test application with 

```
$ curl localhost:8080
```

the respone should be:
```
Hello World
```
