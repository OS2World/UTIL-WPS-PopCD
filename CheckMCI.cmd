/* */
rc = rxfuncadd( "sysloadfuncs", "rexxutil", "sysloadfuncs")
rc = sysloadfuncs()


boot_drive = "C:"
config_sys = boot_drive"\config.sys"

mmos2 = "Disabled"
do until lines(config_sys) = 0
    line_text=strip(linein(config_sys),,'=')

    if translate(left(line_text, 16)) = "DEVICE="boot_drive"\MMOS2\" then do
        mmos2 = "Enabled"
    end
end
call lineout config_sys

say "MMOS/2 is "mmos2

if mmos2 = "Enabled" then do
    rc = rxfuncadd( "mciRxInit", "MCIAPI", "mciRxInit" )
    say "RC#1="rc
    rc = mciRxInit()
    say "RC#2="rc
end
