@ECHO OFF

cls

ECHO Enter Interface:
ECHO example: Ethernet or Ethernet2 etc
set /p interface="input: "
ECHO =======================================

ECHO Enter IP:
ECHO example: 192.168.1.11
set /p ip="input: "
ECHO =======================================

ECHO Enter Subnet:
ECHO example: 255.0.0.0
set /p subnet="input: "
ECHO =======================================

ECHO enter Gateway:
ECHO example: 192.168.1.1
set /p gateway="input: "
ECHO =======================================

netsh interface ipv4 set address name="%interface%" static %ip% %subnet% %gateway%

ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ECHO Do you want to setting DNS?
ECHO 1. Yes, DNS setting
ECHO 2. No, it is done
ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set /p pilihan="Pilih opsi:"
ECHO =======================================

if "%pilihan%"=="1" goto all
if "%pilihan%"=="2" goto exit

ECHO "wrong input, exit"
pause
goto exit

:all
ECHO Enter DNS:
ECHO example: 8.8.8.8
set /p dns="input: "
ECHO =======================================

ECHO Enter alternate DNS:
ECHO example: 8.8.4.4
set /p alternateDns="input: "
ECHO =======================================

netsh interface ipv4 add dnsserver name="%interface%" address=%dns% index=1
netsh interface ipv4 add dnsserver name="%interface%" address=%alternateDns% index=2

:exit
ipconfig /all

pause
exit
