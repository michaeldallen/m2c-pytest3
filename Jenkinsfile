node {
  def commit_id
    stage('Preparation') {
      checkout scm
      sh "git rev-parse --short HEAD > .git/commit-id"
      commit_id = readFile('.git/commit-id').trim()
      sh "rm -v .git/commit-id"
    }

    stage('Build') {
        echo 'Building'
    }
    stage('Test') {
        echo 'Testing'
    }
    stage('Deploy') {
        echo 'Deploying'
    }
    
    post {
        always {
            echo 'This will always run'
        }
        success {
            echo 'This will run only if successful'
        }
        failure {
            echo 'This will run only if failed'
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
        changed {
            echo 'This will run only if the state of the Pipeline has changed'
            echo 'For example, if the Pipeline was previously failing but is now successful'
        }
    }
}
