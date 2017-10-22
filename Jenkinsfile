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

                // make an available branch for Hem from the current git reference
                sh 'git branch -D ci-test || true'
                sh 'git checkout -b ci-test'

                dir('seed-test') {
                    deleteDir()
                }

                sh 'hem seed plant seed-test "--seed=${WORKSPACE}" --branch=ci-test --non-interactive'

                dir('seed-test') {
                    sh 'eval "$(ssh-agent)" && ssh-add && hem vm rebuild'
                    sh 'hem exec bash -c \'cd tools/vagrant && rake\''
                }
            }
            post {
                always {
                    dir('seed-test') {
                        sh 'hem vm destroy'
                        deleteDir()
                    }
                }
            }
        }
    }
}
