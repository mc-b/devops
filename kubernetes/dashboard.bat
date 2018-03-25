REM Startet den Default Browser mit der Dashboard Startseite und den Port Forward 

cd /d %~d0%~p0

set DOCKER_HOST=tcp://192.168.60.100:2376
set DOCKER_TLS_VERIFY=1
set DOCKER_CERT_PATH=%~d0%~p0.docker
set KUBECONFIG=%~d0%~p0.kube\config
 
start http://localhost:8001/ui /B
kubectl proxy
