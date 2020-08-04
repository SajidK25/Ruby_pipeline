pipeline{
    agent any
    stages{
        stage("Docker Build"){
            steps {
                sh "docker build -t tech99/book-library ."
            }
        }
        stage("Docker login"){
            steps {
                withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'docker-hub-credentials',
                   usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
               sh "docker login --username $USERNAME --password $PASSWORD"
            }
        }
        stage("Docker push"){
            steps {
                sh "docker push tech99/book-library"
            }
        }
        stage("Deploy staging"){
            steps {
                sh "docker run -d --rm -p 9595:8080 --name book-library tech99/book-library"
            }
        }
        stage("Acceptance Test"){
            steps {
                sleep 10
                sh "cucumber"
            }
        }
    }
    post {
        always{
            sh "docker stop book-library"
        }
    }
}