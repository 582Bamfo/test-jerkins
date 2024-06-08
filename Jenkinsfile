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

        stage('Install tfsec') {
            steps {
                sh """
                    curl -s https://raw.githubusercontent.com/aquasecurity/tfsec/master/scripts/install.sh 
                    tfsec --version
                """
            }
        }

        stage('Terraform Security Scan') {
            steps {
                sh 'tfsec .'
            }
        }


        stage('planning') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('deploying to  dev ') {
            steps {
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}