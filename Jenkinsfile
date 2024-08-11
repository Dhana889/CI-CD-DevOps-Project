pipeline {
    agent any
    
    tools {
        jdk 'jdk17'
        maven 'maven3'
    }
    
    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', credentialsId: 'git-cred', url: 'https://github.com/Dhana889/CI-CD-DevOps-Project.git'
            }
        }
    
        stage('Compile') {
            steps {
                sh "mvn compile"
            }
        }
    
        stage('Test') {
            steps {
                sh "mvn test"
            }
        }
    
        stage('File System Scan') {
            steps {
                sh "trivy fs --format table -o trivy-fs-report.html ."
            }
        }
        
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonar') {
                    sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=BoardGame -Dsonar.projectKey=BoardGame \
                            -Dsonar.java.binaries=. '''
                }
            }
        }
        
        stage('Quality Gate') {
            steps {
                script {
                  waitForQualityGate abortPipeline: false, credentialsId: 'sonar-token' 
                }
            }
        }
        
        stage('Build') {
            steps {
                sh "mvn clean package"
            }
        }
        
        stage('Publish Artifacts') {
            steps {
                withMaven(globalMavenSettingsConfig: 'maven-global', jdk: 'jdk17', maven: 'maven3', mavenSettingsConfig: '', traceability: true) {
                    sh "mvn deploy"    
                }
            }
        }
        
        stage('Build & Tag Docker Image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                            sh "docker build -t 8889docker/boardgame:latest ."
                    }
                }   
            }
        }
        
        stage('Docker Image Scan') {
            steps {
                sh "trivy image --format table -o trivy-image-report.html 8889docker/boardgame:latest "
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                        sh "docker push 8889docker/boardgame:latest"
                    }
                }
            }
        }
        
        stage('Deploy to Kubernetes') {
            steps {
                withKubeConfig(caCertificate: '', clusterName: 'kubernetes', contextName: '', credentialsId: 'k8-cred', namespace: 'webapps', restrictKubeConfigAccess: false, serverUrl: 'https://10.0.1.158:6443') {
                    sh "kubectl apply -f deployment-service.yaml"
                }
            }
        }
        
        stage('Confirm Deploy in Kubernetes') {
            steps {
                withKubeConfig(caCertificate: '', clusterName: 'kubernetes', contextName: '', credentialsId: 'k8-cred', namespace: 'webapps', restrictKubeConfigAccess: false, serverUrl: 'https://10.0.1.158:6443') {
                    sh "kubectl get all -o wide -n webapps"
                }
            }
        }
    }
}
