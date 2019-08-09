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
    
}
