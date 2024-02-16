pipeline {
    agent any
    
    stages {
        stage('Installing packer') {
            steps {
                echo 'Installing HashiCorp Packer...'
                sh 'wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg'
                sh 'echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list'
                sh 'sudo apt update && sudo apt install packer'
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
