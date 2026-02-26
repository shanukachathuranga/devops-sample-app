// The 'pipeline' block defines the entire Jenkins CI/CD workflow
pipeline {
    
    // The 'agent any' directive tells Jenkins to execute this pipeline on any available worker node
    agent any

    // The 'stages' block contains the sequential phases of our pipeline
    stages {
        
        // Stage 1: Retrieve the source code from GitHub
        stage('Checkout Source Code') {
            steps {
                // The 'checkout scm' command automatically pulls the latest code from the Git repository linked to this pipeline
                checkout scm
            }
        }

        // Stage 2: Compile the application into an isolated container
        stage('Build Docker Image') {
            steps {
                // The 'sh' command executes a shell script on the underlying Linux host.
                // We use Docker to build an image named 'devops-sample-app' with the tag 'latest', using the current directory ('.') as the context.
                sh 'docker build -t devops-sample-app:latest .'
            }
        }

        // Stage 3: Verify the build was successful
        stage('Verify Image Exists') {
            steps {
                // Execute a shell command to list all Docker images and filter (grep) for our newly built image name to prove it exists on the host
                sh 'docker image ls | grep devops-sample-app'
            }
        }
    }

