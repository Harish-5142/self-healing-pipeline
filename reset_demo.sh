#!/bin/bash
# Reset demo with errors for Linux/macOS

cd demo2

# NPM Conflict
cat > package.json << 'EOF'
{
  "name": "demo2",
  "version": "1.0.0",
  "dependencies": {
    "react": "17.0.0",
    "react-dom": "18.0.0"
  }
}
EOF

# Python Duplicates
cat > requirements.txt << 'EOF'
Django==3.2
django==4.0
flask==2.0
Flask==2.1
EOF

# Docker Memory Error
cat > docker-compose.yml << 'EOF'
services:
  web:
    image: nginx
    deploy:
      resources:
        limits:
          memory: 50M
EOF

# JSON Error with trailing commas
cat > config.json << 'EOF'
{
  "name": "myapp",
  "version": "1.0.0",
  "settings": {
    "theme": "dark",
    "language": "en",
  },
  "features": [
    "auth",
    "logging",
  ]
}
EOF

cd ..
echo "✅ Demo errors reset! Ready to run agent."