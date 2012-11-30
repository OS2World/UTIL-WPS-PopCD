/*
 * GetFs.cmd - Get Target File System Type
 *
 */
call sysdropfuncs

call RxFuncAdd "SysLoadFuncs", "RexxUtil", "SysLoadFuncs"
call SysLoadFuncs

call RxFuncAdd 'PopCdLoadFuncs', 'POPCD', 'PopCdLoadFuncs'
call PopCdLoadFuncs

do i = 2 to 25
   rc = GetFileSystemType(i)
   say d2c(65 + i) ":" rc
end
