---
title: "jenkins"
aliases:
  - /technologies/jenkins/index.md
  - /technologies/jenkins
permalink: /technologies/jenkins/index.md
description: "pipeline service"
date: 2025-04-29
tags:
  - jenkins
  - github
  - jenkinsfile
  - jenkins pipeline
series: ["Technologies notes"]
draft: false
series_order: 6
---

Jenkins is a CI service that can build and test software from different VCS, run automation tasks, integrate with ansible and much more, it's based around the concept of **builds**, builds are composed of a sequence of actions that  are executed on **build nodes**, build notes are enivronments that run the software build workflow

```mermaid
flowchart LR
A[JENKINS INSTANCE]
B[build node 1]
C[build node 2]
D[build node 3]
A -- execute build pipelines --> B & C & D
```


## Create a Jenkins CI pipeline for github repository

One way to use Jenkins is to run build processes for github hosted software as a substitute of github actions, in this setup github will trigger with a webhook the Jenkins instance in order to run a build defined in a Jenkinsfile inside the repo, events that triggers the CI pipeline can be specified in the github repo config section

- Create a new pipeline on Jenkins and add a GitHub repository url

![](jenkins1.png)

- Set the CI script to pull from SCM

![](jenkins2.png)

- Create a `Jenkinsfile` with the Jenkins CI pipeline (here example for building docker images)

```groovy
pipeline {
	environment {
		registry = "carnivuth/<project_name>"
		registryCredential = 'dockerhub_id'
		dockerImage = ''
	}

	agent any
	stages {
		stage('Cloning Repository') {
			steps {
				git branch:'main',
				    url:'https://github.com/carnivuth/<project_name>'
			}
		}

		stage('Building <project_name> docker image') {
			steps {
				script {
					dockerImage = docker.build registry + ":$BUILD_NUMBER"
				}
			}
		}

		stage('Upload docker image to docker hub') {
			steps {
				script {
					docker.withRegistry('', registryCredential) {
						dockerImage.push()
					}
				}
			}
		}

		stage('Cleaning up environment') {
			steps {
				sh "docker rmi $registry:$BUILD_NUMBER"
			}
		}
	}
}
```

- Configure Jenkins to add GitHub hooks automatically to the repository
