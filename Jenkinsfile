// common variables
def mvnHome = tool 'maven-3.9.3'
def dockerImage
def dockerRepoUrl = "localhost:8083"
def dockerImageName = "hello-world-java"
def dockerImageTag = "${dockerRepoUrl}/${dockerImageName}:${env.BUILD_NUMBER}"

pipeline {
    agent {
        label 'docker-agent'
    }
    options {
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '30', daysToKeepStr: '14'))
        skipStagesAfterUnstable()
    }
    stages {
        stage('Clone Repo') { // for display purposes
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/cjsethu/docker-hello-world-spring-boot.git'
                // below tool must configured in Jenkins
                mvnHome = tool 'maven-3.9.3'
            }
        }

        stage('Build Project') {
            agent {
                dockerfile {
                    filename 'Dockerfile'
                    args '-u root:root -v /var/run/docker.sock:/var/run/docker.sock'
                }
            }
            stages {
                stage('Clean Package') {
                    steps {
                        // build project via maven
                        sh "'${mvnHome}/bin/mvn' --batch-mode clean package"
                    }
                }

                stage('Publish Tests Results') {
                    steps {
                        parallel(
                            publishJunitTestsResultsToJenkins: {
                                echo "Publish junit Tests Results"
                                junit '**/target/surefire-reports/test-*.xml'
                                archive 'target/*.jar'
                            },
                            publishJunitTestsResultsToSonar: {
                                echo "This is branch b"
                            })
                    }
                }

                stage('Build Docker Image') {
                    steps {
                        // build docker image
                        sh "whoami"
                        sh "ls -all /var/run/docker.sock"
                        sh "mv ./target/hello*.jar ./data"
                        dockerImage = docker.build("hello-world-java")
                    }
                }

                stage('Deploy Docker Image') {
                    steps {
                        // deploy docker image to nexus
                        echo "Docker Image Tag Name: ${dockerImageTag}"
                    }
                }
            }
        }
    }
    post {
        always {
            sh 'echo Cleaning Docker and Shutting Down Server'
        }
    }
}