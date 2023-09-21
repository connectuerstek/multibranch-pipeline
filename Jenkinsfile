pipeline {
    agent any

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
        
