pipeline {
    agent { label 'slave1' }

    stages {
        stage('SCM Checkout') {
            steps {
                echo 'Perfomr SCM Check-Out'
				echo 'Cloning Java Maven App Code'
				git 'https://github.com/LoksaiETA/Java-mvn-app2.git'
            }
        }
        stage('Java Application Build') {
            steps {
                echo 'Perform Java Maven Application Build'
                sh 'mvn clean package'
            }
        }
        stage('Deploy to Tomcat_Server') {
            steps {
 				script {
 				    sshPublisher(publishers: [sshPublisherDesc(configName: 'SA-Tomcat_Server', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '.', remoteDirectorySDF: false, removePrefix: 'target/', sourceFiles: 'target/mvn-hello-world.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
 				}
                
            }
        }
    }
}
