pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'docker build -t fculibao/sample-integration .'
            }
        }
        stage('Mvn Pacakge') {
            steps {
                def mvnHome = tool name: 'maven-3.8.2', type: 'maven'
                def mvnCMD = "${mvnHome}/bin/mvn"
                sh "${mvnCMD} clean package"
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