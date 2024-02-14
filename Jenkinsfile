pipeline {
    agent { label 'slave' }

    stages {
       stage('Build') {
		    steps {
			    script {
				     sh "rsync -rvz $WORKSPACE /tmp/"
        sh "sudo -u ubuntu cp -rvf /tmp/test /new-app"
        sh "sudo -u ubuntu sh -c 'cd /new-app && sudo docker build -t greetingsApp:v1 .'"
        sh "sudo -u ubuntu sh -c 'cd /new-app && sudo docker run -it greetingsApp:v1'"
                      }
                 }
	 }
    }
}
