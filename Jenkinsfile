pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_REGION = 'us-east-1'
    }
    
    stages {
        stage('Creating AMI') {
            steps {
                sh "packer init aws-ami-v1.pkr.hcl"
                sh "packer build aws-ami-v1.pkr.hcl"
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed :('
        }
    }
}