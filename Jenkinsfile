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
        stage("Push Git"){
            steps{
                sshagent(['uat-server']){
                    sh "docker push ${env.imageName}:1.${env.BUILD_NUMBER}"
                }
            }
        }

        stage("Deploy"){
            steps{
                sshagent(['uat-server']){
                    sh "ssh core@139.59.223.198 docker pull ${env.imageName}:1.${env.BUILD_NUMBER}"
                }
            }
        }
    }
}