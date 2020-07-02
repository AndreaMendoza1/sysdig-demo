pipeline {
  agent any
  stages {
    stage('Docker Build') {
      steps {
        sh "docker build -t clouddemospe/podinfo:${env.BUILD_NUMBER} ."
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
    stage('Scan Image') {
      steps {
        sh "sudo curl -s https://download.sysdig.com/stable/inline_scan.sh | bash -s -- analyze -s https://secure.sysdig.com -k 95bface6-74d7-418c-9154-ff64abbdd1af -P clouddemospe/podinfo:${env.BUILD_NUMBER}"
        slackSend(message: "Imagen clouddemospe/podinfo:${env.BUILD_NUMBER} escaneada con Sysdig Secure, mas detalle en https://secure.sysdig.com")
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
      slackSend(message: "Pipeline completado correctamente.")
    }
    failure {
      slackSend(message: "Pipeline fallido. Por favor revisar las bitacoras.")
    }
}
}
