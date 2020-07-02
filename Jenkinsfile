pipeline {
  agent any
  stages {
    stage('Docker Build') {
      steps {
        sh "docker build -t clouddemospe/podinfo:${env.BUILD_NUMBER} ."
      }
    }
    stage('Scan Image') {
      steps {
        sh "curl -s https://download.sysdig.com/stable/inline_scan.sh | bash -s -- analyze -s https://secure.sysdig.com -k 2310655e-9c08-4faa-b847-0aabc19a0b8e -P clouddemospe/podinfo:${env.BUILD_NUMBER}"
        slackSend(message: "Imagen Scaneada con Sysdig Secure: clouddemospe/podinfo:${env.BUILD_NUMBER}, ver https://secure.sysdig.com")
      }
    }
    stage('Docker Push') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh "docker push clouddemospe/podinfo:${env.BUILD_NUMBER}"
        }
      }
    }
    stage('Docker Remove Image') {
      steps {
        sh "docker rmi clouddemospe/podinfo:${env.BUILD_NUMBER}"
      }
    }
    stage('Apply Kubernetes Files') {
      steps {
        sh "./assign_ver.sh $BUILD_NUMBER"
      }
  }
}
post {
    success {
      slackSend(message: "Pipeline is successfully completed.")
    }
    failure {
      slackSend(message: "Pipeline failed. Please check the logs.")
    }
}
}
