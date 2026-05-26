pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo 'Checkout done!'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t cicd-demo:latest .'
                echo 'Docker image built!'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker stop cicd-demo || true'
                sh 'docker rm cicd-demo || true'
                sh 'docker run -d --name cicd-demo -p 8081:8080 cicd-demo:latest'
                echo 'Application deployed!'
            }
        }
    }

    post {
        success { echo 'SUCCESS - Pipeline completed!' }
        failure { echo 'FAILED - Check logs!' }
    }
}