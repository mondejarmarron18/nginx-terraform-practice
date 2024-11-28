pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                echo 'Cloning the repository'
                git 'https://github.com/PrashantChaudhari/docker.git'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh 'docker compose -f docker-compose.test.yml up --build'
            }
        }
        stage('Build and Deploy') {
            steps {
                echo 'Building..'
                sh 'docker compose -f docker-compose.prod.yml up --build'
            }
        }
    }

    post {
        always {
            echo 'This will always run'
            sendEmail(
                subject: "In progress",
                body: "In progress"
            )
        }
        success {
            echo 'This will run only if successful'
            sendEmail(
                subject: "Deployed",
                body: "Deployed successfully"    
            )
        }
        failure {
            echo 'This will run only if failed'
            sendEmail(
                subject: "Failed",
                body: "Failed"
            )
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
            sendEmail(
                subject: "Unstable",
                body: "Unstable"
            )
        }
    }


}