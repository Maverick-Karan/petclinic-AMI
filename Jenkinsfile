pipeline {
    agent any
    
    stages {
        stage('Installing packer') {
            steps {
                echo 'Installing HashiCorp Packer...'
                sh 'curl -o packer.zip https://releases.hashicorp.com/packer/1.8.5/packer_1.8.5_linux_amd64.zip'
                sh 'unzip -o packer.zip'
                sh 'sudo mv packer /usr/local/bin/'
            }
        }
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
