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
                sh '''
                    chmod +x gradlew
                    ./gradlew build -x test --no-daemon
                '''
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                sh './gradlew test --no-daemon'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t cicd-demo:latest .'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying container...'
                sh 'docker stop cicd-demo || true'
                sh 'docker rm cicd-demo || true'
                sh 'docker run -d --name cicd-demo -p 8081:8080 cicd-demo:latest'
            }
        }
    }

    post {
        success { echo 'Pipeline completed successfully!' }
        failure { echo 'Pipeline failed!' }
    }
}