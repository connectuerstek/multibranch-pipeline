pipeline {
    agent any

    environment {
        ARTIFACT_URL = 'http://localhost:8082/artifactory/npm-local/com/ui/test/ctekUI.zip'
        DOCKER_IMAGE_NAME = 'multi-front-image'
        DOCKER_IMAGE_TAG = 'latest'
    }

    stages {
        stage('Build') {
            steps {
                bat 'dir'
                bat 'zip -r ctekUI.zip .'
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
                                "pattern": "ctekUI.zip",
                                "target": "npm-local/com/ui/test/"
                            }
                        ]
                    }'''
                )
            }
        }
        stage('Download Artifact') {
            steps {
                script {
                    bat "curl -o ctekUI.zip ${ARTIFACT_URL}"
                }
            }
        }
        stage('docker image build and push'){
            steps {
                script {

                    def dockerImageName = 'multi-front-image'
                    def dockerTagName = 'latest'
                    def dockerImageFullName = "shiva3021/${dockerImageName}:${dockerTagName}"

                
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
