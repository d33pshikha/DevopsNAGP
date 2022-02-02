pipeline{
    agent any
    tools{
        maven "Maven 3.8.4"
    }
    stages{
        stage("Checkout"){
            steps{
                checkout scm
            }
        }
        stage("Build"){
            steps{
                sh "mvn install"
            }
        }
        stage("Unit Test"){
            steps{
                sh "mvn test"
            }
        }
         stage("Unit Testing"){
            steps{
                sh "mvn test"
            }
        }
        stage("Sonar Analysis"){
            steps{
                withSonarQubeEnv("Test_sonar"){
                    sh "mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar"
                }
            }
        }
    }
    post{
        success{
            sh "echo success"
        }
        failure{
            sh "echo failed"
        }
    }
}
