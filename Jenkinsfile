pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Cloning repository...'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Building the application...'
                bat './mvnw clean package -DskipTests'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                bat './mvnw test'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker image...'
                bat 'docker build -t cicd-demo:latest .'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying container...'
                bat 'docker stop cicd-demo || exit 0'
                bat 'docker rm cicd-demo || exit 0'
                bat 'docker run -d --name cicd-demo -p 8081:8080 cicd-demo:latest'
            }
        }
    }

    post {
        success { echo 'Pipeline completed successfully!' }
        failure { echo 'Pipeline failed!' }
    }
}