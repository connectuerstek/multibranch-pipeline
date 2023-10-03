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
    }
}
