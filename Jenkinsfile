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
        /*stage("Push image"){
            steps{
                script{
                    docker.withRegistry(
                        'https://docker.io', 'docker-id'
                    ){
                        def image = docker.build("${env.imageName}:1.${env.BUILD_NUMBER}")
                        image.push()
                    }
                }

            }
        }*/

        stage("Deploy"){
            steps{
                sshagent(['uat-server']){
                    sh "ssh core@167.99.237.229 docker pull sedtapongn/hello-nginx:1.18"
                }
            }
        }
    }
}