pipeline {
    agent any 
    
    stages{
        stage("Clone Code"){
            steps {
                echo "Cloning the code"
                git url:"https://github.com/Ayushchouhans/Nginix_cicd.git", branch: "main"
            }
        }
        stage("Build"){
            steps {
                echo "Building the image"
                sh "docker build -t web3 ."
            }
        }
        stage("Push to Docker Hub"){
            steps {
                echo "Pushing the image to docker hub"
                withCredentials([usernamePassword(credentialsId:"docker",passwordVariable:"dockerPass",usernameVariable:"dockerUser")]){
                sh "docker tag web3 ${env.dockerUser}/web3:latest"
                sh "docker login -u ${env.dockerUser} -p ${env.dockerPass}"
                sh "docker push ${env.dockerUser}/web3:latest"
                }
            }
        }
        stage("Deploy"){
            steps {
                echo "Deploying the container"
                sh "docker-compose down && docker-compose up -d"
                
            }
        }
    }
}
