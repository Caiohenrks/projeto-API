pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Realiza o checkout do repositório
                    checkout scm
                }
            }
        }

        stage('Build and Run Docker Image') {
            steps {
                script {
                    def image_name = "projetoapi:lts"
                    def container_name = "projetoapi"
                    sh "sudo ls -la"
                    sh "sudo docker ps -a"
                    
                    // Remove o contêiner se existir
                    //sh "sudo docker ps -a | grep $container_name && sudo docker stop $container_name && sudo docker rm $container_name"

                    // Remove a imagem se existir
                    //sh "sudo docker images | grep $image_name && sudo docker rmi $image_name"

                    //echo "Construindo imagem: $image_name"
                    //sh "sudo docker build -t $image_name ."

                    //echo "Iniciando contêiner: $container_name"
                    //sh "sudo docker run -d --name $container_name -p 80:80 $image_name"
                }
            }
        }
    }
}
