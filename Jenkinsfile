/*pipeline {
    agent any

    environment {
        GIT_REPO_URL   = 'https://github.com/SudhakarJinuka/Usecase-4.git'
        SOURCE_VM_IP   = '10.128.0.15'
        TARGET_VM_IP   = '10.128.0.26'
        CSV_PATH       = '/home/sjinuka/sample_data.csv'
        LOCAL_CSV_PATH = '/tmp/mydata.csv'
        USERNAME       = 'sjinuka'
    }

    stages {
        stage('Clone GitHub Repo') {
            steps {
                git url: "${env.GIT_REPO_URL}", branch: 'main'
            }
        }

        stage('Run PowerShell Migration Script') {
            steps {
                sshagent(['ssh_key']) {
                    pwsh """
                        ./migrate.ps1 `
                            -sourceVMIP '${env.SOURCE_VM_IP}' `
                            -targetVMIP '${env.TARGET_VM_IP}' `
                            -username '${env.USERNAME}' `
                            -csvFilePath '${env.CSV_PATH}' `
                            -localCsvPath '${env.LOCAL_CSV_PATH}'
                    """
                }
            }
        }
    }

    post {
        success {
            echo 'CSV migration completed successfully.'
        }
        failure {
            echo 'CSV migration failed.'
        }
    }
}*/

pipeline {
    agent any
 
    environment {
        GIT_REPO = 'https://github.com/SudhakarJinuka/Usecase-4.git'
        BRANCH = 'main'
        DEST_USER = 'sjinuka'
        DEST_HOST = '10.128.0.28'
        DEST_PATH = '/home/sjinuka/'
        FILE_NAME = 'sample_data.csv'
    }
 
    stages {
        stage('Clone GitHub Repo') {
            steps {
                git branch: "${BRANCH}", url: "${GIT_REPO}"
            }
        }
 
        stage('Transfer CSV File') {
            steps {
                sh '''
                pwsh -Command "& { ./migrate.ps1 -DestinationUser \\"${DEST_USER}\\" -DestinationHost \\"${DEST_HOST}\\" -CsvFilePath \\"${FILE_NAME}\\" -TargetPath \\"${DEST_PATH}\\" }"
                '''
            }
        }
    }
}
