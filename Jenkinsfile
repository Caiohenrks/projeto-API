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

                    if (docker.image(image_name).inspect().status == 'created' || docker.image(image_name).inspect().status == 'exited') {
                        echo "Removendo imagem existente: $image_name"
                        docker.image(image_name).remove(force: true)
                    }

                    if (docker.container(container_name).inspect().status == 'running') {
                        echo "Parando e removendo contêiner existente: $container_name"
                        docker.container(container_name).stop()
                        docker.container(container_name).remove(force: true)
                    }
                }
            }
        }

        stage('Construir Imagem') {
            steps {
                echo "Construindo imagem: $image_name"
                sh 'docker build -t projetoapi:lts .'
            }
        }

        stage('Iniciar Contêiner') {
            steps {
                echo "Iniciando contêiner: $container_name"
                sh 'docker run -d --name projetoapi -p 80:80 projetoapi:lts'
            }
        }
    }
}

