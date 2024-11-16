pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = "docker-push-image"  // Name for the Docker image
        DOCKER_COMPOSE_FILE = "docker-compose.yml"  // Path to the docker-compose.yml
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout code from the repository
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build the Docker image using docker-compose
                bat 'docker-compose build --no-cache'  // Use bat for Windows
            }
        }

        stage('Run Docker Containers') {
            steps {
                // Start the services using docker-compose
                bat 'docker-compose up -d'  // Use bat for Windows
            }
        }

        stage('Test Application') {
            steps {
                // Run your application tests (replace with actual commands)
                bat 'curl -f http://localhost:4000 || exit 1'  // Windows command for curl testing
            }
        }

        stage('Cleanup') {
            steps {
                // Stop and remove containers, networks, and volumes created by docker-compose
                bat 'docker-compose down --volumes'  // Use bat for Windows
            }
        }
    }

    post {
        always {
            // Cleanup workspace after pipeline execution
            cleanWs()
        }
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check logs for details.'
        }
    }
}
