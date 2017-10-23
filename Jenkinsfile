String cron_string = BRANCH_NAME == 'master' ? 'H H * * *' : ''

pipeline {
    agent {
        label 'vmbuild'
    }

    triggers {
        cron cron_string
    }

    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
    }

    stages {
        stage('Plant seed') {
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
                    sh 'hem deps gems'
                }
            }
            post {
                failure {
                    dir(env.PLANTED_PATH) {
                        deleteDir()
                    }
                }
            }
        }
        stage('Provision dev environments') {
            parallel {
                stage('Vagrant') {
                    steps {
                        dir(env.PLANTED_PATH) {
                            sh 'eval "$(ssh-agent)" && ssh-add && hem vm rebuild'
                            sh 'hem exec bash -c \'cd tools/vagrant && rake\''
                        }
                    }
                    post {
                        always {
                            dir(env.PLANTED_PATH) {
                                sh 'hem vm destroy'
                            }
                        }
                    }
                }
                stage('Docker Compose') {
                    steps {
                        dir(env.PLANTED_PATH) {
                            sh 'sed -i -e \'/^\\s*ASSETS_S3_BUCKET/d\' docker-compose.yml'
                            sh 'touch docker.env'
                            sh 'hem exec bash -c \'rake docker:up\''
                        }
                    }
                    post {
                        always {
                            dir(env.PLANTED_PATH) {
                                sh 'docker-compose down -v'
                            }
                        }
                    }
                }
            }
            post {
                always {
                    dir(env.PLANTED_PATH) {
                        deleteDir()
                    }
                }
            }
        }
    }
}
