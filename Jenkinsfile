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

                    sh "chmod +x install.sh"
                    sh "./install.sh"
                }
            }
        }
    }
}
