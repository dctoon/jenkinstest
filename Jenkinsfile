pipeline {
  agent any

  parameters {
      string(name: 'EXTENSION_DEPLOY_TARGET_PARAM', defaultValue: 'test', description: 'Deployment Target, valid values are `test` and `production`')
  }

  environment { 
      EXTENSION_DEPLOY_TARGET = '${params.EXTENSION_DEPLOY_TARGET_PARAM}'
  }

  stages {
    stage('Start') {
      steps {
        echo 'Start builing ${EXTENSION_DEPLOY_TARGET}'
      }
    }
    
    stage('Deploy') {
      when {
          environment name: 'EXTENSION_DEPLOY_TARGET', value: 'production'
      }
      steps {
         sh 'tool/deploy.sh'
      }
    }

    stage('Done') {
      steps {
        echo 'Done builing ${params.PERSON}'
      }
    }
  }
}