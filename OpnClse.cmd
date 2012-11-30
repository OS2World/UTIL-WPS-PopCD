/*
 * OpenClse.cmd - CD-ROM Tray Open/Close Test Commnad
 *
 */
call RxFuncAdd "SysLoadFuncs", "RexxUtil", "SysLoadFuncs"
call SysLoadFuncs

call RxFuncAdd 'PopCdLoadFuncs', 'POPCD', 'PopCdLoadFuncs'
call PopCdLoadFuncs

tgt_drive = "I"

cd_num = C2D(tgt_drive) - C2D("A")

rc = OpenCdRomTray(cd_num)
say "Open rc="rc
rc = CloseCdRomTray(cd_num)
say "Close rc="rc
