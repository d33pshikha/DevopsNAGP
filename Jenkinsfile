pipeline{
    agent any
    tools{
        maven "Maven 3.8.4"
    }
    stages{
    stage("code checkout"){
        steps{
        sh "echo hello"
        }
    }
    stage("code build"){
        steps{
        sh "mvn clean"
        }
    }
    stage("unit test"){
        steps{
        sh "mvn test"
        }
    }
    }
    post{
        always{
            sh "echo job is completed"
        }
        success{
            sh "echo success"
        }
        failure{
            sh "echo failed"
        }
    }
}
