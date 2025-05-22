pipeline {
    agent any

    environment {
        GIT_REPO_URL = 'https://github.com/SudhakarJinuka/Usecase-4.git' // ✅ update this
        SSH_KEY_PATH = '$home/sjinuka/.ssh/id_rsa'     // ✅ update this
        SOURCE_VM_IP = '35.225.255.73'                    // ✅ update this
        TARGET_VM_IP = '104.154.202.70'                    // ✅ update this
        CSV_PATH     = '/home/sjinuka/sample_data.csv'                   // ✅ path on source VM
        USERNAME     = 'sjinuka'                                    // ✅ username on VMs
    }

    stages {
        stage('Clone GitHub Repo') {
            steps {
                git url: "${env.GIT_REPO_URL}", branch: 'main'
            }
        }

        stage('Run PowerShell Migration Script') {
            steps {
                pwsh """
                    ./migrate.ps1 `
                        -sourceVMIP '${env.SOURCE_VM_IP}' `
                        -targetVMIP '${env.TARGET_VM_IP}' `
                        -sshKeyPath '${env.SSH_KEY_PATH}' `
                        -username '${env.USERNAME}' `
                        -csvFilePath '${env.CSV_PATH}'
                """
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
}
