::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
::  LG Spirit root script
::  Windows version
::
::  Copyright (C) 2013 Dan Rosenberg (@djrbliss)
::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Instructions:
::
::  1. Ensure you have the latest drivers installed from LG
::
::  2. Put your device in USB debugging mode
::
::  3. Attach it via USB
::
::  4. Run this script in the same directory as the rest of the extracted
::     zipfile
::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
::  Modified by k0nane :: k0@k0nane.info
::	- Nerf RCT - LG/VZW, umad?
::	- Push up-to-date Superuser, su binary
::  - Stericson busybox
::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
cd "%~dp0"

echo [*] FOR LG LUCID 2 ONLY! FOR LG LUCID 2 ONLY! FOR LG LUCID 2 ONLY!
echo [*]
echo [*] Spirited Away: LG Spirit 4G Root Exploit (Windows version)
echo [*] by Dan Rosenberg (@djrbliss)
echo [*]
echo [*] RCT (Root Checker Tool) nerfing modification
echo [*] by k0nane (@k0nane)
echo [*]
echo [*] FOR LG LUCID 2 ONLY! FOR LG LUCID 2 ONLY! FOR LG LUCID 2 ONLY!
echo [*]
echo [*] Before continuing, ensure USB debugging is enabled, that you
echo [*] have the latest LG drivers installed, and that your phone
echo [*] is connected via USB.
echo [*]
echo [*] Modified by lgrootnoob from XDA Devs forum, 2014
pause
echo.
echo [*] Waiting for device...
echo Make sure you installed the driver "THISFIRST.exe"
echo And make sure usb debugging is ticked in developer options.
adb wait-for-device
echo.
echo _______________________________________________
echo Rooting Procedure
echo Do not install Supersu and make sure to launch framaroot.
cd %cddir%
call root 3
call work
echo PLEASE SELECT GANDALF EXPLOIT ON SCREEN BEFORE CONTINUING
pause
echo Rebooting, please wait.
adb reboot
adb wait-for-device
pause
echo ________________________________________________
echo.
echo ________________________________________________
echo Busybox Procedure
adb push busybox.apk /data/local/tmp/busybox.apk
adb shell pm install /data/local/tmp/busybox.apk
adb shell am start -a android.intent.action.MAIN -n stericson.busybox/.Activity.MainActivity
echo Install busybox onscreen before continuing!
pause
echo ________________________________________________
echo [*] Device found.
adb shell "touch /sdcard/d1l_security"

echo [*] Rebooting device...
adb reboot

echo [*] Waiting for phone to reboot.
adb wait-for-device

echo [*] Nerfing RCT... lgrootnoob revision
adb shell "su -c busybox kill $(ps | grep 'rctd' | awk '{print $2}') && su -c busybox mount -o remount,rw /system && su -c rm /system/bin/rctd"
adb shell "su -c busybox mount -o remount,rw /system"
adb shell "su -c rm -rf /system/bin/rctd"
adb shell "su -c busybox mount -o remount,rw /data"
adb shell "su -c busybox mount -o remount,rw /persist"
adb shell "su -c busybox rm -rf /data/system/lgmdm_root_flags.txt"
adb shell "su -c busybox rm -rf /persist/rct"
adb shell "su -c busybox rm -rf /persist/LostFound/*"
echo [*] Enabling persistent root...
adb shell "su -c ln -s /system/bin/su /system/xbin/su"
echo For best results please use an OTA root keeper
echo [*] Cleaning up...
echo Root done!
echo.
echo ________________________________________________
echo Time to install cwm recovery!
adb push lte2_l1m_recovery.apk /data/local/tmp/lte2_l1m_recovery.apk
adb shell pm install /data/local/tmp/lte2_l1m_recovery.apk
adb shell am start -a android.intent.action.MAIN -n com.eclipse.android.razr.bootstrap/.Bootstrap
echo Onscreen, please hit recovery apply, then hit reboot.
pause
adb wait-for-device
echo _______________________________________________
adb shell "su -c rm /sdcard/d1l_security"
echo [*] Rebooting...

echo [*] Exploit should have completed!
echo Performing Cleanup and last-minute additions
call qfx 3
adb shell "su -c busybox rm -rf /data/local/tmp/*"
adb shell "su -c busybox chmod 755 /system/xbin/su"
adb shell "su -c busybox chmod 755 /system/bin/su"
cd %cddir%
call apkin Superuser.apk
adb reboot
adb wait-for-device
echo If you had any issues or saw error messages please screenshot them and put them in the forum.
echo P.S, IM DA BESS MAYNE, I DEED IT -  courtesy of lgrootnoob and eli porter, jk just me
pause
echo.
echo If you wish, you can now go install the lucidian rom.
echo It is also recommended to update supersu now