pipeline {
    agent { label 'slave' }

    stages {
       stage('Build') {
		    steps {
			    script {
				    sh "rsync -rvz $WORKSPACE /tmp/"
				    sh "cd /tmp && sudo docker build -t greetingsApp:v1 ."
				    sh "sudo docker run -it greetingsApp:v1"
                      }
                 }
	 }
    }
}
