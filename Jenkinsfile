pipeline {
  agent any

  parameters {
      choice(choices: 'TEST\nPRODUCTION', description: 'Where are you deploying to?', name: 'EXTENSION_DEPLOY_TARGET_PARAM')
  }

  environment { 
      EXTENSION_DEPLOY_TARGET = "${params.EXTENSION_DEPLOY_TARGET_PARAM}"
  }

  stages {
    stage('Checkout') {
      steps {
          checkout scm
      }
    }

    stage('Start') {
      steps {
        echo "Start builing $EXTENSION_DEPLOY_TARGET"
      }
    }
    
    stage('Deploy') {
      when {
          environment name: 'EXTENSION_DEPLOY_TARGET', value: 'PRODUCTION'
      }
      steps {
        sh "LAST_COMMIT=\$(git log -1 --pretty=%B)"
        echo "Start Deploy $EXTENSION_DEPLOY_TARGET ($LAST_COMMIT)"
      }
    }

    stage('Done') {
      steps {
        echo 'Done build'
      }
    }
  }
}