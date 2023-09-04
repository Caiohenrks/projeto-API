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
        stage('Limpar Contêiner e Imagem Existente') {
            steps {
                script {
                    def image_name = 'projetoapi:lts'
                    def container_name = 'projetoapi'

                    // Parar e remover o contêiner existente
                    sh "sudo docker stop $container_name || true"
                    sh "sudo docker rm $container_name || true"

                    // Remover a imagem existente
                    sh "sudo docker rmi $image_name || true"
                }
            }
        }

        stage('Construir Imagem') {
            steps {
                script {
                    echo "Construindo imagem: $image_name"
                    sh 'sudo docker build -t projetoapi:lts .'
                }
            }
        }

        stage('Iniciar Contêiner') {
            steps {
                script {
                    echo "Iniciando contêiner: $container_name"
                    sh 'sudo docker run -d --name projetoapi -p 80:80 projetoapi:lts'
                }
            }
        }
    }
}
