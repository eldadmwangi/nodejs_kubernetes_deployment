pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "gcr.io/optimal-waters-446108-c1/backend"
    }
    stages {
        stage('Checkout') {
            steps {
                git "https://github.com/eldadmwangi/nodejs_kubernetes_deployment"
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    sh "docker push $DOCKER_IMAGE"
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh """
                    kubectl apply -f node-backend-deployment.yaml
                    kubectl apply -f node-backend-service.yaml
                    """
                }
            }
        }
    }
    post {
        always {
            echo 'Pipeline has completed!'
        }
        failure {
            echo 'Pipeline has failed!'
        }
    }
}