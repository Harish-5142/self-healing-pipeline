pipeline {
    agent any
    
    environment {
        // GitHub token for creating PRs
        GITHUB_TOKEN = credentials('github-token')
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                script {
                    try {
                        sh 'npm install'
                        sh 'npm test'
                    } catch (Exception e) {
                        // Build failed - trigger self-healing
                        echo "Build failed: ${e.getMessage()}"
                        
                        // Capture build logs
                        def logs = currentBuild.rawBuild.getLog(1000)
                        
                        // Run self-healing agent
                        def healingResult = sh(
                            script: "python3 healing_agent.py << 'EOF'\n${logs}\nEOF",
                            returnStatus: true,
                            returnStdout: true
                        )
                        
                        if (healingResult == 0) {
                            echo "Self-healing agent created a fix!"
                            // Retry the build after healing
                            sh 'git fetch'
                            sh 'git checkout auto-heal-*' // Checkout the latest healing branch
                            sh 'npm install'
                            sh 'npm test'
                        } else {
                            error "Build failed and couldn't be auto-healed"
                        }
                    }
                }
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed even after healing attempts'
        }
    }
}