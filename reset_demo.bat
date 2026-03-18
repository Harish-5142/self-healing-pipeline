@echo off
cd C:\Users\Asus\self-healing-pipeline\demo2

echo Creating NPM Conflict...
echo { > package.json
echo   "name": "demo2", >> package.json
echo   "version": "1.0.0", >> package.json
echo   "dependencies": { >> package.json
echo     "react": "17.0.0", >> package.json
echo     "react-dom": "18.0.0" >> package.json
echo   } >> package.json
echo } >> package.json

echo Creating Python Duplicates...
echo Django==3.2 > requirements.txt
echo django==4.0 >> requirements.txt
echo flask==2.0 >> requirements.txt
echo Flask==2.1 >> requirements.txt

echo Creating Docker Memory Error...
echo services: > docker-compose.yml
echo   web: >> docker-compose.yml
echo     image: nginx >> docker-compose.yml
echo     deploy: >> docker-compose.yml
echo       resources: >> docker-compose.yml
echo         limits: >> docker-compose.yml
echo           memory: 50M >> docker-compose.yml

echo Creating JSON Error...
echo { > config.json
echo   "name": "myapp", >> config.json
echo   "version": "1.0.0", >> config.json
echo   "settings": { >> config.json
echo     "theme": "dark", >> config.json
echo     "language": "en", >> config.json
echo   }, >> config.json
echo   "features": [ >> config.json
echo     "auth", >> config.json
echo     "logging", >> config.json
echo   ] >> config.json
echo } >> config.json

cd ..
echo ✅ Demo errors reset! Ready to run agent.