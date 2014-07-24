@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

cls
cd %~dp0

:: Getting NonShortened Path
:-------------------------------------
setlocal EnableDelayedExpansion
set myPath=%~DP0
set myPath=%myPath:*\=%
set fullPath=
pushd \
for %%a in ("%myPath:\=" "%") do (
   set thisDir=%%~a
   for /D %%d in ("!thisDir:~0!*") do (
      set fullPath=!fullPath!\%%d
      cd %%d
   )
)
popd
:-------------------------------------
cd %~D0%fullPath%

cd vagrant
:start
echo Please select an Option:
echo -------------------------
echo 1: Start Vagrant VM
echo 2: Reload Vagrant VM
echo 3: Shutdown Vagrant VM
echo 4: Suspend Vagrant VM
echo 5: Destroy Vagrant VM (see Note)
echo 6: Command Line (for other commands)
echo 7: Exit
echo -------------------------
echo Note: Destroy will uninstall the VM, exept the Files in the Vagrant Folder! & echo.Please create a Database-Dump before destroying the VM, to prevent Data-Loss.
echo -------------------------
set /p choice=Enter a Number: 
if '%choice%'=='1' goto :up
if '%choice%'=='2' goto :reload
if '%choice%'=='3' goto :halt
if '%choice%'=='4' goto :suspend
if '%choice%'=='5' goto :destroy
if '%choice%'=='6' goto :command
if '%choice%'=='7' goto :end
echo %Choice% is not a valid option. Please try again.
echo ...
goto :start
:up
vagrant up
goto :start
:reload
vagrant reload
goto :start
:halt
vagrant halt
goto :start
:suspend
vagrant suspend
goto :start
:destroy
vagrant destroy
goto :start
:command
set /p command=Enter Command: 
call %%command%%
goto :start
:end
pause
exit