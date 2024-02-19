@echo off

:: This is useful if we start from a network share; converts CWD to a drive letter
pushd %~dp0

:: Copy script to powershell folder 
xcopy "logoff-older-logins.ps1*" "C:\Windows\System32\" /q /i /y

:: Create scheduled task to run at user logon
schtasks /create /xml logoff-older-logins.xml /tn logoff-older-logins

exit /b %errorlevel%
