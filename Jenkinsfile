node('slave'){

    def mvnHome

    stage('Preparation') { // for display purposes

        // Get some code from a GitHub repository

        git 'https://github.com/jglick/simple-maven-project-with-tests.git'

        // Get the Maven tool.

        // ** NOTE: This 'M3' Maven tool must be configured

        // **       in the global configuration.

        mvnHome = tool 'maven'

    }

    stage('Build') {

        // Run the maven build

        withEnv(["MVN_HOME=$mvnHome"]) {

            if (isUnix()) {

                sh '"$MVN_HOME/bin/mvn" -Dmaven.test.failure.ignore clean package'

            } else {

                bat(/"%MVN_HOME%\bin\mvn" -Dmaven.test.failure.ignore clean package/)

            }

        }

    }

    stage('Results') {

        junit '**/target/surefire-reports/TEST-*.xml'

        archiveArtifacts 'target/*.jar'

    }
stage('Build') {

        // Run the maven build

        withEnv(["MVN_HOME=$mvnHome"]) {

            if (isUnix()) {

                sh '"$MVN_HOME/bin/mvn" -Dmaven.test.failure.ignore clean package'

            } else {

                bat(/"%MVN_HOME%\bin\mvn" -Dmaven.test.failure.ignore clean package/)

            }

        }

    }


    stage('Test') {

        withEnv(["MVN_HOME=$mvnHome"]) {

                sh '"$MVN_HOME/bin/mvn" -Dmaven.test.failure.ignore=true test'

        }

    }

    stage('Results') {

        //junit '**/target/surefire-reports/TEST-*.xml'

        junit(testResults: 'target/surefire-reports/*.xml', skipMarkingBuildUnstable: true, allowEmptyResults : true)

        //step([$class: 'JUnitResultArchiver', testResults: '**/target/surefire-reports/TEST-*.xml'])

    }

    stage('Artifacts') {

       archiveArtifacts 'target/*.jar' 

    }
}
