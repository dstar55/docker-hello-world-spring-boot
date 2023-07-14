node {
    // ** NOTE: This 'maven-3.9.3' Maven tool must be configured in the Jenkins Global Configuration.
    def mvnHome = tool 'maven-3.9.3'
    def dockerImage
    def dockerRepoUrl = "localhost:8083"
    def dockerImageName = "hello-world-java"
    def dockerImageTag = "${dockerRepoUrl}/${dockerImageName}:${env.BUILD_NUMBER}"

    agent {
        dockerfile {
            filename 'Dockerfile'
            label 'docker-agent'
            args '-u root:root -v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    stage('Clone Repo') {
        git 'https://github.com/dstar55/docker-hello-world-spring-boot.git'
        mvnHome = "${mvnHome}"
    }

    stage('Build Project') {
        // build project via maven
        sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore clean package"
    }

    stage('Publish Tests Results') {
        parallel(
            publishJunitTestsResultsToJenkins: {
                echo "Publish junit Tests Results"
                junit '**/target/surefire-reports/TEST-*.xml'
                archive 'target/*.jar'
            },
            publishJunitTestsResultsToSonar: {
                echo "This is branch b"
            })
    }

    stage('Build Docker Image') {
        // build docker image
        sh "whoami"
        sh "ls -all /var/run/docker.sock"
        sh "mv ./target/hello*.jar ./data"

        dockerImage = docker.build("hello-world-java")
    }

    stage('Deploy Docker Image') {
        echo "Docker Image Tag Name: ${dockerImageTag}"
    }
}