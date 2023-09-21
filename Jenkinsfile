pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                bat 'dir'
                bat 'zip -r ctekUI-1.zip .'
                bat 'dir'
            }
        }

        stage('Deploy to Artifactory') {
            steps {
                rtUpload (
                    serverId: 'artifactory',
                    spec: '''{
                        "files": [
                            {
                                "pattern": "ctekUI-1.zip",
                                "target": "npm-local/com/ui/test/"
                            }
                        ]
                    }'''
                )
            }
        }
        stage('docker image build and push'){
            steps {
                script {
                    
                    // Build Docker image
                    def dockerImageName = 'multi-front-patch1'
                    def dockerTagName = 'latest'
                    def dockerImageFullName = "shiva3021/${dockerImageName}:${dockerTagName}"
                    def dockerHubCredentials = credentials('88967ea4-894e-456c-be84-09358b139c77')

                    
                
                    withCredentials([usernamePassword(credentialsId: '88967ea4-894e-456c-be84-09358b139c77', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                bat "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                bat "docker build -t ${dockerImageFullName} ."
                bat "docker push ${dockerImageFullName}"
                  }

                }
            }
        }
    }
}
