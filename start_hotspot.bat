@ECHO OFF
:: This program is for making hotspot wifi on your windows
:: run as admin first
:: this tests if the file is running as admin
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' ( GOTO askAdmin )
GOTO gotAdmin
:askAdmin

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' 
(
	echo Requesting administrative privileges...
	goto UACPrompt
) 
else ( goto gotAdmin )
:UACPrompt

echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin

if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
::from this point you can execute your command as admin
netsh wlan set hostednetwork mode=allow ssid=W3fe2f92 key=hadihensem
netsh wlan start hostednetwork
pause