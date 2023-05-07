pipeline {
    agent { label 'sa-javaslave' }

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "slave_maven"
    }

    stages {
        stage('SCM Checkout') {
            steps {
                echo 'Checkout Src from github repo'
		git 'https://github.com/LoksaiETA/Java-mvn-app2.git'
            }
        }
        stage('Maven Build') {
            steps {
                echo 'Perform Maven Build'
                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
        stage('Deploy to QA Server') {
            steps {
		script {
		sshPublisher(publishers: [sshPublisherDesc(configName: 'QA_Server', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '.', remoteDirectorySDF: false, removePrefix: 'target/', sourceFiles: 'target/mvn-hello-world.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
		}
        }
	}
    }
}
