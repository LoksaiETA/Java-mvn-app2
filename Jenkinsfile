pipeline {
    agent { label 'slave1' }

    stages {
        stage('SCM Checkout') {
            steps {
                echo 'Perfomr SCM Check-Out'
				echo 'Cloning Java Maven App Code'
				git 'https://github.com/LoksaiETA/Java-mvn-app2.git'
            }
             post {
                failure {
                  sh "echo 'Send mail on failure'"
					mail bcc: 'loksaieta223@gmail.com', body: 'Jenkins Jobs Status ', cc: 'loksaieta223@gmail.com', from: '', replyTo: '', subject: 'SCM-Checkout Failed ', to: 'loksaieta223@gmail.com'
                }
              }
        }
        stage('Java Application Build') {
            steps {
                echo 'Perform Java Maven Application Build'
                sh 'mvn clean package'
            }
             post {
                failure {
                  sh "echo 'Send mail on failure'"
					mail bcc: 'loksaieta223@gmail.com', body: 'Jenkins Jobs Status ', cc: 'loksaieta223@gmail.com', from: '', replyTo: '', subject: 'App Build Failed ', to: 'loksaieta223@gmail.com'
                }
              }
        }
        stage('Deploy to Tomcat_Server') {
            steps {
 				script {
 				    sshPublisher(publishers: [sshPublisherDesc(configName: 'SA-Tomcat_Server', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '.', remoteDirectorySDF: false, removePrefix: 'target/', sourceFiles: 'target/mvn-hello-world.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])					
 				}
                
            }
             post {
                failure {
                  sh "echo 'Send mail on failure'"
					mail bcc: 'loksaieta223@gmail.com', body: 'Jenkins Jobs Status ', cc: 'loksaieta223@gmail.com', from: '', replyTo: '', subject: 'App Deployment Failed ', to: 'loksaieta223@gmail.com'
                }
                success {
                  sh "echo 'Send mail on Successful'"
					mail bcc: 'loksaieta223@gmail.com', body: "jenkins-${JOB_NAME}-${BUILD_NUMBER}", cc: 'loksaieta223@gmail.com', from: '', replyTo: '', subject: 'App Deployment Successful ', to: 'loksaieta223@gmail.com'
                }
              }
        }
    }
}
