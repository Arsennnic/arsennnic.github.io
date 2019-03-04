cd /d %~dp0
start vcxsrv.exe -clipboard -wgl -keyhook -nodecoration -screen 0 1920x1200@2
sleep 2
powershell.exe -WindowStyle Hidden -c ubuntu