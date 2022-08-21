pipeline {
    agent any

	environment {	
		DOCKERHUB_CREDENTIALS=credentials('dockerloginid')
	} 
 
    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "MAVEN"
    }
    
    stages {
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                //git branch: 'master', credentialsId: 'GIT_HUB_CREDENTIALS', url: //'https://github.com/LoksaiETA/Java-mvn-app2.git'
				git 'https://github.com/LoksaiETA/Java-mvn-app2.git'
                // Run Maven on a Unix agent.
                //sh './gradle wrapper'
                //sh './gradlew build'
                sh "mvn -Dmaven.test.failure.ignore=true clean package"

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
		}

        stage("Docker build"){
            steps {
				sh 'docker version'
				sh 'docker build -t loksai-docker-demo .'
				sh 'docker image list'
				sh 'docker tag loksai-docker-demo loksaieta/loksai-docker-demo:loksai-docker-demo'
            }
        }
		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push loksaieta/loksai-docker-demo:loksai-docker-demo'
			}
		}

		stage("Deploy to K8s") {
			steps {
				sh "kubectl apply -f k8s-spring-boot-deployment.yml --kubeconfig="
			}
		}
	}
}
