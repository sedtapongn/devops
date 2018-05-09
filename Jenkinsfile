pipeline{
    agent any
    environment {
        imageName = "sedtapongn/hello-nginx"
    }
    stages{
        stage("Prepare"){
            steps{
             echo("Prepare state")
            }
        }
        stage("Check version"){
            steps{
             sh "docker --version"
            }
        }
        stage("Build image"){
            steps{
             sh "docker build -t ${env.imageName} ."
             sh "docker tag ${env.imageName} ${env.imageName}:1.${env.BUILD_NUMBER}"
            }
        }
        stage("Push image"){
            steps{
             sh "docker push ${env.imageName}"
            }
        }
    }
}