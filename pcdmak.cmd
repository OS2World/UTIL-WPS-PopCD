@echo off
echo [COMPILE/LINK : PopCD.C to PopCD.DLL]
gcc -Zdll -Zomf -Zso -Zsys -s -O PopCD.c PopCD.def
