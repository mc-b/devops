REM Setzt die Docker Umgebungsvariablen und startet PowerShell 

cd /d %~d0%~p0

set DOCKER_HOST=tcp://192.168.60.100:2376
set DOCKER_TLS_VERIFY=1
set DOCKER_CERT_PATH=%~d0%~p0.docker
set KUBECONFIG=%~d0%~p0.kube\config

powershell.exe