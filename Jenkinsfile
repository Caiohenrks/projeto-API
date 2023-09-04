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

                    // Remove o contêiner se existir
                    if (docker.containerExists(container_name)) {
                        echo "Removendo contêiner existente: $container_name"
                        docker.stop(container_name)
                        docker.remove(container_name)
                    }

                    // Remove a imagem se existir
                    if (docker.imageExists(image_name)) {
                        echo "Removendo imagem existente: $image_name"
                        docker.imageRemove(image_name)
                    }

                    echo "Construindo imagem: $image_name"
                    docker.build("-t $image_name .")

                    echo "Iniciando contêiner: $container_name"
                    docker.run("-d --name $container_name -p 80:80 $image_name")
                }
            }
        }
    }
}
