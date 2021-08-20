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
                    withCredentials([string(credentialsId: 'docker-access-pwd', variable: 'dockerHubPwd')]) {
                    sh "docker login -u fculibao -p ${dockerHubPwd}"
                    }
                    sh 'docker push fculibao/nginx'
                }            
            }
        }
        stage('Deploy Docker Container into AWS EC2 Instance') {
            steps {
                echo 'Deploying....'
                script {
                    def dockerRun = 'docker run -p 80:80 -d --name myweb-server fculibao/nginx'
                    sshagent(['web-server']) {
                    sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.83.107 ${dockerRun}"
                    }
                }
            }
        }
    }
}