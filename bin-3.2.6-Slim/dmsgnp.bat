@echo off
adb shell "dmesg" > %cddir%\..\Work\dmesgout.txt
call start notepad %cddir%\..\Work\dmesgout.txt
goto :EOF