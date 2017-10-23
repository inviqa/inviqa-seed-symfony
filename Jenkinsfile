String cron_string = BRANCH_NAME == 'master' ? 'H H * * *' : ''

pipeline {
    agent {
        label 'vmbuild'
    }

    triggers {
        cron cron_string
    }

    stages {
        stage('Build') {
            steps {
                checkout scm

                script {
                    env.PLANTED_PATH = sh(returnStdout: true, script: 'mktemp -d -p "${WORKSPACE}" seed-test-XXXXX').trim()
                }

                // make an available branch for Hem from the current git reference
                sh 'git branch -D ci-test || true'
                sh 'git checkout -b ci-test'

                dir(env.PLANTED_PATH) {
                    deleteDir()
                }

                sh 'hem seed plant "$(basename "${PLANTED_PATH}")" "--seed=${WORKSPACE}" --branch=ci-test --non-interactive'

                dir(env.PLANTED_PATH) {
                    sh 'eval "$(ssh-agent)" && ssh-add && hem vm rebuild'
                    sh 'hem exec bash -c \'cd tools/vagrant && rake\''
                }
            }
            post {
                always {
                    dir(env.PLANTED_PATH) {
                        sh 'hem vm destroy'
                        deleteDir()
                    }
                }
            }
        }
    }
}
