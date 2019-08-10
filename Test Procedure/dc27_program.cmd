@echo off

rem For use with NXP LPC-Link 2 and MCUxpresso 10.2.1 

rem https://community.nxp.com/thread/389139
rem https://community.nxp.com/thread/389128
rem https://community.nxp.com/thread/388964
rem https://community.nxp.com/thread/459394

echo.
echo Welcome to the DEF CON 27 Badge Programming Station
echo.

set MCUX_IDE_BIN=C:/nxp/MCUXpressoIDE_10.2.1_795/ide/bin
set MCUX_FLASH_DIR=%MCUX_SUPPORT_DIR%/Flash

rem Change these paths as needed to match your environment
set MCUX_FIRMWARE_NAME="C:/dc27_badge/Debug/dc27_badge.axf"
set MCUX_SUPPORT_DIR="C:/Users/Operator1/mcuxpresso/01/.mcuxpressoide_packages_support/MKL27Z64xxx4_support"

%MCUX_IDE_BIN%/crt_emu_cm_redlink --flash-load-exec %MCUX_FIRMWARE_NAME% -g --debug 2 --vendor NXP -p MKL27Z64xxx4 --ConnectScript kinetisconnect.scp -x %MCUX_SUPPORT_DIR% --flash-dir %MCUX_FLASH_DIR%

rem If there's an error with the programming tool...
if %errorlevel% neq 0 (
  echo.
  echo !!!!!!!!!!!! ERROR !!!!!!!!!!!! 
  echo.
  pause
  exit /b
)
