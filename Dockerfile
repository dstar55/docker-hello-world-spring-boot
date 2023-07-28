# build application with maven :: stage 1
FROM maven:3.9.3-amazoncorretto-17 AS maven_build
WORKDIR /tmp/
COPY pom.xml /tmp/
COPY src /tmp/src/
RUN mvn clean package
# RUN ls -ahl target

# run application with java :: stage 2
FROM eclipse-temurin:17
MAINTAINER cjsethu@local.com
EXPOSE 9090
# Copy image from previous stage
COPY --from=maven_build /tmp/target/hello-world-0.1.0.jar /app/hello-world.jar
ENV JAVA_OPTS="-Dserver.port=9090"
CMD java $JAVA_OPTS -jar /app/hello-world.jar
# ENTRYPOINT ["java", $JAVA_OPTS, "-jar", "/app/hello-world.jar"]