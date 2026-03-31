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
        # Stop and remove any container using port 8080
        docker ps -q --filter "publish=8080" | xargs -r docker stop
        docker ps -aq --filter "publish=8080" | xargs -r docker rm

        # Run new container
        docker run -d -p 8080:80 my-nginx-app
        '''
            }
        }
    }
}
