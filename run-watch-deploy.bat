@echo off
echo Test run at %DATE% %TIME% >> "C:\Users\rajes\bat-debug.txt"
"C:\Program Files\Git\bin\bash.exe" -c "echo running bash >> /c/Users/rajes/deploy-log.txt; /c/Users/rajes/Desktop/Project/spring-boot-microservice-GitHubActions/watch-and-deploy.sh >> /c/Users/rajes/deploy-log.txt 2>&1"
echo Exit code: %ERRORLEVEL% >> "C:\Users\rajes\bat-debug.txt"
