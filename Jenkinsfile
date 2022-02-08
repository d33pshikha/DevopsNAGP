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
        stage("Sonar Analysis"){
            steps{
                withSonarQubeEnv("Test_sonar"){
                    sh "mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar"
                }
            }
        }
        stage("Upload to artifactory") {
            steps {
                rtMavenDeployer (
                    id: 'deployer',
                    serverId: '12345@artifactory',
                    releaseRepo: 'deepshikha-nagp-repo',
                    snapshotRepo: 'deepshikha-nagp-repo'
                )
                rtMavenRun (
                    pom: 'pom.xml',
                    goals: 'clean install',
                    deployerId: 'deployer'
                )
                rtPublishBuildInfo (
                    serverId: '12345@artifactory'
                )
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
