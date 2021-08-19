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
            steps {
                script {
                    withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
                    sh "docker login -u fculibao -p ${dockerHubPwd}"
                    }
                    sh 'docker push fculibao/nginx:2.0.0'
                }            
            }
        }
        stage('Deploy Docker Container into AWS EC2 Instance') {
            steps {
                echo 'Deploying....'
                script {
                    def dockerRun = 'docker run -p 80:80 -d --name my-web-server fculibao/nginx:2.0.0'
                    sshagent(['web-server']) {
                    sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.82.187 ${dockerRun}"
                    }
                }
            }
        }
    }
}