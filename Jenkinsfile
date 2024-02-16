pipeline {
    agent any
    
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