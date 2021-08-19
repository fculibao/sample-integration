pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'docker build -t fculibao/sample-integration .'
            }
        }
        stage('Mvn Pacakge Test') {
            steps {
                script {
                    def mvnHome = tool name: 'maven-3.8.2', type: 'maven'
                    def mvnCMD = "${mvnHome}/bin/mvn"
                    sh "${mvnCMD} clean package"
                } 
            }
        }
        stage('Push Docker Image') {
            script {
                withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
                sh "docker login -u fculibao -p ${dockerHubPwd}"
                }
                sh 'docker push fculibao/my-app:2.0.0'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}