pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker build -t my-nginx-app .'
            }
        }
        stage('Test') {
            steps {
                sh 'docker run --rm my-nginx-app echo "Tests Passed!"'
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                # Stop old container if running
                docker stop $(docker ps -q --filter "ancestor=my-nginx-app") || true
                docker rm $(docker ps -aq --filter "ancestor=my-nginx-app") || true

                # Run new container
                docker run -d -p 8080:80 my-nginx-app
                '''
            }
        }
    }
}
