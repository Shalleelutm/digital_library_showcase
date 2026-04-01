pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "shalleelutm/digital_library:${BUILD_NUMBER}"
    }
    
    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/Shalleelutm/digital_library_showcase.git'
            }
        }
        
        stage('Build Docker') {
            steps {
                bat "docker build -t ${DOCKER_IMAGE} ."
            }
        }
        
        stage('Deploy') {
            steps {
                bat """
                    docker stop digital_library || true
                    docker rm digital_library || true
                    docker run -d --name digital_library -p 8080:80 ${DOCKER_IMAGE}
                """
            }
        }
    }
    
    post {
        success {
            echo '✅ DEPLOYED TO http://localhost:8080'
        }
    }
}