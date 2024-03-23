pipeline {
    agent any
    options {
        timeout(time: 1, unit: 'HOURS')
    }
    stages {
        stage('trial') {
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

        stage('Static code Analysis') {
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

    stage('Terraform plan') {
        steps {
          sh 'terraform plan'
            }
        }
    // stage('Terraform apply') {
    //     steps {
    //        sh 'terraform apply --auto-approve'
    //          }
    //      }
    stage('Terraform action') {
        steps {
                sh 'terraform destroy --auto-approve'
            }
        } 
    }
}