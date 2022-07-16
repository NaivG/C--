��
@echo off
cls
title C-- Main Program
ping -n 3 127.1>nul
echo.
echo C-- Program
if "%~1"=="file" goto runfile
echo Enter help for help
:com
set /p command=$C--/^>
if /i "%command%"=="help" goto help
if /i "%command%"=="exit" goto :exitp
echo Error Command.
echo %command%
goto com

:help
ping -n 2 127.1>nul
echo.
echo say#""
echo Description: Show contents within quotation marks.                  
echo.
echo wait#
echo Description: Wait for any key to continue.
echo.                   
echo exit#
echo Description: Exit the Program.
echo.
echo yinxiaohao#[1 or 2]   
echo Description: Command which yinxiaohao often use.
echo.
echo set#"[variable(only can be one letter)]=[number]"
echo Description: Set variable to [number].
echo.
echo if#"[variable(only can be one letter)]=[number]"
echo Description: Judge whether the variable is equal to the number.
echo              If is,run next line;if not,Jump to the second line below.
echo.
echo sleep#"[time]"
echo Sleep for [time] seconds.
echo.
echo.
goto com

:runfile
set tmp=0
if "%~2"=="" goto nofile
if "%~2"==" " goto nofile
if "%~2"=="  " goto nofile
if "%~2"=="   " goto nofile
if "%~2"=="    " goto nofile
if not exist %~2 goto nofile
if "%~3"=="tmp" set tmp=1
if "%~3"=="write" goto write
set file=1
set line=1
setlocal enabledelayedexpansion
:continuecom
for /f "skip=%line%" %%a in (%~2) do (
set command=%%a
set /a line=%line%+1
if /i "!command!"=="exit#" goto :finishrun
if /i "!command!"=="wait#" echo Wait for any key... & pause>nul & goto continuecom
if /i "!command!"=="yinxiaohao#1" dir /s & goto continuecom
if /i "!command!"=="yinxiaohao#2" tree C: & goto continuecom
if /i "!command:~0,4!"=="say#" if not "!command:~5,-1!"=="" echo !command:~5,-1! & goto continuecom
if /i "!command:~0,6!"=="sleep#" if not "!command:~7,-1!"=="" ping -n !command:~7,-1! 127.1>nul & goto continuecom
if /i "!command:~0,4!"=="set#" (
if not "!command:~5,1!"=="" if "!command:~6,1!"=="=" if not "!command:~7,-1!"=="" (
set !command:~5,1!=!command:~7,-1!
goto continuecom
)
)
if /i "!command:~0,3!"=="if#" (
if not "!command:~4,1!"=="" if "!command:~5,1!"=="=" if not "!command:~6,-1!"=="" (
if not "!command:~4,1!"=="!command:~6,-1!" set /a line=%line%+1
goto continuecom
)
)
echo Error Command.
goto continuecom
)

:write
set file=1
set line=1
set inif=0
setlocal enabledelayedexpansion
echo writing file...
echo ::C-- file:: >temp.bat
echo @echo off >>temp.bat
:continuecom2
for /f "skip=%line%" %%a in (%~2) do (
set command=%%a
set /a line=%line%+1
if /i "!command!"=="exit#" goto :finishrun2
if /i "!command!"=="wait#" echo echo Wait for any key... >>temp.bat & echo pause^>nul >>temp.bat & if "%inif%"=="1" ( echo ^) >>temp.bat & set inif=0 ) & goto continuecom2
if /i "!command!"=="yinxiaohao#1" echo dir /s >>temp.bat & if "%inif%"=="1" ( echo ^) >>temp.bat & set inif=0 ) & goto continuecom2
if /i "!command!"=="yinxiaohao#2" echo tree C: >>temp.bat & if "%inif%"=="1" ( echo ^) >>temp.bat & set inif=0 ) & goto continuecom2
if /i "!command:~0,4!"=="say#" if not "!command:~5,-1!"=="" echo echo !command:~5,-1! >>temp.bat & if "%inif%"=="1" (echo ^) >>temp.bat & set inif=0) & goto continuecom2
if /i "!command:~0,6!"=="sleep#" if not "!command:~7,-1!"=="" echo ping -n !command:~7,-1! 127.1^>nul >>temp.bat & if "%inif%"=="1" (echo ^) >>temp.bat & set inif=0) & goto continuecom2
if /i "!command:~0,4!"=="set#" (
if not "!command:~5,1!"=="" if "!command:~6,1!"=="=" if not "!command:~7,-1!"=="" (
echo set !command:~5,1!=!command:~7,-1! >>temp.bat
if "%inif%"=="1" echo ) >>temp.bat & set inif=0
goto continuecom2
)
)
if /i "!command:~0,3!"=="if#" (
if not "!command:~4,1!"=="" if "!command:~5,1!"=="=" if not "!command:~6,-1!"=="" (
echo if "!command:~4,1!"=="!command:~6,-1!" >>temp.bat
set inif=1
goto continuecom2
)
)
echo Error Command.
goto continuecom
)


:finishrun2
echo echo Complete running. >>temp.bat
echo del /s /q temp.bat >>temp.bat
echo pause >>temp.bat
echo exit >>temp.bat
echo Complete writing.Press any key to run.
pause>nul
call temp.bat
exit

:finishrun
echo Complete running.
if "%tmp%"=="1" del /s /q temp.c--
pause
goto exitp

:nofile
echo Cannot find C-- file.
ping -n 3 127.1>nul
exit

:exitp
exit