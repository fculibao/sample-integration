pipeline {
    agent any

    stages {
        stage('SCM Checkout') {
            steps {
               git credentialsId: 'git-creds', url: 'https://github.com/fculibao/sample-integration'
            }
        }
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}