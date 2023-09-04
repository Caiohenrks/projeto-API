pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout scm
                }
            }
        }

        stage('Build and Run Docker Image') {
            steps {
                script {
                    def image_name = "projetoapi:lts"
                    def container_name = "projetoapi"

                    docker.withServer('docker-server') {
                        def existingContainer = docker.container(container_name)
                        if (existingContainer) {
                            echo "Removendo contêiner existente: $container_name"
                            existingContainer.stop()
                            existingContainer.remove()
                        }
                    }

                    docker.withServer('docker-server') {
                        def existingImage = docker.image(image_name)
                        if (existingImage) {
                            echo "Removendo imagem existente: $image_name"
                            existingImage.remove()
                        }
                    }

                    echo "Construindo imagem: $image_name"
                    docker.build(image_name, '.')

                    echo "Iniciando contêiner: $container_name"
                    docker.withServer('docker-server') {
                        def newContainer = docker.image(image_name).run("-d --name $container_name -p 80:80")
                    }
                }
            }
        }
    }
}
