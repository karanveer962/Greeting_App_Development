pipeline {
    agent { label 'slave' }

    stages {
       stage('Build') {
		    steps {
			    script {
				    sh "rsync -rvz $WORKSPACE /tmp/"
				    sh "cd /tmp && docker build -t greetingsApp:v1 ."
				    sh "docker run -it greetingsApp:v1"
                      }
                 }
	 }
    }
}
