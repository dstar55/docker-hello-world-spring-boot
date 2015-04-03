#pull base image
FROM dockerfile/java:oracle-java7

#maintainer 
MAINTAINER chris@chrisrichardson.net

#expose port 8080
EXPOSE 8080

#default command
CMD java -jar /data/hello-world-0.1.0.jar

#copy hello world to docker image
ADD ./data/hello-world-0.1.0.jar /data/hello-world-0.1.0.jar
