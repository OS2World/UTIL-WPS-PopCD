/*
 * PopCD! DLL
 * 13.Jan.1999 - Open/Close CD-ROM Tray REXX API
 * 14.Jan.1999 - Get File System Type REXX API
 * 15.Jan.1999 - Disk‚ª‚È‚¢‚Æ‚«‚ÉNO DISK‚ğ–ß‚·‚æ‚¤‚Éd—l•ÏX
 *
 *
 */
#define INCL_DOSDEVICES
#define INCL_DOSDEVIOCTL
#include <os2.h>
#include <os2emx.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdlib.h>

#define EM 2

static void PopCdFunc (PCSZ name)
{
    RexxRegisterFunctionDll (name, "POPCD", name);
}


ULONG PopCdLoadFunctions (PCSZ name, LONG argc, const RXSTRING *argv,
                         PCSZ queuename, PRXSTRING retstr)
{
    retstr->strlength = 0;
    if (argc != 0)
        return 1;
    PopCdFunc("OPENCDROMTRAY");
    PopCdFunc("CLOSECDROMTRAY");
    PopCdFunc("GETFILESYSTEMTYPE");

    return 0;
}

void regerror (const char *s)
{
}

/* Open CD-ROM Tray */
PCSZ OpenCdRomTray (PCSZ name, LONG argc, const RXSTRING *argv,
                    PCSZ queuename, PRXSTRING retstr)
{
    APIRET rc;
    ULONG cbParamLenMax = 2, cbParamLen = 2;
    typedef struct _pRP {UCHAR command; UCHAR unit; }pRP;
    pRP Params;

    int drive_letter;

    Params.command = (UCHAR)(2); /* EJECT=2 / LOAD=3  */

    drive_letter = atoi(RXSTRPTR(argv[0]));

    Params.unit = (UCHAR)drive_letter;

    rc = DosDevIOCtl((HFILE)-1,IOCTL_DISK,DSK_UNLOCKEJECTMEDIA,
                     (PVOID)&Params,cbParamLenMax,&cbParamLen,
                     NULL,0,NULL);

    sprintf(retstr -> strptr, "%s", rc);
    retstr -> strlength = strlen(retstr -> strptr);

    return 0;
}


/* Close CD-ROM Tray */
PCSZ CloseCdRomTray (PCSZ name, LONG argc, const RXSTRING *argv,
                     PCSZ queuename, PRXSTRING retstr)
{
    APIRET rc;
    ULONG cbParamLenMax = 2, cbParamLen = 2;
    typedef struct _pRP {UCHAR command; UCHAR unit; }pRP;
    pRP Params;

    int drive_letter;

    Params.command = (UCHAR)(3); /* EJECT=2 / LOAD=3  */

    drive_letter = atoi(RXSTRPTR(argv[0]));

    Params.unit = (UCHAR)drive_letter;

    rc = DosDevIOCtl((HFILE)-1,IOCTL_DISK,DSK_UNLOCKEJECTMEDIA,
                     (PVOID)&Params,cbParamLenMax,&cbParamLen,
                     NULL,0,NULL);

    sprintf(retstr -> strptr, "%s", rc);
    retstr -> strlength = strlen(retstr -> strptr);

    return 0;
}


/*  */

PCSZ GetFileSystemType (PCSZ name, LONG argc, const RXSTRING *argv,
                        PCSZ queuename, PRXSTRING retstr)
{
    char drive[3]; /* ex. J: */
    char fsys[16];

/*
    strcpy(drive, RXSTRPTR(argv[0]));
    strcat(drive, ":");
*/
    if (strcmp(RXSTRPTR(argv[0]), "0" ) == 0 ){ strcpy(drive, "A:"); }
    if (strcmp(RXSTRPTR(argv[0]), "1" ) == 0 ){ strcpy(drive, "B:"); }
    if (strcmp(RXSTRPTR(argv[0]), "2" ) == 0 ){ strcpy(drive, "C:"); }
    if (strcmp(RXSTRPTR(argv[0]), "3" ) == 0 ){ strcpy(drive, "D:"); }
    if (strcmp(RXSTRPTR(argv[0]), "4" ) == 0 ){ strcpy(drive, "E:"); }
    if (strcmp(RXSTRPTR(argv[0]), "5" ) == 0 ){ strcpy(drive, "F:"); }
    if (strcmp(RXSTRPTR(argv[0]), "6" ) == 0 ){ strcpy(drive, "G:"); }
    if (strcmp(RXSTRPTR(argv[0]), "7" ) == 0 ){ strcpy(drive, "H:"); }
    if (strcmp(RXSTRPTR(argv[0]), "8" ) == 0 ){ strcpy(drive, "I:"); }
    if (strcmp(RXSTRPTR(argv[0]), "9" ) == 0 ){ strcpy(drive, "J:"); }
    if (strcmp(RXSTRPTR(argv[0]), "10") == 0 ){ strcpy(drive, "K:"); }
    if (strcmp(RXSTRPTR(argv[0]), "11") == 0 ){ strcpy(drive, "L:"); }
    if (strcmp(RXSTRPTR(argv[0]), "12") == 0 ){ strcpy(drive, "M:"); }
    if (strcmp(RXSTRPTR(argv[0]), "13") == 0 ){ strcpy(drive, "N:"); }
    if (strcmp(RXSTRPTR(argv[0]), "14") == 0 ){ strcpy(drive, "O:"); }
    if (strcmp(RXSTRPTR(argv[0]), "15") == 0 ){ strcpy(drive, "P:"); }
    if (strcmp(RXSTRPTR(argv[0]), "16") == 0 ){ strcpy(drive, "Q:"); }
    if (strcmp(RXSTRPTR(argv[0]), "17") == 0 ){ strcpy(drive, "R:"); }
    if (strcmp(RXSTRPTR(argv[0]), "18") == 0 ){ strcpy(drive, "S:"); }
    if (strcmp(RXSTRPTR(argv[0]), "19") == 0 ){ strcpy(drive, "T:"); }
    if (strcmp(RXSTRPTR(argv[0]), "20") == 0 ){ strcpy(drive, "U:"); }
    if (strcmp(RXSTRPTR(argv[0]), "21") == 0 ){ strcpy(drive, "V:"); }
    if (strcmp(RXSTRPTR(argv[0]), "22") == 0 ){ strcpy(drive, "W:"); }
    if (strcmp(RXSTRPTR(argv[0]), "23") == 0 ){ strcpy(drive, "X:"); }
    if (strcmp(RXSTRPTR(argv[0]), "24") == 0 ){ strcpy(drive, "Y:"); }
    if (strcmp(RXSTRPTR(argv[0]), "25") == 0 ){ strcpy(drive, "Z:"); }

    if (_filesys (drive, fsys, sizeof (fsys)) != 0)
    {
    /*  perror ("_filesys"); */
        sprintf(retstr -> strptr, "%s", "NO DISK");
        retstr -> strlength = strlen(retstr -> strptr);
    }
    else
    {
        sprintf(retstr -> strptr, "%s", fsys);
        retstr -> strlength = strlen(retstr -> strptr);
    }

    return 0;
}
