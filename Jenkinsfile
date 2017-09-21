pipeline {
  agent any

  parameters {
        choice(choices: 'TEST\nPRODUCTION', description: 'Where are you deploying to?', name: 'EXTENSION_DEPLOY_TARGET_PARAM')
  }

  environment { 
      EXTENSION_DEPLOY_TARGET = "${params.EXTENSION_DEPLOY_TARGET_PARAM}"
  }

  stages {
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
        echo 'Start Deploy'
      }
    }

    stage('Done') {
      steps {
        echo 'Done build'
      }
    }
  }
}