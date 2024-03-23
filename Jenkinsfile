pipeline {
    agent any
    options {
        timeout(time: 1, unit: 'HOURS')
    }
    stages {
        stage('Example') {
            steps {
                echo 'Hello World'
            }
        }

        stage('git checkout') {
            steps {
                 git branch: 'main', url:'https://github.com/582Bamfo/test-jerkins.git'
            }
        }

        stage('initialisation') {
            steps {
                sh 'terraform init'
            }
        }

        stage('validation') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('tfsec') {
           agent {
             docker { 
               image 'tfsec/tfsec-ci:v0.57.1' 
               reuseNode true
             }
           }
            steps {
             sh '''
              tfsec . --no-color
            '''
      }
    }
    }
}