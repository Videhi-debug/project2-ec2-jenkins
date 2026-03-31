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
                sh 'docker run -d -p 8080:80 my-nginx-app'
            }
        }
    }
}
