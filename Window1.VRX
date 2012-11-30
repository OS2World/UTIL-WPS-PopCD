/*:VRX         Main
*/
/*
 * PopCd - Pop CD-ROM Drive
 * (Old name : PopFd - Pop Floppy Disk)
 *
 * [History]
 * Version 0.01, 0.02, 0.10 (28.Sep.98)
 * > Startup!
 * Version 0.15 (21.Dec.98) since 21.Dec.98
 * > CD-ROM用に変更して開発続行予定。
 * Version 0.20
 * Version 0.21 (06.Jan.99) since 05.Jan.99
 * > Timing調整
 * Version 1.00 (06.Jan.1999)
 * > 正式リリース
 * Version 1.09 beta 1 (14.Jan.1999)
 * > CD-ROM Object削除時に自動的にCD-ROMを排出する機能を追加(PopCd.dll)。
 * Version 1.09 beta 2 (15.Jan.1999)
 * > DLLの作り込み。
 * > CD-ROM ObjectのTitleにCD-ROMのVolume Labelを表示出来るように機能追加。
 * Version 1.10 (16.Jan.1999)
 * > Version 1.10公開。
 * > INIファイルのHeaderの記述を訂正。
 * > 初期起動時のFont設定での表示の記述を訂正。
 * Version 2.00 (11.Feb.1999) since 19.Jan.1999
 * > Support CD Audio media (auto play) (1.19 beta 1,2,3,4 19-22.Jan.1999)
 * > Volume追加 (1.19 beta 5 23.Jan.1999)
 * > CD Player作り込み (1.19 beta 6 24.Jan.1999)
 * > Audio CDのAuto PlayをEnable/Disable出来るように機能強化(1.19 beta 6 24.Jan.1999)
 * > CD Object NameにDrive Nameを追記するように仕様変更。これは将来の複数CD-ROM Drive対応への準備(1.19 beta 7 24.Jan.1999)
 *   ただし、これはかなり面倒な気がしてきた...
 * > CdPlayerのMoveWithParentをDisabledに仕様変更(1.19 beta 7 24.Jan.1999)
 * > CD Player修正(1.19 beta 8 24.Jan.1999)
 * > Enable/Disable Audio CD (1.19 beta 8 24.Jan.1999)
 *   PopCD!を複数たち上げればCD-ROMならば複数Pop Upできるかもしれない？
 * > CD-ROM Driveが空のときにDelay Time毎にHard Diskにaccessしてしまう問題の修正。ただし、これで完全に修正されているのかはまだ明確ではないが。(1.19 b3ta 9 25.Jan.1999)
 * > ICONファイルを使用しないように仕様変更 (1.19 beta 9 25.Jan.1999)
 * > System Shutdownの時にini fileがsaveされずに終了してしまう問題をたぶん解決(1.19 beta 10 26.Jan.1999)
 * > CD AudioのDevice IDを指定できるように仕様変更(1/19 beta 10 27.Jan.1999)
 *   ※本来は自動的に認識させるべきではあるが、まだその方法がわからない...
 * > Warp終了時やReboot時にInitialFileの書き込みあたりでエラーが出る問題にたぶん対応(1.19 beta 11 30.Jan.1999)
 * > Fontを変更しても再起動時に反映されない不具合を修正(1.19 beta 11 30.Jan.1999)
 * > CD-ROM Objectのパラメータ変更時にTimerをDisableにするように機能の統一とDisableになったことがわかるようにTimerのCheck Boxを赤で表示するように仕様変更(1.19 beta 11 30.Jan.1999)
 * > PopCD!終了時等にCD-ROMのタイトルを元に戻すように仕様変更。ただし、現在はまだ英語名(DRIVE I)でしか対応できず(1.19 beta 11 30.Jan.1999)
 * > Audio CDが入っているときにCD-ROM DriveのDoorをlockするように仕様変更(1.19 beta 11 30.Jan.1999)
 * > いろいろ不具合への対策をうつ。しかし、すべてうまく解決したわけではない(1.19 beta 12 31.Jan.1999)
 * > マルチメディア セットアップ(MMPM/2 Setup)のプロパティをOpenするボタンを追加(1.19 beta 12 31.Jan.1999)
 * > Audio CD ObjectにIDをCD DriveのIDからCD Audio Device IDに変更。将来のMulti CD-ROMに対応するため(1.19 beta 13 31.Jan.1999)
 * > Exit Button以外での終了時にFiniでErrorが発生する問題に対応。起動時にDesktopに残ったObjectを消去するように仕様変更(1.19 beta 14 01.Feb.1999)
 * > Exit ButtonでPopCD!を終了したときにもCD-ROMのObjectを削除するように仕様を元に戻した(1.19 beta 15 03.Feb.1999)
 * > 複数のCD-ROMに対応(1.99 beta 1,2 05.Feb.1999頃)
 * > CD-ROMを自動的に認識するように仕様変更(1.99 beta 1,2 05.Feb.1999頃)
 * > CD-ROM以外のRemovable Mediaにも対応(ただし、十分テストしてから使用すること！) (1.99 beta 3 06.Feb.1999)
 * > ちょっと作り込み (1.99 beta 4, 5 06-07.Feb.1999)
 * > FolderのBackgroundの背景を変更する機能をDisable (1.99 beta 6 07.Feb.1999)
 * > 多少作り込んでVersion 2.00で公開。同時にShareware化(11.Feb.1999)
 * Version 2.01 (11.Feb.1999)
 * > Fiexed the inconveniences occures when check `Audio CD' check box.
 * Version 2.05 (18.Mar.1999) since 12.Feb.1999
 * > Ignore Drives Listの追加(CD-ROMのみ) (2.02 beta 1 12.Feb.1999)
 * > 作り込み(Enable/Disable等) (2.02 beta 1 12.Feb.1999)
 * > External CD-ROM使用時にCD-ROMのDoorが開かない問題の修正？(2.02 beta 2, 13.Feb.1999)
 * > LastDrive Parameterの追加(2.02 beta 3, 20.Feb.1999)
 * > LastDrive Parameterの変更(Z → Z:) (2.02 beta 4 20.Feb.1999)
 * > Shutdown時やExit Button以外で終了した場合にErrorが生じる問題を回避(2.02 beta 5 23.Feb.1999)
 *   ただし、これをコメントアウトしてよいのかは不明であるが...
 *      [Main]
 *      _VREHalt:
 *          _VREReturnValue = Fini()
 *          call VRDestroy _VREPrimaryWindow
 *
 * > IgnoreDrive.0の問題を修正(TM_PopCdTrigger_Trigger) (2.02 beta 6, 27.Feb.1999)
 * > Shutdown時のErrorを回避(2.02 beta 7, 07.Mar.1999)
 *   ただし、これをコメントアウトしてよいのかは不明であるが...
 *      [Fini]
 *      window = VRWindow()              ←コメントアウトした。
 *      call VRSet window, "Visible", 0  ←コメントアウトした。
 *      drop window                      ←コメントアウトした。
 * > 下記Errorを修正。他に影響がないか様子見(2.02 beta 8, 11.Mar.1999)
 *      Line 117 of TM_PopCdTrigger_Trigger in Window1.VRM:
 *      +++                     rc = SysDestroyObject(PopCdAudioObject);
 *      *** Error 43 Routine not found
 * > About WindowをUpdate(2.02 beta 9, 11.Mar.1999)
 * > beta 9を2.05として公開。
 * Version 2.10 (01.Apr.19999) since 20.Mar.1999
 * > Auto Positioning機能の追加(2.09 beta 1, 20.Mar.1999)
 * > 作り込み(2.09 beta 2, 21.Mar.1999)
 * > EnableにしたときにDriveの表記をVolumeラベルから元の表示に戻す(Captionで指定したScriptに従う) (2.09 beta 3, 23.Mar.1999)
 * > CD PlayerびTime表示のObjectを消去した為に発生した問題を修正(2.09 beta 4, 24.Mar.1999)
 * > Shutdown時のErrorを回避(2.09 beta 5, 25.Mar.1999)
 *   ただし、これをコメントアウトしてよいのかは不明であるが...
 *      [Main]
 *      _VRELeaveMain:
 *          call VRFini       ←コメント・アウトした。
 *      exit _VREReturnValue
 * > CD PlayerがEnabledの状態でTimerをDisableにしたときにCD PlayerをCloseする様に仕様変更(2.09 beta 6, 27.Mar.1999) : 不具合の修正と言ったほういいのかもしれないけれど...
 * > 細かい修正(Default設定など) (2.09 beta 6, 29.Mar.1999)
 *   NOTE : beta 6は27日～29日にかけての変更分
 * > Packageにaudiocd.icoを含めていなかった問題を修正。ついでにIcon Resource Nameを変更(01.Apr.1999)
 * > Version 2.10 release (01.Apr.1999)
 * Version 2.15 (21.Apr.1999) since 02.Apr.1999
 * > CdAudioのCheck時のPerformanceの問題を修正中 (2.11 alpha 1, 02.Apr.1999)
 * > CD Playerの時間表示をしないように仕様変更したときの残骸による不具合の修正 (2.11 beta 1, 03.Apr.1999)
 *      Line 52 of TM_CdPlayer_Timer_Trigger in Window1.VRM:
 *      +++                     ok = VRSet('Pict_Time_Minutes_10', 'PicturePath', '#250');
 * > さらにTune Up (CheckCdAudio routine) (2.11. beta 2, 04.Apr.1999)
 * > さらにTune Up (CdAudioCdRomFlag parameterの追加) (2.11.beta 3, 06.Apr.1999)
 * > External Cd PlayerのPathにSpaceが入っている場合にうまく動作しない問題を修正 (2.11 beta 3, 06.Apr.1999)
 * > CD PlayerのAlways on Top機能の追加 (2.11 beta 4, 07.Apr.1999)
 * > Folder View ModeのEnable/Disableが出来るように仕様変更 (2.11 beta 5, 10.Apr.1999)
 * > その他、作り込みや不具合の修正など (2.11 beta 5, 10.Apr.1999)
 * > Internal/External CD Playerの切替えが正しく動作しない問題を修正 (2.11 beta 6, 17.Apr.1999)
 * > Beta 7で作成したRandom Play機能はすべて白紙に戻し、beta 6を元に再度beta 7を作成(beta 7a) (2.11 beta 7a, 18.Apr.1999)
 *   * 削除したbeta 7項目
 *   > Audio CD使用時にAuto Positioning設定時にAudio CDのReloadがうまく行われない問題を修正 (2.11 beta 7, 17.Apr.1999)
 *   > Internal CD PlayerでRandom Play Modeを追加中 (2.11 beta 7, 17.Apr.1999)
 *   > Ranfom Play Modeは開発停止(Loop Modeも同様)。ただし、途中まで作成したCodeはとりあえずそのまま保存 (2.11 beta 7, 17-18.Apr.1999)
 * > Version 2.15 release (21.Apr.1999)
 * Version 2.15a (14.Jun.1999)
 * > 扱えるAudio CDのDevice IDをとりあえず#6まで拡張。
 * Version 2.16 (13.Aug.1999)
 * > ObjectのEject時、Drive名をDefault名(ex.Drive J:)に戻す様に仕様変更 (Add 12.Aug.1999)
 * Version 2.17 (21.Aug.1999) since 16.Aug.1999
 * > CD Audio Device IDが正しく設定できない不具合の修正 (2.17 beta 1, 16.Aug.1999)
 * > GetCdRomNumber routineでS:/Z: Driveが正しく変換されない不具合を修正 (2.17 beta 1, 16.Aug.1999)
 * > CD PlayerでContext Menuを追加 (2.17 beta 2, 16.Aug.1999)
 * > 細かい修正/調整 (2.17 beta 3, 17.Aug.1999)
 * > Veriosn 2.17公開 (21.Aug.1999)
 * Version 2.18 (26.Sep.1999) since 04.Sep.1999
 * > Tiny CD PlayerのBug Fix (2.18 beta 1, 04.Sep.1999)
 * > DEMO版用機能の追加とそれに伴う機能拡張。有効期限は1999年12月31日。(2.18 beta 2, 08.Sep.1999)
 * > Tiny CD Playerのbug Fix/作り込み (2.18 beta 3, 18.Sep.1999)
 * > Version 2.18公開 (25.Sep.1999)
 * Version 2.19 beta (29.Nov.1999) since 05.Nov.1999
 * > CD Play Track List Menuの追加 (2.19 beta 1, 05.Nov.1999)
 * > Track Numberの拡張(30 Tracks → 40 Tracks)とSpec(最大40 Tracks)を越えた場合のError回避Routineを追加 (2.19 beta 2, 07.Nov.1999)
 * > Track Number表示を作り込み (2.19 beta 3, 07.Nov.1999)
 * > Tiny CD PlayerのTrack Number関連作り込み (2.19 beta 4, 10.Nov.1999)
 * > Tiny CD PlayerのTrack Number関連作り込み2 (2.19 beta 5, 10.Nov.1999)
 * > Tiny CD PlayerにKey Command追加 (2.19 beta 5, 10.Nov.1999)
 * > Version 2.19公開 (29.Nov.1999)
 * Version 2.20 (12.Sep.2004) since 26.Oct.2002
 * > Freeware化 (26.Oct.2002)
 *
 *
 *
 *
 */
/*  Main
*/
Main:
/*  Process the arguments.
    Get the parent window.
*/
    parse source . calledAs .
    parent = ""
    argCount = arg()
    argOff = 0
    if( calledAs \= "COMMAND" )then do
        if argCount >= 1 then do
            parent = arg(1)
            argCount = argCount - 1
            argOff = 1
        end
    end; else do
        call VROptions 'ImplicitNames'
    end
    InitArgs.0 = argCount
    if( argCount > 0 )then do i = 1 to argCount
        InitArgs.i = arg( i + argOff )
    end
    drop calledAs argCount argOff

/*  Load the windows
*/
    call VRInit
    parse source . . spec
    _VREPrimaryWindowPath = ,
        VRParseFileName( spec, "dpn" ) || ".VRW"
    _VREPrimaryWindow = ,
        VRLoad( parent, _VREPrimaryWindowPath )
    drop parent spec
    if( _VREPrimaryWindow == "" )then do
        call VRMessage "", "Cannot load window:" VRError(), ,
            "Error!"
        _VREReturnValue = 32000
        signal _VRELeaveMain
    end

/*  Process events
*/
    call Init
    signal on halt
    do while( \ VRGet( _VREPrimaryWindow, "Shutdown" ) )
        _VREEvent = VREvent()
        interpret _VREEvent
    end
_VREHalt:
    _VREReturnValue = Fini()
/*
 * 試しにここをコメント・アウトしてみよう... (23.Feb.1999)
 *
    call VRDestroy _VREPrimaryWindow
*/
_VRELeaveMain:
/*
 * Shutdown時にここでひっかかる時があるので、ここもコメント・アウトしてみる。(25.Mar.1999)
 * いいのかなぁ？
 *
    call VRFini
*/
exit _VREReturnValue

VRLoadSecondary:
    __vrlsWait = abbrev( 'WAIT', translate(arg(2)), 1 )
    if __vrlsWait then do
        call VRFlush
    end
    __vrlsHWnd = VRLoad( VRWindow(), VRWindowPath(), arg(1) )
    if __vrlsHWnd = '' then signal __vrlsDone
    if __vrlsWait \= 1 then signal __vrlsDone
    call VRSet __vrlsHWnd, 'WindowMode', 'Modal'
    __vrlsTmp = __vrlsWindows.0
    if( DataType(__vrlsTmp) \= 'NUM' ) then do
        __vrlsTmp = 1
    end
    else do
        __vrlsTmp = __vrlsTmp + 1
    end
    __vrlsWindows.__vrlsTmp = VRWindow( __vrlsHWnd )
    __vrlsWindows.0 = __vrlsTmp
    do while( VRIsValidObject( VRWindow() ) = 1 )
        __vrlsEvent = VREvent()
        interpret __vrlsEvent
    end
    __vrlsTmp = __vrlsWindows.0
    __vrlsWindows.0 = __vrlsTmp - 1
    call VRWindow __vrlsWindows.__vrlsTmp
    __vrlsHWnd = ''
__vrlsDone:
return __vrlsHWnd

/*:VRX         CB_AudioCd_Click
*/
CB_AudioCd_Click:

    if Timing <> "Startup" then do
        ok = VRSet( "CB_PopFDEnabled", "Set", 0 )
        ok = VRSet( "CB_PopFDEnabled", "ForeColor", "Red" )

        PopCdTrigger = "Disabled"
        call SetPopCdTrigger PopCdTrigger
    end

    set = VRGet( "CB_AudioCd", "Set" )
    if set = 1 then do
        AudioCd = "Enabled"

        ok = VRSet( "DT_AudioCdDeviceId",  "Enabled", 1 )
        ok = VRSet( "SPIN_CdAudioId",      "Enabled", 1 )

        ok = VRSet( "RB_UsePopCdPlayer",      "Enabled", 1 )
        ok = VRSet( "RB_UseExternalCdPlayer", "Enabled", 1 )

        call SetAudioCdCdplayerParameters CdPlayerMode

        ok = VRSet( "PB_MMPM2_Setup", "Enabled", 1 )
    end
    else if set = 0 then do
        AudioCd = "Disabled"

        ok = VRSet( "DT_AudioCdDeviceId",  "Enabled", 0 )
        ok = VRSet( "SPIN_CdAudioId",      "Enabled", 0 )

        ok = VRSet( "RB_UsePopCdPlayer",        "Enabled", 0 )
        ok = VRSet( "PB_InternalCdPlayerSetup", "Enabled", 0 )

        ok = VRSet( "EF_ExternalCdPlayer",    "Enabled", 0 )
        ok = VRSet( "PB_SetExternalCdPlayer", "Enabled", 0 )
        ok = VRSet( "RB_UseExternalCdPlayer", "Enabled", 0 )

        ok = VRSet( "PB_MMPM2_Setup", "Enabled", 0 )

        rc = SysDestroyObject(PopCdAudioObject)

        if CdPlayer = "Enabled" then do
            call DisableCdRomButtons

            CdAudioStatus = "Disabled"
            CdAudioCdRomFlag = "OFF"

            CdPlayer = "Disabled"
            call VRDestroy( "SW_CdPlayer" )
        end

        CdAudioStatus = "Disabled"
    end

    /* for save parameters in initial file */
    Parameters = "Changed"

return

/*:VRX         CB_AutoRun_Click
*/
CB_AutoRun_Click:

    set = VRGet( "CB_AutoRun", "Set" )
    if      set = 1 then AutoRun = "Enabled"
    else if set = 0 then AutoRun = "Disabled"

return

/*:VRX         CB_CdPlayerAlwaysOnTop_Click
*/
CB_CdPlayerAlwaysOnTop_Click:

    set = VRGet( "CB_CdPlayerAlwaysOnTop", "Set" )
    select
        when set = 0 then CdPlayerAlwaysOnTop = "OFF"
        when set = 1 then CdPlayerAlwaysOnTop = "ON"
        otherwise
    end

    /* for save parameters in initial file */
    Parameters = "Changed"

return

/*:VRX         CB_CdPlayerAutoPlay_Click
*/
CB_CdPlayerAutoPlay_Click:

    set = VRGet( "CB_CdPlayerAutoPlay", "Set" )
    select
        when set = 0 then do
            CdPlayerAutoPlay = "Disabled"
        end
        when set = 1 then do
            CdPlayerAutoPlay = "Enabled"
        end
    end

    /* for save parameters in initial file */
    Parameters = "Changed"

return

/*:VRX         CB_FolderViewMode_Click
*/
CB_FolderViewMode_Click:

    set = VRGet( "CB_FolderViewMode", "Set" )
    select
        when set = 1 then do
            ViewMode = "Enabled"

            call SetDefaultView
        end
        when set = 0 then do
            ViewMode = "Disabled"
        end
    end

    call SetViewModeParameters ViewMode

    /* for save parameters in initial file */
    Parameters = "Changed"

return

/*:VRX         CB_MinimizedStartup_Click
*/
CB_MinimizedStartup_Click:

    set = VRGet( "CB_MinimizedStartup", "Set" )
    if set = 1 then do
        MinimizedStartup = "Enabled"
    end
    if set = 0 then do
        MinimizedStartup = "Disabled"
    end

    /* for save parameters in initial file */
    Parameters = "Changed"

return

/*:VRX         CB_OpenFolder_Click
*/
CB_OpenFolder_Click:

    set = VRGet( "CB_OpenFolder", "Set" )
    select
        when set = 1 then do
            OpenFolder = "Enabled"
        end
        when set = 0 then do
            OpenFolder = "Disabled"
        end
    end

    /* for save parameters in initial file */
    Parameters = "Changed"

return

/*:VRX         CB_OtherRemovableMedia_Click
*/
CB_OtherRemovableMedia_Click:

    if Timing <> "Startup" then do
        ok = VRSet( "CB_PopFDEnabled", "Set", 0 )
        ok = VRSet( "CB_PopFDEnabled", "ForeColor", "Red" )

        PopCdTrigger = "Disabled"
        call SetPopCdTrigger PopCdTrigger
    end

    set = VRGet( "CB_OtherRemovableMedia", "Set" )
    if set = 0 then do
        OtherRemovableMedia = "Disabled"

        ok = VRSet( "DT_OtherRemovableMedia",       "Enabled", 0 )
        ok = VRSet( "EF_OtherRemovableMediaDrives", "Enabled", 0 )

        ok = VRSet( "EF_OtherRemovableMediaDrives", "BackColor", "PaleGray" )

        do rd = 1 to OtherMedia.0
            i = c2d(OtherMedia.rd) - c2d("A")
            if PopCdObject.i.MEDIATYPE = "Other Removable Media" then do
                rc = SysDestroyObject(PopCdObject.i.CDOBJECTID)
                PopCdObject.i.STATUS = "UNMOUNT"

                call ClearIconPosition PopCdObject.i.CDOBJECTID
            end
        end
    end
    else if set = 1 then do
        OtherRemovableMedia = "Enabled"

        ok = VRSet( "DT_OtherRemovableMedia",       "Enabled", 1 )
        ok = VRSet( "EF_OtherRemovableMediaDrives", "Enabled", 1 )

        ok = VRSet( "EF_OtherRemovableMediaDrives", "BackColor", "<default>" )
    end

    /* for save parameters in initial file */
    Parameters = "Changed"

return

/*:VRX         CB_PopFDEnabled_Click
*/
CB_PopFDEnabled_Click:

    ok = VRSet( "CB_PopFDEnabled", "ForeColor", "<Default>" )

    set = VRGet( "CB_PopFDEnabled", "Set" )
    select
        when set = 1 then do
            PopCdTrigger = "Enabled"
            call SetPopCdTrigger PopCdTrigger

            if IconPositioning = "Auto" then do
                call SetAutoPositionValue
            end
        end
        when set = 0 then do
            PopCdTrigger = "Disabled"
            call SetPopCdTrigger PopCdTrigger

            do i = 3 to 25
                if PopCdObject.i.STATUS = "MOUNT" then do
                    if (UseVolumeLabel = "Enabled") | (CdRomCaption <> "") then do
                        parse var DefaultDriveCaption t_wrd1 "%d" t_wrd2
                        if (t_wrd2 = "") & (right(DefaultDriveCaption, 2) <> "%d") then do
                            t_wrd = strip(t_wrd1)
                        end
                        else do
                            t_wrd = strip(t_wrd1""d2c(i + c2d("A"))""t_wrd2)
                        end
                        params = "TITLE="t_wrd";"

                        rc = SysSetObjectData( PopCdObject.i.CDOBJECTID, params )
                    end

                    rc = SysDestroyObject(PopCdObject.i.CDOBJECTID)
                    PopCdObject.i.STATUS = "UNMOUNT"
                end
            end

            rc = SysDestroyObject(PopCdAudioObject)
            CdAudioStatus = "Disabled"

            if CdPlayer = "Enabled" then do
                call DisableCdRomButtons

                CdAudioStatus = "Disabled"
                CdAudioCdRomFlag = "OFF"

                CdPlayer = "Disabled"
                call VRDestroy( "SW_CdPlayer" )
            end

            call WriteInitialFile
        end
    end

    /* for save parameters in initial file */
    Parameters = "Changed"

return

/*:VRX         CB_UseVolumeLabel_Click
*/
CB_UseVolumeLabel_Click:

    if Timing <> "Startup" then do
        ok = VRSet( "CB_PopFDEnabled", "Set", 0 )
        ok = VRSet( "CB_PopFDEnabled", "ForeColor", "Red" )

        PopCdTrigger = "Disabled"
        call SetPopCdTrigger PopCdTrigger
    end

    set = VRGet( "CB_UseVolumeLabel", "Set" )
    select
        when set = 0 then do
            UseVolumeLabel = "Disabled"
        end
        when set = 1 then do
            UseVolumeLabel = "Enabled"
        end
    end

    call Reset

    /* for save parameters in initial file */
    Parameters = "Changed"

return

/*:VRX         CB_VisibleCdPlayer_Click
*/
CB_VisibleCdPlayer_Click:

    set = VRGet( "CB_VisibleCdPlayer", "Set" )
    select
        when set = 1 then do
            VisibleCdPlayer = "Enabled"
            ok = VRSet( "CB_CdPlayerAlwaysOnTop", "Enabled", 1 )
        end
        when set = 0 then do
            VisibleCdPlayer = "Disabled"
            ok = VRSet( "CB_CdPlayerAlwaysOnTop", "Enabled", 0 )
        end
    end

    /* for save parameters in initial file */
    Parameters = "Changed"

return

/*:VRX         CheckCdAudio
*/
CheckCdAudio:

    n = right(CdAudioDeviceId, 2, "0")
    rc = mciRxSendString("open cdaudio"n" alias cda shareable wait", "RetStr", "0", "0")

/*
    cd_rc = mciRxSendString("status cda number of tracks wait", "RetStr", "0", "0" )

    call mciRxExit

    if (cd_rc = 0) & (RetStr = 0) then cd_rc = 99999 /* 99999 is dummy error code */
*/

    cd_rc = mciRxSendString("status cda media present wait", "RetStr", "0", "0" )
    call mciRxExit

    /*
        NO DISK : cd_rc = 0     / RetStr = FALSE
        CD-ROM  : cd_rc = 70587 / RetStr = <NULL>
        AudioCD : cd_rc = 0     / RetStr = TRUE
    */

    /* NO DISK */
    if      (cd_rc = 0) & (RetStr = "FALSE") then do
        CdAudioCdRomFlag = "OFF"
        cd_rc = 99999 /* 99999 is dummy error code */
    end
    /* CD-ROM */
    else if (cd_rc <> 0) & (RetStr = "") then do
        CdAudioCdRomFlag = "ON"
        cd_rc = 99999 /* 99999 is dummy error code */
    end
    /* Audio CD */
    else if (cd_rc = 0) & (RetStr = "TRUE") then do
        CdAudioCdRomFlag = "ON"
    end

/*
    /* Trueが戻らない場合はすべてFALSEとする */
    if (RetStr <> "TRUE") then cd_rc = 99999 /* 99999 is dummy error code */
*/
return cd_rc

/*:VRX         ClearIconPosition
*/
ClearIconPosition:

    parse arg ObjId

    if IconPositioning = "Auto" then do
        do p = 1 to IconPosition.0
            if IconPosition.p.IconPositionObjectId = ObjId then do
                IconPosition.p.IconPositionStatus   = "NOT USED"
                IconPosition.p.IconPositionObjectId = ""
                leave
            end
        end
    end

return

/*:VRX         DisableCdRomButtons
*/
DisableCdRomButtons:

    ok = VRSet( "IPB_CD_Play", "PicturePath", "#205" )
    ok = VRSet( "IPB_CD_Play", "Enabled", 0 )

    ok = VRSet( "IPB_CD_Stop", "PicturePath", "#215" )
    ok = VRSet( "IPB_CD_Stop", "Enabled", 0 )

    ok = VRSet( "IPB_CD_NextTrack", "PicturePath", "#225" )
    ok = VRSet( "IPB_CD_NextTrack", "Enabled", 0 )

    ok = VRSet( "IPB_CD_PrevTrack", "PicturePath", "#235" )
    ok = VRSet( "IPB_CD_PrevTrack", "Enabled", 0 )

    ok = VRSet( "IPB_CdPlayer_LoadEject", "PicturePath", "#292" )

    /* CD取り出し時には00を表示する */
    ok = VRSet( "Pict_Num_10", "PicturePath", "#240" )
    ok = VRSet( "Pict_Num_01", "PicturePath", "#240" )
    ok = VRSet( "Pict_TotalNum_10", "PicturePath", "#240" )
    ok = VRSet( "Pict_TotalNum_01", "PicturePath", "#240" )

    /* Stop CD Audio */
    rc = mciRxSendString("set cda door unlocked wait", "retStr", "0", "0")

    rc = mciRxSendString("stop cda wait", "retStr", "0", "0")

    rc = mciRxSendString("status cda position track 1 wait", "retStr", "0", "0" )
/*
    rc = mciRxSendString('close cda', 'RetStr', '0', '0')

    call mciRxExit
*/
return

/*:VRX         EF_BackGroundImageFile_Change
*/
EF_BackGroundImageFile_Change:

    bg_img = VRGet( "EF_BackGroundImageFile", "Value" )

return

/*:VRX         EF_DefaultDriveCaption_Change
*/
EF_DefaultDriveCaption_Change:

    DefaultDriveCaption = VRGet( "EF_DefaultDriveCaption", "Value" )

    /* for save parameters in initial file */
    Parameters = "Changed"

return

/*:VRX         EF_IgnoreDrivesList_Change
*/
EF_IgnoreDrivesList_Change:

    value = translate(VRGet( "EF_IgnoreDrivesList", "Value" ))
    value = translate(value, "", ":") /* : を消去 */
    value = translate(value, "", ",") /* , を消去 */
    value = translate(value, "", "\") /* \ を消去 */
    value = translate(value, "", " ") /* Spaceを消去 */

    IgnoreDrivesList = strip(value)

    if value <> "" then do
        i = 0
        do forever
            ch = left(value, 1)
            if ch <> "" then do
                i = i + 1
                IgnoreDrive.i = ch
            end
            value = right(value, length(value) - 1)
            if value = "" then leave
        end
        IgnoreDrive.0 = i
    end
    else do
        IgnoreDrive.0 = 0
    end

    IgnoreDrivesList = ""
    do i = 1 to IgnoreDrive.0
        IgnoreDrivesList = IgnoreDrivesList""IgnoreDrive.i
    end

    /* for save parameters in initial file */
    Parameters = "Changed"

return

/*:VRX         EF_OtherRemovableMediaDrives_Change
*/
EF_OtherRemovableMediaDrives_Change:

    value = translate(VRGet( "EF_OtherRemovableMediaDrives", "Value" ))
    value = translate(value, "", ":")
    value = translate(value, "", ",") /* , を消去 */
    value = translate(value, "", "\") /* \ を消去 */
    value = translate(value, "", " ")

    OtherRemovableMediaList = strip(value)

    if value <> "" then do
        i = 0
        do forever
            ch = left(value, 1)
            if ch <> "" then do
                i = i + 1
                OtherMedia.i = ch
            end
            value = right(value, length(value) - 1)
            if value = "" then leave
        end
        OtherMedia.0 = i
    end
    else do
        OtherMedia.0 = 0
    end

    OtherRemovableMediaList = ""
    do i = 1 to OtherMedia.0
        OtherRemovableMediaList = OtherRemovableMediaList""OtherMedia.i
    end

    /* for save parameters in initial file */
    Parameters = "Changed"

return

/*:VRX         EF_RegistryNumber_Change
*/
EF_RegistryNumber_Change:

    ok = VRSet( "PB_Register", "Enabled", 1 )

return

/*:VRX         Fini
*/
Fini:

/* ok = VRSet( "TM_PopCdTrigger", "Enabled", 0 ) */

/*
    /* 終了時の処理 */
    if (UseVolumeLabel = "Enabled") | (CdRomCaption <> "") then do
        if MediaType = "CdAudio" then do
/* 関係ないのでいらないのであった...
            rc = SysSetObjectData( PopCdAudioObject, "TITLE=Drive "left(CdDrive, 1)";" )
*/
        end
        else do
            rc = SysSetObjectData( PopCdObject, "TITLE=Drive "left(CdDrive, 1)";" )
        end
    end
*/
    /*
    rc = SysDestroyObject(PopCdObject)
    rc = SysDestroyObject(PopCdAudioObject)
    */

    CdAudioStatus = "Disabled"

/* 本当にこれをコメント・アウトしていいのか？ */
/*
    window = VRWindow()
    call VRSet window, "Visible", 0
    drop window
*/
return 0

/*:VRX         GetCdRomNumber
*/
GetCdRomNumber:

    parse arg cd_num

    cd_num = translate(left(cd_num, 1))

    select
        when cd_num = "A" then cd_num =  0
        when cd_num = "B" then cd_num =  1
        when cd_num = "C" then cd_num =  2
        when cd_num = "D" then cd_num =  3
        when cd_num = "E" then cd_num =  4
        when cd_num = "F" then cd_num =  5
        when cd_num = "G" then cd_num =  6
        when cd_num = "H" then cd_num =  7
        when cd_num = "I" then cd_num =  8
        when cd_num = "J" then cd_num =  9
        when cd_num = "K" then cd_num = 10
        when cd_num = "L" then cd_num = 11
        when cd_num = "M" then cd_num = 12
        when cd_num = "N" then cd_num = 13
        when cd_num = "O" then cd_num = 14
        when cd_num = "P" then cd_num = 15
        when cd_num = "Q" then cd_num = 16
        when cd_num = "R" then cd_num = 17
        when cd_num = "S" then cd_num = 18
        when cd_num = "T" then cd_num = 19
        when cd_num = "U" then cd_num = 20
        when cd_num = "V" then cd_num = 21
        when cd_num = "W" then cd_num = 22
        when cd_num = "X" then cd_num = 23
        when cd_num = "Y" then cd_num = 24
        when cd_num = "Z" then cd_num = 25 /* SになっていたのをZに修正。 (2.17 beta 1, 16.Jul.1999) */
        otherwise nop
    end

    return cd_num

return

/*:VRX         Halt
*/
Halt:
    signal _VREHalt
return

/*:VRX         Init
*/
Init:

    /* Run Optionのargumentにdebugmodeを指定した場合の処置 */
    if translate(initArgs.1) =  "DEBUGMODE" then debug_mode = 1
    else debug_mode = 0

    /* PopCD! Version */
    PopCdVersion = "2.20"
    ok = VRSet( "Window1", "Caption", "PopCD! "PopCdVersion )
    ok = VRSet( "Window1", "WindowListTitle", "PopCD! "PopCdVersion )

    PopFdDisk      = VrCurrDrive()
    PopFdDirectory = VRCurrDir()

    /* Rexx API組込み */
    rc = rxfuncadd( "sysloadfuncs", "rexxutil", "sysloadfuncs")
    rc = sysloadfuncs()

    rc = rxfuncadd( "mciRxInit", "MCIAPI", "mciRxInit" )
    rc = mciRxInit()

    rc = RxFuncAdd( 'PopCdLoadFuncs', 'POPCD', 'PopCdLoadFuncs' )
    rc = PopCdLoadFuncs()

    if debug_mode = 0 then do
        call VRRedirectStdio "off"
    end

    call SetDefault

    call ReadInitialFile

    /* 登録を確認 */
    RegisteredKey = "PCD506F70434421PPMS"

/*
    Registry = "Unregistered"
    if RegisterNumber = RegisteredKey then Registry = "Registered"
*/

    /* Freewareに変更 (26.Oct.2002) */
    if RegisterNumber <> RegisteredKey then do
        RegisterNumber = "Freeware"
    end

    Registry = "Registered"


/*
    /* DEMO用機能 ex.DEMO1999 */
    if left(RegisterNumber, 4) = "DEMO" then do
        CurDate = date("s")
        TimeBombDate = "20000101"  /* 1999年12月31日まで使用可 */

        if CurDate < TimeBombDate then do
            Registry = "Registered"
        end
        else do
            Registry = "TIME IS UP"
        end
    end

    if Registry <> "Registered" then do
        registry_sleep = 20

        ok = VRLoadSecondary( "SW_Registry", w )
    end
*/


    if Font = "<NONE>" then do
        Font_old = "9.WarpSans"
        Font = VRFontDialog( VRWindow(), "9.WarpSans", "PopCD! - Set font, anyway" )
        if Font = "" then Font = Font_old
    end
    ok = VRSet( "EF_FontName", "Value", Font )

    call SetFont

    window = VRWindow()
    call VRMethod window, "CenterWindow"

    ok = VRSet( "Window1", "Left", PosX )
    ok = VRSet( "Window1", "Top",  PosY )

    if MinimizedStartup = "Disabled" then do
        call VRSet window, "Visible", 1
    end

    call VRMethod window, "Activate"
    drop window

    /* 最後にタイマーを設定する */
    call SetPopCdTrigger PopCdTrigger

return

/*:VRX         IPB_CD_NextTrack_Click
*/
IPB_CD_NextTrack_Click:

    ok = VRMethod( "PB_Dummy", "SetFocus" )

    CurrentTrack = CurrentTrack + 1
    if CurrentTrack = 2 then do
        ok = VRSet( "IPB_CD_PrevTrack", "PicturePath", "#230" )
        ok = VRSet( "IPB_CD_PrevTrack", "Enabled", 1 )

        /* Context Menu */
        ok = VRSet( "Menu_PlayPrevious", "Enabled", 1 )
    end

    if CurrentTrack > 9 then num10 = left(CurrentTrack, 1)
    else                     num10 = 0

    num01 = right(CurrentTrack, 1)

    ok = VRSet( "Pict_Num_10", "PicturePath", "#24"num10 )
    ok = VRSet( "Pict_Num_01", "PicturePath", "#24"num01 )

    if CurrentTrack >= TrackNumber then do
        ok = VRSet( "IPB_CD_NextTrack", "PicturePath", "#225" )
        ok = VRSet( "IPB_CD_NextTrack", "Enabled", 0 )

        /* Context Menu */
        ok = VRSet( "Menu_PlayNext", "Enabled", 0 )

        if CurrentTrack > 9 then num10 = left(TrackNumber, 1)
        else                     num10 = 0
        num01 = right(TrackNumber, 1)

        ok = VRSet( "Pict_Num_10", "PicturePath", "#24"num10 )
        ok = VRSet( "Pict_Num_01", "PicturePath", "#24"num01 )
    end

    rc = mciRxSendString("status cda position track "CurrentTrack" wait", "retStr", "0", "0" )
    rc = mciRxSendString("play cda from "retStr, "retStr", "0", "0")

    ok = VRSet( "IPB_CD_Play", "PicturePath", "#205" )
    ok = VRSet( "IPB_CD_Play", "Enabled", 0 )

    ok = VRSet( "IPB_CD_Stop", "PicturePath", "#210" )
    ok = VRSet( "IPB_CD_Stop", "Enabled", 1 )

return

/*:VRX         IPB_CD_Play_Click
*/
IPB_CD_Play_Click:

    ok = VRMethod( "PB_Dummy", "SetFocus" )

    ok = VRSet( "IPB_CD_Play", "PicturePath", "#205" )
    ok = VRSet( "IPB_CD_Play", "Enabled", 0 )
    ok = VRSet( "IPB_CD_Stop", "PicturePath", "#210" )
    ok = VRSet( "IPB_CD_Stop", "Enabled", 1 )

    rc = mciRxSendString("play cda", "retStr", "0", "0")

    /* TimerをEnabledにする */
    ok = VRSet( "TM_CdPlayer_Timer", "Enabled", 1 )

return

/*:VRX         IPB_CD_PrevTrack_Click
*/
IPB_CD_PrevTrack_Click:

    ok = VRMethod( "PB_Dummy", "SetFocus" )

    if CurrentTrack = 1 then do
        rc = mciRxSendString("seek cda to start wait", "retStr", "0", "0")
    end
    else do
        CurrentTrack = CurrentTrack - 1
        if CurrentTrack = TrackNumber - 1 then do
            ok = VRSet( "IPB_CD_NextTrack", "PicturePath", "#220" )
            ok = VRSet( "IPB_CD_NextTrack", "Enabled", 1 )

            /* Context Menu */
            ok = VRSet( "Menu_PlayNext", "Enabled", 1 )
        end
    end

    if CurrentTrack > 9 then do
        num10 = left(CurrentTrack, 1)
    end
    else do
        num10 = 0
    end

    num01 = right(CurrentTrack, 1)

    ok = VRSet( "Pict_Num_10", "PicturePath", "#24"num10 )
    ok = VRSet( "Pict_Num_01", "PicturePath", "#24"num01 )


    if CurrentTrack <= 1 then do
        /* 
        ok = VRSet( "IPB_CD_PrevTrack", "PicturePath", "#230" )
        ok = VRSet( "IPB_CD_PrevTrack", "Enabled", 1 )
        */
        ok = VRSet( "IPB_CD_PrevTrack", "PicturePath", "#235" )
        ok = VRSet( "IPB_CD_PrevTrack", "Enabled", 0 )

        /* Context Menu */
        ok = VRSet( "Menu_PlayPrevious", "Enabled", 0 )

        ok = VRSet( "Pict_Num_10", "PicturePath", "#240" )
        ok = VRSet( "Pict_Num_01", "PicturePath", "#241" )
    end

    rc = mciRxSendString("status cda position track "CurrentTrack" wait", "retStr", "0", "0" )
    rc = mciRxSendString("play cda from "retStr, "retStr", "0", "0")

    ok = VRSet( "IPB_CD_Play", "PicturePath", "#205" )
    ok = VRSet( "IPB_CD_Play", "Enabled", 0 )

    ok = VRSet( "IPB_CD_Stop", "PicturePath", "#210" )
    ok = VRSet( "IPB_CD_Stop", "Enabled", 1 )

return

/*:VRX         IPB_CD_Stop_Click
*/
IPB_CD_Stop_Click:

    ok = VRMethod( "PB_Dummy", "SetFocus" )

    ok = VRSet( "IPB_CD_Play", "PicturePath", "#200" )
    ok = VRSet( "IPB_CD_Play", "Enabled", 1 )
    ok = VRSet( "IPB_CD_Stop", "PicturePath", "#215" )
    ok = VRSet( "IPB_CD_Stop", "Enabled", 0 )

    rc = mciRxSendString("stop cda", "retStr", "0", "0")

    /* TimerをDisabledにする */
    ok = VRSet( "TM_CdPlayer_Timer", "Enabled", 0 )

return

/*:VRX         IPB_CdPlayer_LoadEject_Click
*/
IPB_CdPlayer_LoadEject_Click:

    ok = VRMethod( "PB_Dummy", "SetFocus" )

    if CdAudioStatus = "Enabled" then do
        call DisableCdRomButtons

        /*
        call OpenCloseCdRomTray "Open" AudioCdDrive
        */
        /* これではOpenしない！？ */
        rc = mciRxSendString("set cda door open wait", "retStr", "0", "0")
        rc = mciRxSendString('close cda', 'RetStr', '0', '0')

        call mciRxExit


        rc = SysDestroyObject(PopCdAudioObject)

        CdAudioStatus = "Disabled"

        /* CD PlayerをCloseする (2.02 beta 8で追加) */
        call VRDestroy( "SW_CdPlayer" )
        CdPlayer = "Disabled"

        call ClearIconPosition PopCdAudioObject

        CdAudioCdRomFlag = "OFF"
    end
    else do
        ok = VRSet( "IPB_CdPlayer_LoadEject", "PicturePath", "#294" )

        /* これではloadしない！？
        rc = mciRxSendString("set cda door closed wait", "retStr", "0", "0")
        */
        call OpenCloseCdRomTray "Close" AudioCdDrive

        call SetCdPlayerDefaultButton

        rc = mciRxSendString("set cda door locked wait", "retStr", "0", "0")
    end

return

/*:VRX         IPB_CdPlayerVolume_Click
*/
IPB_CdPlayerVolume_Click:

    ok = VRMethod( "PB_Dummy", "SetFocus" )

    if CdPlayerVolumeMode = "Enabled" then do
        CdPlayerVolumeMode = "Disabled"
        ok = VRSet( "IPB_CdPlayerVolume", "PicturePath", "#310" )

        h = VRGet( "SW_CdPlayer", "Height")
        ok = VRSet( "SW_CdPLayer", "Height", h - CdPlayerHeightVolumePlus )
    end
    else if CdPlayerVolumeMode = "Disabled" then do
        CdPlayerVolumeMode = "Enabled"
        ok = VRSet( "IPB_CdPlayerVolume", "PicturePath", "#320" )

        h = VRGet( "SW_CdPlayer", "Height")
        ok = VRSet( "SW_CdPLayer", "Height", h + CdPlayerHeightVolumePlus )
    end

return

/*:VRX         IPB_MinimizeCdPlayer_Click
*/
IPB_MinimizeCdPlayer_Click:

    ok = VRMethod( "PB_Dummy", "SetFocus" )

    if CdPlayerTitleBar = "Enabled" then do
        ok = VRSet( "SW_CdPlayer", "TitleBar", 0 )
        ok = VRSet( "SW_CdPlayer", "MinimizeButton", 0 )

        ok = VRSet( "SW_CdPlayer", "Height", CdPlayerHeightMin )
        CdPlayerTitleBar = "Disabled"

        CdPlayerPosY = VRGet( "SW_CdPlayer", "Top" )
        CdPlayerPosY = CdPlayerPosY + (CdPlayerHeightMax - CdPlayerHeightMin)
        ok = VRSet( "SW_CdPlayer", "Top",  CdPlayerPosY )
    end
    else if CdPlayerTitleBar = "Disabled" then do
        ok = VRSet( "SW_CdPlayer", "TitleBar", 1 )
        ok = VRSet( "SW_CdPlayer", "MinimizeButton", 1 )

        ok = VRSet( "SW_CdPlayer", "Height", CdPlayerHeightMax )
        CdPlayerTitleBar = "Enabled"

        CdPlayerPosY = VRGet( "SW_CdPlayer", "Top" )
        CdPlayerPosY = CdPlayerPosY - (CdPlayerHeightMax - CdPlayerHeightMin)
        ok = VRSet( "SW_CdPlayer", "Top",  CdPlayerPosY )

        ok = VRset( "SW_CdPlayer", "Caption", "PopCD! CD Player" )
    end

    /* Save CD Player Position */
    CdPlayerPosX = VRGet( "SW_CdPlayer", "Left" )
    CdPlayerPosY = VRGet( "SW_CdPlayer", "Top" )
    call WriteInitialFile

    ok = VRSet( "IPB_CdPlayerVolume", "PicturePath", "#310" )
    CdPlayerVolumeMode = "Disabled"

return

/*:VRX         Menu_EjectAudioCD_Click
*/
Menu_EjectAudioCD_Click: 

    call IPB_CdPlayer_LoadEject_Click

return

/*:VRX         Menu_HideTitleBar_Click
*/
Menu_HideTitleBar_Click: 

    call IPB_MinimizeCdPlayer_Click

return

/*:VRX         Menu_HideVolume_Click
*/
Menu_HideVolume_Click: 

    call IPB_CdPlayerVolume_Click

return

/*:VRX         Menu_Play_Click
*/
Menu_Play_Click: 

    call IPB_CD_Play_Click

return

/*:VRX         Menu_PlayNext_Click
*/
Menu_PlayNext_Click: 

    call IPB_CD_NextTrack_Click

return

/*:VRX         Menu_PlayPrevious_Click
*/
Menu_PlayPrevious_Click: 

    call IPB_CD_PrevTrack_Click

return

/*:VRX         Menu_Stop_Click
*/
Menu_Stop_Click: 

    call IPB_CD_Stop_Click

return

/*:VRX         OpenCloseCdRomTray
*/
OpenCloseCdRomTray:

    parse arg mode cd_num

    cd_num = GetCdRomNumber( cd_num )

    if mode = "Open" then do
        rc = OpenCdRomTray(cd_num)
    end
    else if mode = "Close" then do
        rc = CloseCdRomTray(cd_num)
    end

return

/*:VRX         PB_AboutPopCd_Click
*/
PB_AboutPopCd_Click:

    registry_sleep = 5

    ok = VRLoadSecondary( "SW_Registry", w )

return

/*:VRX         PB_ApplyIconPosition_Click
*/
PB_ApplyIconPosition_Click:

    IconPositionStartPointX = VRGet( "EF_IconPosition_StartPointX", "Value" )
    IconPositionStartPointY = VRGet( "EF_IconPosition_StartPointY", "Value" )
    IconPositionRows = VRGet( "EF_IconPosition_Rows", "Value" )
    IconPositionIntervalsX = VRGet( "EF_IconPosition_IntervalsX", "Value" )
    IconPositionIntervalsY = VRGet( "EF_IconPosition_IntervalsY", "Value" )

    call SetAutoPositionValue
    call Reset

return

/*:VRX         PB_Cancel_Click
*/
PB_Cancel_Click:

    SetUpViewParametersWindowPosX = VRGet( "SW_SetUpViewParametersWindow", "Left" )
    SetUpViewParametersWindowPosY = VRGet( "SW_SetUpViewParametersWindow", "Top" )

    call WriteInitialFile

    ok = VRDestroy( "SW_SetUpViewParametersWindow" )

return

/*:VRX         PB_CloseSetUpViewParameterWindow_Click
*/
PB_CloseSetUpViewParameterWindow_Click:

    /* Set Parameters */
    pICONVIEW   = iv_f","iv_i
    pTREEVIEW   = tv_f","tv_i
    bg_rgb = bg_red" "bg_green" "bg_blue
    pBACKGROUND = bg_img","bg_mode","bg_scale","bg_type","bg_rgb

    /*
    CdFolderParameters = "DETAILSVIEW="pDETAILSVIEW";ICONVIEW="pICONVIEW";TREEVIEW="pTREEVIEW";BACKGROUND="pBACKGROUND";MINWIN="pMINWIN";CCVIEW="pCCVIEW";HIDEBUTTON="pHIDEBUTTON
    */
    CdFolderParameters = "DETAILSVIEW="pDETAILSVIEW";ICONVIEW="pICONVIEW";TREEVIEW="pTREEVIEW

    call SetDefaultView

    SetUpViewParametersWindowPosX = VRGet( "SW_SetUpViewParametersWindow", "Left" )
    SetUpViewParametersWindowPosY = VRGet( "SW_SetUpViewParametersWindow", "Top" )

    call WriteInitialFile

    ok = VRDestroy( "SW_SetUpViewParametersWindow" )

return

/*:VRX         PB_ExitInternalCdPlayerSetup_Click
*/
PB_ExitInternalCdPlayerSetup_Click:

    ok = VRDestroy( "SW_InternalCdPlayerSetup" )

return

/*:VRX         PB_ExitPopCd_Click
*/
PB_ExitPopCd_Click:

    ok = VRSet( "PB_ExitPopCd", "ForeColor", "Red" )
    ok = VRSet( "PB_ExitPopCd", "Caption", "Wait a minute..." )

    /* Dummy Forcus */
    ok = VRMethod( "SPIN_TimerDelay", "SetFocus" )

    /* 本来はFiniで実行すべき項目であるが、Finiで以下を実行すると
       Errorが発生する場合があるので、Exitボタンを押したときにも
       オブジェクトを削除するようにしている。 */
    do i = 3 to 25
        if PopCdObject.i.STATUS = "MOUNT" then do
            rc = SysDestroyObject(PopCdObject.i.CDOBJECTID)
        end
    end
    rc = SysDestroyObject(PopCdAudioObject)

    CdAudioStatus = "Disabled"

    call WriteInitialFile

    call quit

return

/*:VRX         PB_ExitSetAutoPosition_Click
*/
PB_ExitSetAutoPosition_Click:

    IconPositionStartPointX = VRGet( "EF_IconPosition_StartPointX", "Value" )
    IconPositionStartPointY = VRGet( "EF_IconPosition_StartPointY", "Value" )
    IconPositionRows = VRGet( "EF_IconPosition_Rows", "Value" )
    IconPositionIntervalsX = VRGet( "EF_IconPosition_IntervalsX", "Value" )
    IconPositionIntervalsY = VRGet( "EF_IconPosition_IntervalsY", "Value" )

    call SetAutoPositionValue
    call Reset

    call WriteInitialFile

    ok = VRDestroy( "SW_SetupAutoPosition" )

return

/*:VRX         PB_InternalCdPlayerSetup_Click
*/
PB_InternalCdPlayerSetup_Click:

    ok = VRLoadSecondary( "SW_InternalCdPlayerSetup", "w" )

return

/*:VRX         PB_MMPM2_Setup_Click
*/
PB_MMPM2_Setup_Click:

    rc = SysOpenObject( "<MMPM2_SETUP>", "default", "true" )

return

/*:VRX         PB_NotYet_Click
*/
PB_NotYet_Click:

    ok = VRDestroy( "SW_Registry" )

return

/*:VRX         PB_OpenSetUpViewParametersWindow_Click
*/
PB_OpenSetUpViewParametersWindow_Click:

    ok = VRLoadSecondary( "SW_SetUpViewParametersWindow", "w" )

return

/*:VRX         PB_Register_Click
*/
PB_Register_Click:

    value = VRGet( "EF_RegistryNumber", "Value" )
    RegisterNumber = value

    /* DEMO版用に機能修正 */
    if (RegisterNumber = RegisteredKey) then do
        Registry = "Registered"
        ok = VRDestroy( "SW_Registry" )
        call WriteInitialFile
    end
    else if left(RegisterNumber, 4) = "DEMO" then do
        CurDate = date("s")

        if CurDate < TimeBombDate then do
            Registry = "Registered"
            ok = VRDestroy( "SW_Registry" )
            call WriteInitialFile
        end
        else do
            Registry = "TIME IS UP"
        end
    end
/*
    else do
        ok = VRSet( "EF_RegistryNumber", "Value", "" )
        ok = VRSet( "PB_Register", "Enabled", 0 )
        ok = VRMethod( "EF_RegistryNumber", "SetFocus" )
    end
*/
    if Registry <> "Registered" then do
        ok = VRSet( "EF_RegistryNumber", "Value", "" )
        ok = VRSet( "PB_Register", "Enabled", 0 )
        ok = VRMethod( "EF_RegistryNumber", "SetFocus" )
    end

return

/*:VRX         PB_SetExternalCdPlayer_Click
*/
PB_SetExternalCdPlayer_Click:

    ExternalCdPlayer_old = ExternalCdPlayer
    ExternalCdPlayer = VRFileDialog( VRWindow(), "PopCD! - Select External CD Player", "Open", "*.exe; *.com; *.cmd; *.bat" )

    if ExternalCdPlayer = "" then ExternalCdPlayer = ExternalCdPlayer_old
    else ok = VRSet( "EF_ExternalCdPlayer", "Value", VRParseFileName(ExternalCdPlayer, "N")"."VRParseFileName(ExternalCdPlayer, "E") )

return

/*:VRX         PB_SetFont_Click
*/
PB_SetFont_Click:

    font_old = font
    font = VRFontDialog( VRWindow(), font, "Choose a font!")

    if font = "" then do
        font = font_old
    end
    else do
        ok = VRSet( "EF_FontName", "Value", Font )

        call SetFont

        call WriteInitialFile
    end

return

/*:VRX         PB_SetupAutoPosition_Click
*/
PB_SetupAutoPosition_Click:

    ok = VRLoadSecondary( "SW_SetupAutoPosition", "w")

return

/*:VRX         PlayTrack
*/
PlayTrack: 

    parse arg cdptnum

    CurrentTrack = cdptnum

    if CurrentTrack > 9 then num10 = left(CurrentTrack, 1)
    else                     num10 = 0

    /* Previous Button */
    if CurrentTrack = 1 then do
        ok = VRSet( "IPB_CD_PrevTrack", "PicturePath", "#235" )
        ok = VRSet( "IPB_CD_PrevTrack", "Enabled", 0 )

        /* Context Menu */
        ok = VRSet( "Menu_PlayPrevious", "Enabled", 0 )
    end
    else do
        ok = VRSet( "IPB_CD_PrevTrack", "PicturePath", "#230" )
        ok = VRSet( "IPB_CD_PrevTrack", "Enabled", 1 )

        /* Context Menu */
        ok = VRSet( "Menu_PlayPrevious", "Enabled", 1 )
    end

    /* Next Button */
    if CurrentTrack = MaxTrackNumber then do
        ok = VRSet( "IPB_CD_NextTrack", "PicturePath", "#225" )
        ok = VRSet( "IPB_CD_NextTrack", "Enabled", 0 )

        /* Context Menu */
        ok = VRSet( "Menu_PlayNext", "Enabled", 0 )
    end
    else do
        ok = VRSet( "IPB_CD_NextTrack", "PicturePath", "#220" )
        ok = VRSet( "IPB_CD_NextTrack", "Enabled", 1 )

        /* Context Menu */
        ok = VRSet( "Menu_PlayNext", "Enabled", 1 )
    end

    num01 = right(CurrentTrack, 1)

    ok = VRSet( "Pict_Num_10", "PicturePath", "#24"num10 )
    ok = VRSet( "Pict_Num_01", "PicturePath", "#24"num01 )

    ok = VRSet( "IPB_CD_Play", "PicturePath", "#205" )
    ok = VRSet( "IPB_CD_Play", "Enabled", 0 )

    ok = VRSet( "IPB_CD_Stop", "PicturePath", "#210" )
    ok = VRSet( "IPB_CD_Stop", "Enabled", 1 )

    rc = mciRxSendString("status cda position track "cdptnum" wait", "retStr", "0", "0" )
    rc = mciRxSendString("play cda from "retStr, "retStr", "0", "0")
    
return

/*:VRX         PlayTrack01_Click
*/
PlayTrack01_Click: 

    call PlayTrack 1

return

/*:VRX         PlayTrack02_Click
*/
PlayTrack02_Click: 

    call PlayTrack 2

return

/*:VRX         PlayTrack03_Click
*/
PlayTrack03_Click: 

    call PlayTrack 3

return

/*:VRX         PlayTrack04_Click
*/
PlayTrack04_Click: 

    call PlayTrack 4

return

/*:VRX         PlayTrack05_Click
*/
PlayTrack05_Click: 

    call PlayTrack 5

return

/*:VRX         PlayTrack06_Click
*/
PlayTrack06_Click: 

    call PlayTrack 6

return

/*:VRX         PlayTrack07_Click
*/
PlayTrack07_Click: 

    call PlayTrack 7

return

/*:VRX         PlayTrack08_Click
*/
PlayTrack08_Click: 

    call PlayTrack 8

return

/*:VRX         PlayTrack09_Click
*/
PlayTrack09_Click: 

    call PlayTrack 9

return

/*:VRX         PlayTrack10_Click
*/
PlayTrack10_Click: 

    call PlayTrack 10

return

/*:VRX         PlayTrack11_Click
*/
PlayTrack11_Click: 

    call PlayTrack 11

return

/*:VRX         PlayTrack12_Click
*/
PlayTrack12_Click: 

    call PlayTrack 12

return

/*:VRX         PlayTrack13_Click
*/
PlayTrack13_Click: 

    call PlayTrack 13

return

/*:VRX         PlayTrack14_Click
*/
PlayTrack14_Click: 

    call PlayTrack 14

return

/*:VRX         PlayTrack15_Click
*/
PlayTrack15_Click: 

    call PlayTrack 15

return

/*:VRX         PlayTrack16_Click
*/
PlayTrack16_Click: 

    call PlayTrack 16

return

/*:VRX         PlayTrack17_Click
*/
PlayTrack17_Click: 

    call PlayTrack 17

return

/*:VRX         PlayTrack18_Click
*/
PlayTrack18_Click: 

    call PlayTrack 18

return

/*:VRX         PlayTrack19_Click
*/
PlayTrack19_Click: 

    call PlayTrack 19

return

/*:VRX         PlayTrack20_Click
*/
PlayTrack20_Click: 

    call PlayTrack 20

return

/*:VRX         PlayTrack21_Click
*/
PlayTrack21_Click: 

    call PlayTrack 21

return

/*:VRX         PlayTrack22_Click
*/
PlayTrack22_Click: 

    call PlayTrack 22

return

/*:VRX         PlayTrack23_Click
*/
PlayTrack23_Click: 

    call PlayTrack 23

return

/*:VRX         PlayTrack24_Click
*/
PlayTrack24_Click: 

    call PlayTrack 24

return

/*:VRX         PlayTrack25_Click
*/
PlayTrack25_Click: 

    call PlayTrack 25

return

/*:VRX         PlayTrack26_Click
*/
PlayTrack26_Click: 

    call PlayTrack 26

return

/*:VRX         PlayTrack27_Click
*/
PlayTrack27_Click: 

    call PlayTrack 27

return

/*:VRX         PlayTrack28_Click
*/
PlayTrack28_Click: 

    call PlayTrack 28

return

/*:VRX         PlayTrack29_Click
*/
PlayTrack29_Click: 

    call PlayTrack 29

return

/*:VRX         PlayTrack30_Click
*/
PlayTrack30_Click: 

    call PlayTrack 30

return

/*:VRX         PlayTrack31_Click
*/
PlayTrack31_Click: 

    call PlayTrack 31

return

/*:VRX         PlayTrack32_Click
*/
PlayTrack32_Click: 

    call PlayTrack 32

return

/*:VRX         PlayTrack33_Click
*/
PlayTrack33_Click: 

    call PlayTrack 33

return

/*:VRX         PlayTrack34_Click
*/
PlayTrack34_Click: 

    call PlayTrack 34

return

/*:VRX         PlayTrack35_Click
*/
PlayTrack35_Click: 

    call PlayTrack 35

return

/*:VRX         PlayTrack36_Click
*/
PlayTrack36_Click: 

    call PlayTrack 36

return

/*:VRX         PlayTrack37_Click
*/
PlayTrack37_Click: 

    call PlayTrack 37

return

/*:VRX         PlayTrack38_Click
*/
PlayTrack38_Click: 

    call PlayTrack 38

return

/*:VRX         PlayTrack39_Click
*/
PlayTrack39_Click: 

    call PlayTrack 39

return

/*:VRX         PlayTrack40_Click
*/
PlayTrack40_Click: 

    call PlayTrack 40

return

/*:VRX         PopCdTriggerAudioCd
*/
PopCdTriggerAudioCd:

    ICON = PopFdDisk""PopFdDirectory"\CdAudio.ico"

    PopCdAudioObject = "<POP_CD_AUDIO_"CdAudioDeviceId">"

    rc = 1
    if (CdAudioStatus = "Disabled") & (CdAudioCdRomFlag = "OFF") then do
        rc = CheckCdAudio()
    end

    if (rc = 0) & (CdAudioStatus = "Disabled") then do
        call PopUpCdAudioObject

        CdAudioStatus = "Enabled"
    end
    else if (rc = 0) & (CdAudioStatus = "Enabled") then do
        nop
    end
    else if (rc = 1) & (CdAudioStatus = "Enabled") then do
        rc = syssetobjectdata(PopCdAudioObject, "NODELETE=NO")

        if rc = 0 then do
            /* Stop CD Audio & close */
            rc = mciRxSendString("set cda door unlocked wait", "retStr", "0", "0")

            rc = mciRxSendString("stop cda wait", "retStr", "0", "0")

            rc = mciRxSendString("set cda door open wait", "retStr", "0", "0")

            rc = mciRxSendString('close cda', 'RetStr', '0', '0')
            call mciRxExit
            /*
            call OpenCloseCdRomTray "Open" AudioCdDrive
            */

            CdAudioStatus = "Disabled"

            /* Audio CDを取り出す毎にCD PlayerをDisableする */
            call VRDestroy( "SW_CdPlayer" )
            CdPlayer = "Disabled"

            call ClearIconPosition PopCdAudioObject

            CdAudioCdRomFlag = "OFF"
        end
    end
    else do
        nop
    end

return

/*:VRX         PopCdTriggerCdRom
*/
PopCdTriggerCdRom:

    LastDriveNum = c2d(left(LastDrive, 1)) - c2d("A")
    do i = 3 to LastDriveNum
        dsk_name = d2c(c2d("A") + i)

        Ignore = "No"
        if (0 < IgnoreDrive.0) & (IgnoreDrive.0 < c2d("Z") - c2d("A")) then do
            do ign = 1 to IgnoreDrive.0
                if dsk_name = IgnoreDrive.ign then do
                    Ignore = "Yes"
                    leave
                end
            end
        end

        if Ignore = "No" then do
            PopCdObject.i.CDDRIVEID   = "<WP_DRIVE_"dsk_name">"
            PopCdObject.i.CDOBJECTID  = "<POP_CD_"dsk_name">"
            PopCdObject.i.VOLUMELABEL = VRDiskLabel(dsk_name)
            dsk_id = c2d(dsk_name) - c2d("A")
            PopCdObject.i.FILESYSTEM  = GetFileSystemType(dsk_id)
/*          PopCdObject.i.STATUS      = "" */
/*          PopCdObject.i.MEDIATYPE   = "" */

            if PopCdObject.i.FILESYSTEM = "CDFS" then PopCdObject.i.MEDIATYPE = "CD-ROM"

            if PopCdObject.i.MEDIATYPE <> "Other Removable Media" then do
                if (PopCdObject.i.FILESYSTEM = "CDFS") & (PopCdObject.i.STATUS <> "MOUNT") then do
                    call PopUpCdRomObject i
                    PopCdObject.i.STATUS = "MOUNT"
                end
                else if (PopCdObject.i.FILESYSTEM = "CDFS") & (PopCdObject.i.STATUS = "MOUNT") then do

                    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
                    /* 他のREXX ProgramでSysDropFuncsが実行されたときに再度Loadする  */
                    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
                    rc = rxfuncadd( "sysloadfuncs", "rexxutil", "sysloadfuncs")
                    if rc <> 1 then rc = sysloadfuncs()
                    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

                   rc = SysSetObjectData(PopCdObject.i.CDOBJECTID, "NODELETE=NO")

                   if rc = 0 then do
                        call ResetIconName i /* Add 12.Aug.1999 */

                        rc = SysDestroyObject(PopCdObject.i.CDOBJECTID)
                        call OpenCloseCdRomTray "Open" dsk_name
                        PopCdObject.i.STATUS = "UNMOUNT"
                        call ClearIconPosition PopCdObject.i.CDOBJECTID

                        CdAudioCdRomFlag = "OFF"
                    end
                end
                else if (PopCdObject.i.FILESYSTEM <> "CDFS") & (PopCdObject.i.STATUS = "MOUNT") then do
                    call ResetIconName i /* Add 12.Aug.1999 */

                    rc = SysDestroyObject(PopCdObject.i.CDOBJECTID)

                    PopCdObject.i.STATUS = "UNMOUNT"
                    call ClearIconPosition PopCdObject.i.CDOBJECTID

                    CdAudioCdRomFlag = "OFF"
                end
                else do
                    nop
                end
            end
        end
    end


return

/*:VRX         PopCdTriggerRemovableMedia
*/
PopCdTriggerRemovableMedia:

    do rd = 1 to OtherMedia.0
        i = c2d(OtherMedia.rd) - c2d("A")
        dsk_name = OtherMedia.rd
        dsk_id = c2d(dsk_name) - c2d("A")

        PopCdObject.i.CDDRIVEID   = "<WP_DRIVE_"dsk_name">"
        PopCdObject.i.CDOBJECTID  = "<POP_CD_"dsk_name">"
        PopCdObject.i.VOLUMELABEL = VRDiskLabel(dsk_name)
        PopCdObject.i.FILESYSTEM  = GetFileSystemType(dsk_id)
/*      PopCdObject.i.STATUS      = "" */
        PopCdObject.i.MEDIATYPE   = "Other Removable Media"

        if (PopCdObject.i.FILESYSTEM <> "NO DISK") & (PopCdObject.i.STATUS <> "MOUNT") then do
            call PopUpCdRomObject i
            PopCdObject.i.STATUS = "MOUNT"
        end
        else if (PopCdObject.i.FILESYSTEM <> "NO DISK") & (PopCdObject.i.STATUS = "MOUNT") then do
            rc = SysSetObjectData(PopCdObject.i.CDOBJECTID, "NODELETE=NO")

            if rc = 0 then do
                call ResetIconName i /* Add 12.Aug.1999 */

                rc = SysDestroyObject(PopCdObject.i.CDOBJECTID)
                call OpenCloseCdRomTray "Open" dsk_name

                PopCdObject.i.STATUS = "UNMOUNT"
                call ClearIconPosition PopCdObject.i.CDOBJECTID
            end
        end
        else if (PopCdObject.i.FILESYSTEM = "NO DISK") & (PopCdObject.i.STATUS = "MOUNT") then do
            call ResetIconName i /* Add 12.Aug.1999 */

            rc = SysDestroyObject(PopCdObject.i.CDOBJECTID)

            PopCdObject.i.STATUS = "UNMOUNT"
            call ClearIconPosition PopCdObject.i.CDOBJECTID
        end
        else do
            nop
        end
    end

return

/*:VRX         PopUpCdAudioObject
*/
PopUpCdAudioObject:

    /* Create CD Audio Object Icon */
    if IconPositioning = "Auto" then do
        do p = 1 to IconPosition.0
            if IconPosition.p.IconPositionStatus = "NOT USED" then do
                ThisPositionXY = IconPosition.p.IconPositionXY
                IconPosition.p.IconPositionStatus = "USED"
                IconPosition.p.IconPositionObjectId = PopCdAudioObject
                leave
            end
        end
        rc = SysCreateObject("WPFolder","Audio CD","<WP_DESKTOP>", "OBJECTID="PopCdAudioObject";ICONFILE="ICON";ICONPOS="ThisPositionXY)
    end
    else if IconPositioning = "None" then do
        rc = SysCreateObject("WPFolder","Audio CD","<WP_DESKTOP>", "OBJECTID="PopCdAudioObject";ICONFILE="ICON";")
    end



    if CdPlayerMode = "Internal" then do
        n = right(CdAudioDeviceId, 2, "0")
        rc = mciRxSendString("open cdaudio"n" alias cda shareable wait", "RetStr", "0", "0")

        /* CD-ROM装置が準備できているか */
        rc = mciRxSendString("set cda audio on wait", "retStr", "0", "0")

        /* Set CD Volume */
        rc = mciRxSendString("set cda audio volume "CdPlayerVolume, "retStr", "0", "0")

        /* Door Close */
        rc = mciRxSendString("set cda door locked wait", "retStr", "0", "0")

/*      rc = mciRxSendString("play cda", "retStr", "0", "0") */

        /* CD PlayerのHeadを先頭に持っていく */
        rc = mciRxSendString("seek cda to start wait", "retStr", "0", "0")

        if CdPlayer = "Disabled" then do
            ok = VRLoadSecondary( "SW_CdPlayer", "N" )
        end
        else if CdPlayer = "Enabled" then do
            call SetCdPlayerDefaultButton
        end

        /* CD PlayerのTimerをEnableにする。Autoplayのため */
        if CdPlayerAutoPlay = "Enabled" then do
            ok = VRSet( "TM_CdPlayer_Timer", "Enabled", 1 )
            rc = mciRxSendString("play cda", "retStr", "0", "0")
        end
        else if CdPlayerAutoPlay = "Disabled" then do
            rc = mciRxSendString("stop cda", "retStr", "0", "0")
            ok = VRSet( "TM_CdPlayer_Timer", "Enabled", 0 )
        end
    end
    else do

        ExtPlayer_Drive     =  VRParseFileName( ExternalCdPlayer, "D" )
        ExtPlayer_Directory =  VRParseFileName( ExternalCdPlayer, "P" )
        if pos(" ", ExtPlayer_Directory) <> 0 then do
            ExtPlayer_Directory = '"'ExtPlayer_Directory'"'
        end
        ExtPlayer_Filename  =  VRParseFileName( ExternalCdPlayer, "N" )"."VRParseFileName( ExternalCdPlayer, "E" )

        address cmd "Start "ExtPlayer_Drive":"ExtPlayer_Directory"\"ExtPlayer_Filename
        /*
        address cmd "Start "ExternalCdPlayer
        */
    end

return

/*:VRX         PopUpCdPlayerMenu
*/
PopUpCdPlayerMenu: 

    ok = VRMethod( "PopCD_CD_Player_Menu", "popup" )

return

/*:VRX         PopUpCdRomObject
*/
PopUpCdRomObject:

    parse arg id

    /* Positionを設定 */
    if IconPositioning = "Auto" then do
        do p = 1 to IconPosition.0
            if IconPosition.p.IconPositionStatus = "NOT USED" then do
                ThisPositionXY = IconPosition.p.IconPositionXY
                IconPosition.p.IconPositionStatus = "USED"
                IconPosition.p.IconPositionObjectId = PopCdObject.id.CDOBJECTID
                leave
            end
        end
        rc = SysCreateObject("WPShadow", " ", "<WP_DESKTOP>", "SHADOWID="PopCdObject.id.CDDRIVEID";OBJECTID="PopCdObject.id.CDOBJECTID";ICONPOS="ThisPositionXY, "u")
    end
    else if IconPositioning = "None" then do
        rc = SysCreateObject("WPShadow", " ", "<WP_DESKTOP>", "SHADOWID="PopCdObject.id.CDDRIVEID";OBJECTID="PopCdObject.id.CDOBJECTID";", "u")
    end

    /* iconファイルを指定しないように仕様変更 */
    if UseVolumeLabel = "Enabled" then do
        params = "TITLE="PopCdObject.id.VOLUMELABEL";"
    end
    else if UseVolumeLabel = "Disabled" then do
        parse var DefaultDriveCaption t_wrd1 "%d" t_wrd2
        if (t_wrd2 = "") & (right(DefaultDriveCaption, 2) <> "%d") then do
            t_wrd = strip(t_wrd1)
        end
        else do
            t_wrd = strip(t_wrd1""d2c(id + c2d("A"))""t_wrd2)
        end
        params = "TITLE="t_wrd";"
    end
    rc = SysSetObjectData( PopCdObject.id.CDOBJECTID, params )

    /* Set Default View Parameter */
    params = CdFolderParameters";DEFAULTVIEW="CdRomDefaultView

    rc = SysSetObjectData( d2c(id + c2d("A"))":", params )

    if OpenFolder = "Enabled" then do
        rc = SysSetObjectData( PopCdObject.id.CDOBJECTID, "OPEN=DEFAULT" )
    end

/* AutoRun機能はちょっと中断 */
/*
    /* Internal Autorun */
    if AutoRun = "Enabled" then do
        do ar = 1 to AutoRunItem.0
            wpos = pos( translate(AutoRunItem.ar.AUTORUN_VOLUMEKEYWORD), translate(PopCdObject.id.VOLUMELABEL) )
            if wpos = 1 then do
                prevDrive = VRChDrive( d2c(id + c2d("A")) )
                address cmd "start "d2c(id + c2d("A"))":\"AutoRunItem.ar.AUTORUN_EXENAME
                prevDrive = VRChDrive( prevDrive )
                leave
            end
        end
    end
*/
return

/*:VRX         Quit
*/
Quit:
/*
    rc = SysDestroyObject(PopCdObject)
    rc = SysDestroyObject(PopCdAudioObject)
    CdAudioStatus = "Disabled"

    call WriteInitialFile
*/
    window = VRWindow()
    call VRSet window, "Shutdown", 1
    drop window
return

/*:VRX         RB_CCView_Default_Click
*/
RB_CCView_Default_Click:

    pCCVIEW = "DEFAULT"

return

/*:VRX         RB_CCView_No_Click
*/
RB_CCView_No_Click:

    pCCVIEW = "NO"

return

/*:VRX         RB_CCView_Yes_Click
*/
RB_CCView_Yes_Click:

    pCCVIEW = "YES"

return

/*:VRX         RB_DetailsViewIcon_Mini_Click
*/
RB_DetailsViewIcon_Mini_Click:

    pDETAILSVIEW="MINI"

return

/*:VRX         RB_DetailsViewIcon_Normal_Click
*/
RB_DetailsViewIcon_Normal_Click:

    pDETAILSVIEW="NORMAL"

return

/*:VRX         RB_HideButton_No_Click
*/
RB_HideButton_No_Click:

    pHIDEBUTTON = "NO"

return

/*:VRX         RB_HideButton_Yes_Click
*/
RB_HideButton_Yes_Click:

    pHIDEBUTTON = "YES"

return

/*:VRX         RB_IconViewFormat_Flowed_Click
*/
RB_IconViewFormat_Flowed_Click:

    iv_f = "FLOWED"

return

/*:VRX         RB_IconViewFormat_Grid_Click
*/
RB_IconViewFormat_Grid_Click:

    iv_f = "GRID"

return

/*:VRX         RB_IconViewFormat_NoFlowed_Click
*/
RB_IconViewFormat_NoFlowed_Click:

    iv_f = "NOFLOWED"

return

/*:VRX         RB_IconViewFormat_NoGrid_Click
*/
RB_IconViewFormat_NoGrid_Click:

    iv_f = "NOGRID"

return

/*:VRX         RB_IconViewIcon_Invisible_Click
*/
RB_IconViewIcon_Invisible_Click:

    iv_i = "INVISIBLE"

return

/*:VRX         RB_IconViewIcon_Mini_Click
*/
RB_IconViewIcon_Mini_Click:

    iv_i = "MINI"

return

/*:VRX         RB_IconViewIcon_Normal_Click
*/
RB_IconViewIcon_Normal_Click:

    iv_i = "NORMAL"

return

/*:VRX         RB_Positioning_Auto_Click
*/
RB_Positioning_Auto_Click:

    IconPositioning = "Auto"
    ok = VRSet( "PB_SetupAutoPosition", "Enabled", 1 )

    call Reset

return

/*:VRX         RB_Positioning_None_Click
*/
RB_Positioning_None_Click:

    IconPositioning = "None"
    ok = VRSet( "PB_SetupAutoPosition", "Enabled", 0 )

    call Reset

return

/*:VRX         RB_TreeViewFormat_Lines_Click
*/
RB_TreeViewFormat_Lines_Click:

    tv_f = "LINES"

return

/*:VRX         RB_TreeViewFormat_NoLines_Click
*/
RB_TreeViewFormat_NoLines_Click:

    tv_f = "NOLINES"

return

/*:VRX         RB_TreeViewIcon_Invisible_Click
*/
RB_TreeViewIcon_Invisible_Click:

    tv_i = "INVISIBLE"

return

/*:VRX         RB_TreeViewIcon_Mini_Click
*/
RB_TreeViewIcon_Mini_Click:

    tv_i = "MINI"

return

/*:VRX         RB_TreeViewIcon_Normal_Click
*/
RB_TreeViewIcon_Normal_Click:

    tv_i = "NORMAL"

return

/*:VRX         RB_UseExternalCdPlayer_Click
*/
RB_UseExternalCdPlayer_Click:

    /* Internal/Externel CD Player切替時の初期化 (2.11 b3ta 6, 17.Apr.1999)*/
    CdAudioStatus = "Disabled"
    CdAudioCdRomFlag = "OFF"

    call VRDestroy( "SW_CdPlayer" )
    CdPlayer = "Disabled"
    /* - - - - - */


    CdPlayerMode = "External"

    call SetAudioCdCdplayerParameters CdPlayerMode

return

/*:VRX         RB_UsePopCdPlayer_Click
*/
RB_UsePopCdPlayer_Click:

    /* Internal/Externel CD Player切替時の初期化 (2.11 b3ta 6, 17.Apr.1999)*/
    CdAudioStatus = "Disabled"
    CdAudioCdRomFlag = "OFF"
    /* - - - - - */


    CdPlayerMode = "Internal"

    call SetAudioCdCdPlayerParameters CdPlayerMode

return

/*:VRX         RB_View_Details_Click
*/
RB_View_Details_Click:

    CdRomDefaultView = "Details"

    call SetDefaultView

return

/*:VRX         RB_View_Icon_Click
*/
RB_View_Icon_Click:

    CdRomDefaultView = "Icon"

    call SetDefaultView

return

/*:VRX         RB_View_Tree_Click
*/
RB_View_Tree_Click:

    CdRomDefaultView = "Tree"

    call SetDefaultView

return

/*:VRX         RB_WindowMinimized_Desktop_Click
*/
RB_WindowMinimized_Desktop_Click:

    pMINWIN = "DESKTOP"

return

/*:VRX         RB_WindowMinimized_Hide_Click
*/
RB_WindowMinimized_Hide_Click:

    pMINWIN = "HIDE"

return

/*:VRX         RB_WindowMinimized_Viewer_Click
*/
RB_WindowMinimized_Viewer_Click:

    pMINWIN = "VIEWER"

return

/*:VRX         ReadInitialFile
*/
ReadInitialFile:

    initial_file = PopFdDirectory"\PopCd.ini"

    do until lines(initial_file) = 0
        line_text=linein(initial_file)

        parse var line_text keyword '=' detail

        if left(keyword, 11) = "; PopCd.ini" then do
            parse var keyword . "(" old_version ")"
        end

        select
            /* Common, etc */
            when keyword = "PopCdTrigger" then PopCdTrigger = detail
            when keyword = "MinimizedStartup" then MinimizedStartup = detail
            when keyword = "Delay" then Delay = detail
            when keyword = "Font" then Font = detail

            when keyword = "PosX" then PosX = detail
            when keyword = "PosY" then PosY = detail
            when keyword = "CdPlayerPosX" then CdPlayerPosX = detail
            when keyword = "CdPlayerPosY" then CdPlayerPosY = detail
            when keyword = "SetUpViewParametersWindowPosX" then SetUpViewParametersWindowPosX = detail
            when keyword = "SetUpViewParametersWindowPosY" then SetUpViewParametersWindowPosY = detail

            when keyword = "PopCdObjectsList" then PopCdObjectsList = detail

            /* CD-ROM */
            when keyword = "UseVolumeLabel"   then UseVolumeLabel   = detail
            when keyword = "OpenFolder"       then OpenFolder       = detail
            when keyword = "CdRomDefaultView" then CdRomDefaultView = detail
            when keyword = "ViewMode"         then ViewMode         = detail
            when keyword = "LastDrive"        then LastDrive        = detail
            when keyword = "IgnoreDrivesList" then IgnoreDrivesList = detail
/* AutoRun機能はちょっと中断 */
/*
            when keyword = "AutoRun"          then AutoRun          = detail
            when keyword = "AutoRunList"      then AutoRunList      = detail
*/

            /* Other Removable Medias */
            when keyword = "OtherRemovableMedia"     then OtherRemovableMedia     = detail
            when keyword = "OtherRemovableMediaList" then OtherRemovableMediaList = detail

            /* CD-ROM Folder Parameters */
            when keyword = "DETAILSVIEW" then pDETAILSVIEW = detail
            when keyword = "ICONVIEW"    then pICONVIEW    = detail
            when keyword = "TREEVIEW"    then pTREEVIEW    = detail
            /*
            when keyword = "BACKGROUND"  then pBACKGROUND  = detail
            when keyword = "MINWIN"      then pMINWIN      = detail
            when keyword = "CCVIEW"      then pCCVIEW      = detail
            when keyword = "HIDEBUTTON"  then pHIDEBUTTON  = detail
            */

            /* Audio CD */
/*          when keyword = "AudioCdDrive"        then AudioCdDrive        = detail */
            when keyword = "DefaultDriveCaption" then DefaultDriveCaption = detail
            when keyword = "AudioCd"             then AudioCd             = detail
            when keyword = "CdPlayerMode"        then CdPlayerMode        = detail
            when keyword = "CdAudioDeviceId"     then CdAudioDeviceId     = detail
            when keyword = "VisibleCdPlayer"     then VisibleCdPlayer     = detail
            when keyword = "CdPlayerAutoPlay"    then CdPlayerAutoPlay    = detail
            when keyword = "CdPlayerVolume"      then CdPlayerVolume      = detail
            when keyword = "CdPlayerAlwaysOnTop" then CdPlayerAlwaysOnTop = detail
            when keyword = "ExternalCdPlayer"    then ExternalCdPlayer    = detail

            /* Positioning */
            when keyword = "IconPositioning" then IconPositioning = detail

            when keyword = "IconPositionStartPointX" then IconPositionStartPointX = detail
            when keyword = "IconPositionStartPointY" then IconPositionStartPointY = detail
            when keyword = "IconPositionRows"        then IconPositionRows        = detail
            when keyword = "IconPositionIntervalsX"  then IconPositionIntervalsX  = detail
            when keyword = "IconPositionIntervalsY"  then IconPositionIntervalsY  = detail

            /* Registry */
            when keyword = "RegisterNumber" then RegisterNumber = detail
            otherwise
        end
    end
    call lineout initial_file

    /* Delete Old PopCD! Objects */
    if PopCdObjectsList <> "" then do
        do forever
            dummy = PopCdObjectsList
            parse var dummy target ";" PopCdObjectsList

            rc = SysDestroyObject(target)
            if PopCdObjectsList = "" then leave
        end
    end

    /* Set Parameter */
    if      OpenFolder = "Enabled"  then ok = VRSet( "CB_OpenFolder", "Set", 1 )
    else if OpenFolder = "Disabled" then ok = VRSet( "CB_OpenFolder", "Set", 0 )

    if      MinimizedStartup = "Enabled"  then ok = VRSet( "CB_MinimizedStartup", "Set", 1 )
    else if MinimizedStartup = "Disabled" then ok = VRSet( "CB_MinimizedStartup", "Set", 0 )

    ok = VRSet( "SPIN_TimerDelay", "Value", Delay )
    ok = VRSet( "SPIN_TimerDelay", "Value", Delay )

    /* Default Drive Caption */
    if DefaultDriveCaption = "" then DefaultDriveCaption = "Drive %d"

    /* betaから移行した場合のため 2.xx以降になればはずす */
    if (left(old_version, 1) <> "2") then DefaultDriveCaption = "Drive %d"

    ok = VRSet( "EF_DefaultDriveCaption", "Value", DefaultDriveCaption )

    /* Use Volume Lavel */
    if      UseVolumeLabel = "Enabled"  then ok = VRSet( "CB_UseVolumeLabel", "Set", 1 )
    else if UseVolumeLabel = "Disabled" then ok = VRSet( "CB_UseVolumeLabel", "Set", 0 )

    /* Last Drive */
    if (length(LastDrive) = 1) | (c2d("D") > c2d(left(LastDrive, 1))) | (c2d(left(LastDrive, 1)) > c2d("Z")) then do
        LastDrive = "Z:"
    end
    ok = VRSet( "SPIN_LastDrive", "Value", LastDrive )

    /* Ignore Drives List */
    ok = VRSet( "EF_IgnoreDrivesList", "Value", IgnoreDrivesList )

    if      OtherRemovableMedia = "Enabled"  then do
        ok = VRSet( "CB_OtherRemovableMedia", "Set", 1 )
        ok = VRSet( "DT_OtherRemovableMedia",       "Enabled", 1 )
        ok = VRSet( "EF_OtherRemovableMediaDrives", "Enabled", 1 )
        ok = VRSet( "EF_OtherRemovableMediaDrives", "BackColor", "<default>" )
    end
    else if OtherRemovableMedia = "Disabled" then do
        ok = VRSet( "CB_OtherRemovableMedia", "Set", 0 )
        ok = VRSet( "DT_OtherRemovableMedia",       "Enabled", 0 )
        ok = VRSet( "EF_OtherRemovableMediaDrives", "Enabled", 0 )
        ok = VRSet( "EF_OtherRemovableMediaDrives", "BackColor", "PaleGray" )
    end


ok = VRSet( "CB_AutoRun", "Visible", 0 )
/* AutoRun機能はちょっと中断 */
/*
    /* Auto Run */
    if AutoRun = "Enabled" then do
        ok = VRSet( "CB_AutoRun", "Set", 1 )
    end
    else if AutoRun = "Disabled" then do
        ok = VRSet( "CB_AutoRun", "Set", 0 )
    end

    /* Auto Run List */
    if AutoRunList <> "" then do
        dummy = AutoRunList
        i = 0
        do forever
            parse var dummy ar_key ";" dummy
            i = i + 1
            parse var ar_key AutoRunItem.i.AUTORUN_VOLUMEKEYWORD "," AutoRunItem.i.AUTORUN_EXENAME

            if dummy = "" then leave
        end
        AutoRunItem.0 = i
    end
*/

    /* Removable Disks */
    ok = VRSet( "EF_OtherRemovableMediaDrives", "Value", OtherRemovableMediaList )

    /* Default View */
    if ViewMode = "Enabled" then do
        ok = VRSet( "CB_FolderViewMode", "Set", 1 )
    end
    else if ViewMode = "Disabled" then do
        ok = VRSet( "CB_FolderViewMode", "Set", 0 )
    end
    /* 以下は2.16までのDefault値を設定していない不具合をRecoverする為に設定。そのうち削除するべき項目。 (2.17 beta 1, 16.Aug.1999) */
    else if ViewMode = "VIEWMODE" then do
        ViewMode = "Enabled"
        ok = VRSet( "CB_FolderViewMode", "Set", 1 )
    end

    call SetViewModeParameters ViewMode

    if      CdRomDefaultView = "Icon"    then ok = VRSet( "RB_View_Icon",    "Set", 1 )
    else if CdRomDefaultView = "Tree"    then ok = VRSet( "RB_View_Tree",    "Set", 1 )
    else if CdRomDefaultView = "Details" then ok = VRSet( "RB_View_Details", "Set", 1 )

    /* Set Parameters */
    /*
    CdFolderParameters = "DETAILSVIEW="pDETAILSVIEW";ICONVIEW="pICONVIEW";TREEVIEW="pTREEVIEW";BACKGROUND="pBACKGROUND";MINWIN="pMINWIN";CCVIEW="pCCVIEW";HIDEBUTTON="pHIDEBUTTON
    */
    CdFolderParameters = "DETAILSVIEW="pDETAILSVIEW";ICONVIEW="pICONVIEW";TREEVIEW="pTREEVIEW


    /* Trigger */
    if      PopCdTrigger = "Enabled"  then ok = VRSet( "CB_PopFDEnabled", "Set", 1 )
    else if PopCdTrigger = "Disabled" then ok = VRSet( "CB_PopFDEnabled", "Set", 0 )
/*
    call SetPopCdTrigger PopCdTrigger
*/

    /* Audio CD */
    ok = VRSet( "SPIN_CdAudioId", "Value", CdAudioDeviceId ) /* Bug修正 2.17 この命令をここに追加(何故かこの命令が消えていた!!!) (2.17 beta 1, 16.AUg.1999) */

    if AudioCd = "Enabled" then do
        ok = VRSet( "CB_AudioCd", "Set", 1 )

        ok = VRSet( "DT_AudioCdDeviceId",  "Enabled", 1 )
        ok = VRSet( "SPIN_CdAudioId",      "Enabled", 1 )
    end
    else do
        ok = VRSet( "CB_AudioCd", "Set", 0 )

        ok = VRSet( "DT_AudioCdDeviceId",  "Enabled", 0 )
        ok = VRSet( "SPIN_CdAudioId",      "Enabled", 0 )
    end

    /* Internal/External CD Player */
    if CdPlayerMode = "Internal" then do
        ok = VRSet( "RB_UsePopCdPlayer",      "Set", 1 )
    end
    else if CdPlayerMode = "External" then do
        ok = VRSet( "RB_UseExternalCdPlayer", "Set", 1 )
    end

/* これらのParameterはChild Windowに移動した (2.11 beta 6, 17.Apr.1999) */
/*
    /* Visible CD Player */
    if      VisibleCdPlayer = "Enabled"  then do
        ok = VRSet( "CB_VisibleCdPlayer", "Set", 1 )
        ok = VRSet( "CB_CdPlayerAlwaysOnTop", "Enabled", 1 )
    end
    else if VisibleCdPlayer = "Disabled" then do
        ok = VRSet( "CB_VisibleCdPlayer", "Set", 0 )
        ok = VRSet( "CB_CdPlayerAlwaysOnTop", "Enabled", 0 )
    end

    /* CD Player Auto Play */
    if      CdPlayerAutoPlay = "Enabled"  then ok = VRSet( "CB_CdPlayerAutoPlay", "Set", 1 )
    else if CdPlayerAutoPlay = "Disabled" then ok = VRSet( "CB_CdPlayerAutoPlay", "Set", 0 )
    ok = VRSet( "SPIN_CdAudioId", "Value", CdAudioDeviceId )

    /* CD Player Always on Top */
    if      CdPlayerAlwaysOnTop = "ON"  then ok = VRSet( "CB_CdPlayerAlwaysOnTop", "Set", 1 )
    else if CdPlayerAlwaysOnTop = "OFF" then ok = VRSet( "CB_CdPlayerAlwaysOnTop", "Set", 0 )
*/

    /* External CD Player */
    if ExternalCdPlayer = "" then do
        CdPlayerMode = "Internal"
        ok = VRSet( "RB_UsePopCdPlayer", "Set", 1 )
    end
    else do
        ok = VRSet( "EF_ExternalCdPlayer", "Value", VRParseFileName(ExternalCdPlayer, "N")"."VRParseFileName(ExternalCdPlayer, "E") )
    end

    /* Set Audio CD CD Player Parameters */
    if AudioCd = "Enabled" then do
        call SetAudioCdCdPlayerParameters CdPlayerMode
    end
    else do
        ok = VRSet( "DT_AudioCdDeviceId",  "Enabled", 0 )
        ok = VRSet( "SPIN_CdAudioId",      "Enabled", 0 )

        ok = VRSet( "RB_UsePopCdPlayer",        "Enabled", 0 )
        ok = VRSet( "PB_InternalCdPlayerSetup", "Enabled", 0 )

        ok = VRSet( "EF_ExternalCdPlayer",    "Enabled", 0 )
        ok = VRSet( "PB_SetExternalCdPlayer", "Enabled", 0 )
        ok = VRSet( "RB_UseExternalCdPlayer", "Enabled", 0 )

        ok = VRSet( "PB_MMPM2_Setup", "Enabled", 0 )
    end

    /* Window Position */
    PosX_old = PosX
    PosY_old = PosY
    CdPlayerPosX_old = CdPlayerPosX
    CdPlayerPosY_old = CdPlayerPosY

    /* Icon Position */
    if IconPositioning = "None"  then do
        ok = VRSet( "RB_Positioning_None", "Set", 1 )
        ok = VRSet( "PB_SetupAutoPosition", "Enabled", 0 )
    end
    if IconPositioning = "Auto"  then do
        ok = VRSet( "RB_Positioning_Auto", "Set", 1 )
        ok = VRSet( "PB_SetupAutoPosition", "Enabled", 1 )
    end
    if IconPositioning = "Fixed" then do
        ok = VRSet( "RB_Positioning_Fix", "Set", 1 )
        ok = VRSet( "PB_SetupAutoPosition", "Enabled", 0 )
    end

    call SetAutoPositionValue

return

/*:VRX         Reset
*/
/* ここではIconのリセットを行う */
Reset:

    if PopCdTrigger = "Enabled" then do

        /* 1.まず、Timerを止める。 */
        PopCdTrigger = "Disabled"
        call SetPopCdTrigger PopCdTrigger

        /* 2.Objectを消去する。 */
        do i = 3 to 25
            if PopCdObject.i.STATUS = "MOUNT" then do
                rc = SysDestroyObject(PopCdObject.i.CDOBJECTID)
                PopCdObject.i.STATUS = "UNMOUNT"
            end
        end

        rc = SysDestroyObject(PopCdAudioObject)
        CdAudioStatus = "Disabled"


        /* 3.Auto Position使用時、Positionをリセットする。 */
        if IconPositioning = "Auto" then do
            call SetAutoPositionValue
        end

        /* 4.Timerを再度動かす。 */
        PopCdTrigger = "Enabled"
        call SetPopCdTrigger PopCdTrigger
    end

return

/*:VRX         ResetIconName
*/
ResetIconName:

    /* ObjectのEject時、Drive名をDefaultに戻す機能 (Add 12.Aug.1999) */
    parse arg id

    if UseVolumeLabel = "Enabled" then do
        parse var DefaultDriveCaption t_wrd1 "%d" t_wrd2
        if (t_wrd2 = "") & (right(DefaultDriveCaption, 2) <> "%d") then do
            t_wrd = strip(t_wrd1)
        end
        else do
            t_wrd = strip(t_wrd1""d2c(id + c2d("A"))""t_wrd2)
        end
        params = "TITLE="t_wrd";"

        /* <WP_DRIVES>上に一瞬だけOBJECTを作成し、Rename後削除する (12.Aug.1999) */
        rc = SysCreateObject("WPShadow", " ", "<WP_DRIVES>", "SHADOWID="PopCdObject.id.CDDRIVEID";OBJECTID="PopCdObject.id.CDOBJECTID";", "u")
        rc = SysSetObjectData( PopCdObject.id.CDOBJECTID, params )
        rc = SysDestroyObject( PopCdObject.id.CDOBJECTID )
    end

return

/*:VRX         SetAudioCdCdPlayerParameters
*/
SetAudioCdCdPlayerParameters:

    parse arg _CdPlayerMode

    if      CdPlayerMode = "Internal" then do
/*
        ok = VRSet( "CB_VisibleCdPlayer",     "Enabled", 1 )
        ok = VRSet( "CB_CdPlayerAutoPlay",    "Enabled", 1 )
        ok = VRSet( "CB_CdPlayerAlwaysOnTop", "Enabled", 1 )
*/
        ok = VRSet( "PB_InternalCdPlayerSetup", "Enabled", 1 )

        ok = VRSet( "PB_SetExternalCdPlayer",   "Enabled", 0 )
        ok = VRSet( "EF_ExternalCdPlayer",      "Enabled", 0 )
    end
    else if CdPlayerMode = "External" then do
/*
        ok = VRSet( "CB_VisibleCdPlayer",     "Enabled", 0 )
        ok = VRSet( "CB_CdPlayerAutoPlay",    "Enabled", 0 )
        ok = VRSet( "CB_CdPlayerAlwaysOnTop", "Enabled", 0 )
*/
        ok = VRSet( "PB_InternalCdPlayerSetup", "Enabled", 0 )

        ok = VRSet( "PB_SetExternalCdPlayer",   "Enabled", 1 )
        ok = VRSet( "EF_ExternalCdPlayer",      "Enabled", 1 )
    end

return

/*:VRX         SetAutoPositionValue
*/
SetAutoPositionValue:

    IconPositionX = IconPositionStartPointX
    IconPositionY = IconPositionStartPointY

    j = 0
    k = 0
    do i = 1 to 26 - 3 /* (D: - Z:) */
        k = k + 1
        if k > IconPositionRows then do
            IconPositionX = IconPositionStartPointX
            k = 1
        end
        else if k > 1 then do
            IconPositionX = IconPositionX + IconPositionIntervalsX
        end

        j = j + 1
        if j > IconPositionRows then do
            IconPositionY = IconPositionY - IconPositionIntervalsY
            j = 1
        end

        IconPosition.i.IconPositionXY        = IconPositionX","IconPositionY
        IconPosition.i.IconPositionStatus    = "NOT USED"
        IconPosition.i.IconPositionObejectId = ""
    end
    IconPosition.0 = i - 1

/*
    say IconPosition.0
    do i = 1 to IconPosition.0
        say i" : "IconPosition.i.IconPositionXY
    end
*/

return

/*:VRX         SetCdPlayerDefaultButton
*/
SetCdPlayerDefaultButton:

    /* Buttons */
    if CdPlayerAutoPlay = "Enabled" then do
        ok = VRSet( "IPB_CD_Play", "PicturePath", "#205" )
        ok = VRSet( "IPB_CD_Play", "Enabled", 0 )

        ok = VRSet( "IPB_CD_Stop", "PicturePath", "#210" )
        ok = VRSet( "IPB_CD_Stop", "Enabled", 1 )
    end
    else if CdPlayerAutoPlay = "Disabled" then do
        ok = VRSet( "IPB_CD_Play", "PicturePath", "#200" )
        ok = VRSet( "IPB_CD_Play", "Enabled", 1 )

        ok = VRSet( "IPB_CD_Stop", "PicturePath", "#215" )
        ok = VRSet( "IPB_CD_Stop", "Enabled", 0 )
    end

    ok = VRSet( "IPB_CD_NextTrack", "PicturePath", "#220" )
    ok = VRSet( "IPB_CD_NextTrack", "Enabled", 1 )

    ok = VRSet( "IPB_CD_PrevTrack", "PicturePath", "#235" )
/*  ok = VRSet( "IPB_CD_PrevTrack", "Enabled", 0 ) */
    ok = VRSet( "IPB_CD_PrevTrack", "Enabled", 1 )

    ok = VRSet( "IPB_CdPlayer_LoadEject", "PicturePath", "#294" )

    /* Numbers */
    ok = VRSet( "Pict_Num_10", "PicturePath", "#240" )
    ok = VRSet( "Pict_Num_01", "PicturePath", "#241" ) /* Auto Play from track 1 */
    
return

/*:VRX         SetDefault
*/
SetDefault:

    /* Registry */
    Registry = "Unregistered"
    RegisterNumber = "Unregistered"

    PopCdRomObjects.0  = 0  /* Defaultにはなにも存在しないのだ */
    PopCdRomObjectsNum = 0

    CdAudioStatus = "Disabled"

    DefaultDriveCaption = "Drive %d"
    ok = VRSet( "EF_DefaultDriveCaption", "Value", DefaultDriveCaption )

    CdPlayerMode = "Internal" /* Internal or External */
    ExternalCdPlayer = ""
    ok = VRSet( "RB_UsePopCdPlayer", "Set", 1 )
    ok = VRSet( "PB_SetExternalCdPlayer", "Enabled", 0 )

    LastDrive = "Z:"

    LD_List.0 = 0
    do i = 1  to 23
        LD_List.i = d2c(i + 2 + c2d("A"))":"
    end
    LD_LIst.0 = 23
    ok = VRMethod( "SPIN_LastDrive", "SetStringList", "LD_List." )
    ok = VRSet( "SPIN_LastDrive", "Value", LastDrive )

    IgnoreDrivesList = ""

    CDDRIVEID   = 1
    CDOBJECTID  = 2
    FILESYSTEM  = 3
    VOLUMELABEL = 4
    STATUS      = 5
    MEDIATYPE   = 6

    do i = 3 to 25
        PopCdObject.i.CDDRIVEID   = ""
        PopCdObject.i.CDOBJECTID  = ""
        PopCdObject.i.FILESYSTEM  = "NO DISK"
        PopCdObject.i.VOLUMELABEL = "NONE"
        PopCdObject.i.STATUS      = "UNMOUNT"
        PopCdObject.i.MEDIATYPE   = "NONE"
    end
    PopCdObject.0 = 25

    OtherMedia.0 = 0
    OtherRemovableMedia = "Disabled"
    OtherRemovableMediaList = ""

    /* CD-ROM Drive Default View */
    ViewMode = "Enabled"
    ok = VRSet( "CB_FolderViewMode", "Set", 1 )
    call SetViewModeParameters ViewMode

    CdRomDefaultView = "Icon" /* Icon, Tree, Details */
    ok = VRSet( "RB_View_Icon", "Set", 1 )

    OpenFolder = "Disabled"
    ok = VRSet( "CB_OpenFolder", "Set", 0 )

/* AutoRun機能はちょっと中断 */
/*
    /* Auto Run */
    AUTORUN_VOLUMEKEYWORD = 1
    AUTORUN_EXENAME = 2

    AutoRun = "Disabled"
    ok = VRSet( "CB_AutoRun", "Set", 0 )

    /* Default Auto Run List */
    AutoRunList = "HOBBES,os2view.exe;OS2MAG,CDVIEW.EXE"
*/

    CdPlayerPosX = ""
    CdPlayerPosY = ""

    PopCDTrigger = "Disabled"
    call SetPopCdTrigger PopCdTrigger

    AudioCd = "Enabled"
    CdAudioDeviceId = 1
    /* とりあえず、CD AUDIOは3台までと仮定して... */
    /* 6台まで拡張 (Version 2.15a, 14.Jun.1999)   */
    do i = 1 to 6
        cadi.i = i
    end
    cadi.0 = i
    ok = VRMethod( "SPIN_CdAudioId", "SetStringList", "cadi." )
    /* * * * */

    VisibleCdPlayer   = "Enabled"

    CdPlayerAutoPlay  = "Enabled"
/*  ok = VRSet( "CB_CdPlayerAutoPlay", "Set", 1 ) */

    CdPlayerAlwaysOnTop = "OFF"

    CdPlayerVolume    = 80
    CdPlayerTitleBar  = "Disabled"
    CdPlayer          = "Disabled"
    CdPlayerHeightMin = 530 + 2
    CdPlayerHeightMax = 795 + 2
    CdPlayerHeightVolumePlus = 867 - CdPlayerHeightMin

    timer_delay.0 = 0
    do i = 1 to 100
        timer_delay.i = i * 100
    end
    timer_delay.0 = i
    ok = VRMethod( "SPIN_TimerDelay", "SetStringList", "timer_delay." )
    ok = VRSet( "SPIN_TimerDelay", "Index", 10 )
    Delay = 1000

    MinimizedStartup = "Disabled"
    ok = VRSet( "CB_MinimizedStartup", "Set", 0 )

    UseVolumeLabel = "Disabled"
    ok = VRSet( "CB_UseVolumeLabel", "Set", 0 )

    Font = "<NONE>"
    Timing = "Startup"

    /* CD-ROM Folder Parameters */
    /* DETALES VIEW */
/*  pDETAILSCLASS=WPFileSystem */
/*  pDETAILSFONT=8.Helv */
    pDETAILSVIEW="MINI"   /* (MINI/NORMAL) */


    /* Set Up View Window Default Position */
    SetUpViewParametersWindowPosX = ""
    SetUpViewParametersWindowPosY = ""

    /* ICON VIEW */
/*  pICONFONT=10.Helv */
    pICONVIEW="NOGRID,NORMAL"  /* (NOGRID/GRID/FLOWED/NOFLOWED, NORMAL/INVISIBLE/MINI) */
/*  pICONVIEWPOS=0,0,0,0  */   /* x,y,cx,cy 0-100 */

    /* TREEE VIEW */
    pTREEVIEW="LINES,NORMAL" /* (LINES/NOLINES, NORMAL/MINI/INVISIBLE) */

    /* COMMON */
/*  pALWAYSSORT=NO (NO/YES)  */
    /*
    pBACKGROUND=popfddisk""popfddirectory"\popcd.bmp,T,2,I,204 204 204"           /* Image, Mode(Normal,Tiled, Scaled), Scale, BGType(I, C), BGColor */
    */
/*  pWORKAREA=NO (NO/YES)    */
/*  pREMOVEFONTS=NO (NO/YES) */
/*  pSORTCLASS=WPFileSystem  */    /* classname  */

    /* COMMON:WINDOW */
    /*
    pMINWIN    ="VIEWER"  /* (HIDE/VIEWER/DESKTOP)  最小化ボタンの動作           */
    pCCVIEW    ="DEFAULT" /* (DEFAULT/YES/NO)       オブジェクトのIープンの動作 */
    pHIDEBUTTON="YES" /* (YES/NO)               ウィンドウのボタンの形状     */
    */

    /* COMMON:ICON */
/*  pICONFILE=     */ /* filename */
/*  pICONPOS=0,0   */ /* x,y */
/*  pICONRESOURCE= */ /* id,module */

    /* Set Parameters */
    CdFolderParameters = "DETAILSVIEW="pDETAILSVIEW";ICONVIEW="pICONVIEW";TREEVIEW="pTREEVIEW";BACKGROUND="pBACKGROUND";MINWIN="pMINWIN";CCVIEW="pCCVIEW";HIDEBUTTON="pHIDEBUTTON


    /* Icon Position */
    IconPositioning = "None" /* None/Auto/Fix */
    ok = VRSet( "PB_SetupAutoPosition", "Enabled", 0 )

    IconPositionXY       = 1
    IconPositionStatus   = 2
    IconPositionObjectId = 3

    IconPositionStartPointX = 10
    IconPositionStartPointY = 60
    IconPositionRows = 2
    IconPositionIntervalsX = 8
    IconPositionIntervalsY = 8

    call SetAutoPositionValue

    CdAudioCdRomFlag = "OFF"

return

/*:VRX         SetDefaultView
*/
SetDefaultView:

    if ViewMode = "Enabled" then do
        do i = 3 to 25
            if PopCdObject.i.STATUS = "MOUNT" then do
                params = CdFolderParameters";DEFAULTVIEW="translate(CdRomDefaultView)

                rc = SysSetObjectData(d2c(i + c2d("A"))":", params )
            end
        end

        /* for save parameters in initial file */
        Parameters = "Changed"
    end

return

/*:VRX         SetFont
*/
SetFont:

    ok = VRSet( "CB_UseVolumeLabel",                "Font", Font )
    ok = VRSet( "CB_OpenFolder",                    "Font", Font )
    ok = VRSet( "DT_Default",                       "Font", Font )
    ok = VRSet( "EF_DefaultDriveCaption",           "Font", Font )
    ok = VRSet( "CB_FolderViewMode",                "Font", Font )
    ok = VRSet( "RB_View_Icon",                     "Font", Font )
    ok = VRSet( "RB_View_Tree",                     "Font", Font )
    ok = VRSet( "RB_View_Details",                  "Font", Font )
    ok = VRSet( "PB_OpenSetUpViewParametersWindow", "Font", Font )
    ok = VRSet( "CB_AutoRun",                       "Font", Font )
    ok = VRSet( "DT_LastDrive",                     "Font", Font )
    ok = VRSet( "SPIN_LastDrive",                   "Font", Font )

    ok = VRSet( "CB_PopFDEnabled",                  "Font", Font )
    ok = VRSet( "CB_MinimizedStartup",              "Font", Font )
    ok = VRSet( "DT_Delay",            "Font", Font )
    ok = VRSet( "SPIN_TimerDelay",     "Font", Font )
    ok = VRSet( "DT_MiliSeconds",      "Font", Font )

    ok = VRSet( "EF_FontName",         "Font", Font )
    ok = VRSet( "DT_IgnoreDrive",      "Font", Font )
    ok = VRSet( "EF_IgnoreDrivesList", "Font", Font )

    ok = VRSet( "PB_SetFont",  "Font", Font )

    ok = VRSet( "CB_OtherRemovableMedia",       "Font", Font )
    ok = VRSet( "DT_OtherRemovableMedia",       "Font", Font )
    ok = VRSet( "EF_OtherRemovableMediaDrives", "Font", Font )

    ok = VRSet( "PB_ExitPopCd",  "Font", Font )
    ok = VRSet( "PB_AboutPopCd", "Font", Font )

    /* Audio CD */
    ok = VRSet( "CB_AudioCd",               "Font", Font )
    ok = VRSet( "DT_AudioCdDeviceId",       "Font", Font )
    ok = VRSet( "SPIN_CdAudioId",           "Font", Font )
    ok = VRSet( "RB_UsePopCdPlayer",        "Font", Font )
    ok = VRSet( "PB_InternalCdPlayerSetup", "Font", Font )
/*
    ok = VRSet( "CB_VisibleCdPlayer",       "Font", Font )
    ok = VRSet( "CB_CdPlayerAutoPlay",      "Font", Font )
    ok = VRSet( "CB_CdPlayerAlwaysOnTop",   "Font", Font )
*/
    ok = VRSet( "RB_UseExternalCdPlayer",   "Font", Font )
    ok = VRSet( "EF_ExternalCdPlayer",      "Font", Font )
    ok = VRSet( "PB_SetExternalCdPlayer",   "Font", Font )
    ok = VRSet( "PB_MMPM2_Setup",           "Font", Font )

    /* Position */
    ok = VRSet( "RB_Positioning_None",  "Font", Font )
    ok = VRSet( "RB_Positioning_Auto",  "Font", Font )
    ok = VRSet( "PB_SetupAutoPosition", "Font", Font )

return

/*:VRX         SetPopCdTrigger
*/
SetPopCdTrigger:

    parse arg _PopCdTrigger

    select
        when _PopCdTrigger = "Enabled" then do
            ok = VRSet( "TM_PopCdTrigger", "Enabled", 1 )
            ok = VRSet( "SPIN_TimerDelay", "Enabled", 1 )
            ok = VRSet( "DT_MiliSeconds",  "Enabled", 1 )

            ok = VRSet( "SPIN_TimerDelay", "BackColor", "<default>" )
        end
        when _PopCdTrigger = "Disabled" then do
            ok = VRSet( "TM_PopCdTrigger", "Enabled", 0 )
            ok = VRSet( "SPIN_TimerDelay", "Enabled", 0 )
            ok = VRSet( "DT_MiliSeconds",  "Enabled", 0 )

            ok = VRSet( "SPIN_TimerDelay", "BackColor", "PaleGray" )
        end

        otherwise
    end

return

/*:VRX         SetUpViewParametersWindowData
*/
SetUpViewParametersWindowData:

    do i = 1 to 256
        col.i = i - 1
    end
    col.0 = 256
    ok = VRMethod( "SPIN_Color_Red", "SetStringList",   "col." )
    ok = VRMethod( "SPIN_Color_Green", "SetStringList", "col." )
    ok = VRMethod( "SPIN_Color_Blue", "SetStringList",  "col." )

    /* Icon View */
    parse var pICONVIEW iv_f "," iv_i
    if      iv_f = "NOGRID"   then ok = VRSet( "RB_IconViewFormat_NoGrid",   "Set", 1 )
    else if iv_f = "GRID"     then ok = VRSet( "RB_IconViewFormat_Grid",     "Set", 1 )
    else if iv_f = "FLOWED"   then ok = VRSet( "RB_IconViewFormat_Flowed",   "Set", 1 )
    else if iv_f = "NOFLOWED" then ok = VRSet( "RB_IconViewFormat_NoFlowed", "Set", 1 )

    if      iv_i = "NORMAL"    then ok = VRSet( "RB_IconViewIcon_Normal",    "Set", 1 )
    else if iv_i = "MINI"      then ok = VRSet( "RB_IconViewIcon_Mini",      "Set", 1 )
    else if iv_i = "INVISIBLE" then ok = VRSet( "RB_IconViewIcon_Invisible", "Set", 1 )

    /* Tree View */
    parse var pTREEVIEW tv_f "," tv_i
    if      tv_f = "LINES"   then ok = VRSet( "RB_TreeViewFormat_Lines",   "Set", 1 )
    else if tv_f = "NOLINES" then ok = VRSet( "RB_TreeViewFormat_NoLines", "Set", 1 )

    if      tv_i = "NORMAL"    then ok = VRSet( "RB_TreeViewIcon_Normal",    "Set", 1 )
    else if tv_i = "MINI"      then ok = VRSet( "RB_TreeViewIcon_Mini",      "Set", 1 )
    else if tv_i = "INVISIBLE" then ok = VRSet( "RB_TreeViewIcon_Invisible", "Set", 1 )

    /* Details View */
    if      pDETAILSVIEW="MINI"   then ok = VRSet( "RB_DetailsViewIcon_Mini", "Set", 1 )
    else if pDETAILSVIEW="NORMAL" then ok = VRSet( "RB_DetailsViewIcon_Normal", "Set", 1 )

    /* Window Minimized Style */
    if      pMINWIN ="HIDE"    then ok = VRSet( "RB_WindowMinimized_Hide",    "Set", 1 )
    else if pMINWIN ="VIEWER"  then ok = VRSet( "RB_WindowMinimized_Viewer",  "Set", 1 )
    else if pMINWIN ="DESKTOP" then ok = VRSet( "RB_WindowMinimized_Desktop", "Set", 1 )

    /* CC View オブジェクトのオープンの動作 */
    if      pCCVIEW = "DEFAULT" then ok = VRSet( "RB_CCView_Default", "Set", 1 )
    else if pCCVIEW = "YES"     then ok = VRSet( "RB_CCView_Yes",     "Set", 1 )
    else if pCCVIEW = "NO"      then ok = VRSet( "RB_CCView_No",      "Set", 1 )

    /* Window Hide Button */
    if      pHIDEBUTTON="YES" then ok = VRSet( "RB_HideButton_Yes", "Set", 1 )
    else if pHIDEBUTTON="NO"  then ok = VRSet( "RB_HideButton_No",  "Set", 1 )

    /* Background */
    parse var pBACKGROUND bg_img "," bg_mode "," bg_scale "," bg_type "," bg_rgb
    ok = VRSet( "EF_BackGroundImageFile", "Value", bg_img )
    ok = VRSet( "Pict_BackgroundImage", "PicturePath", bg_img )

    if      bg_mode = "N" then bg_mode = "Normal"
    else if bg_mode = "T" then bg_mode = "Tiled"
    else if bg_mode = "S" then bg_mode = "Scale"
    ok = VRSet( "SPIN_BackGroundImageMode", "Value", bg_mode )

    if      bg_scale =  "1" then bg_scale = "1x1"
    else if bg_scale =  "2" then bg_scale = "2x2"
    else if bg_scale =  "3" then bg_scale = "3x3"
    else if bg_scale =  "4" then bg_scale = "4x4"
    else if bg_scale =  "5" then bg_scale = "5x5"
    else if bg_scale =  "6" then bg_scale = "6x6"
    else if bg_scale =  "7" then bg_scale = "7x7"
    else if bg_scale =  "8" then bg_scale = "8x8"
    else if bg_scale =  "9" then bg_scale = "9x9"
    else if bg_scale = "10" then bg_scale = "10x10"
    else if bg_scale = "11" then bg_scale = "11x11"
    else if bg_scale = "12" then bg_scale = "12x12"
    else if bg_scale = "13" then bg_scale = "13x13"
    else if bg_scale = "14" then bg_scale = "14x14"
    else if bg_scale = "15" then bg_scale = "15x15"
    else if bg_scale = "16" then bg_scale = "16x16"
    else if bg_scale = "17" then bg_scale = "17x17"
    else if bg_scale = "18" then bg_scale = "18x18"
    else if bg_scale = "19" then bg_scale = "19x19"
    else if bg_scale = "20" then bg_scale = "20x20"
    ok = VRSet( "SPIN_BackGroundImageScale", "Value", bg_scale )

    if      bg_type = "I" then bg_type = "Image" /* Image */
    else if bg_type = "C" then bg_type = "Color" /* Color Only */
    ok = VRSet( "SPIN_BackGroundType", "Value", bg_type )

    parse var bg_rgb bg_red bg_green bg_blue
    ok = VRSet( "SPIN_Color_Red",   "Value", bg_red   )
    ok = VRSet( "SPIN_Color_Green", "Value", bg_green )
    ok = VRSet( "SPIN_Color_Blue",  "Value", bg_blue  )
    ok = VRSet( "Pict_BackgroundImage", "BorderColor", "("bg_red","bg_green","bg_blue")" )

return

/*:VRX         SetUpViewParametersWindowFont
*/
SetUpViewParametersWindowFont:

    ok = VRSet( "GB_IconView",                "Font", Font )
    ok = VRSet( "GB_IconView_Format",         "Font", Font )
    ok = VRSet( "RB_IconViewFormat_NoGrid",   "Font", Font )
    ok = VRSet( "RB_IconViewFormat_Grid",     "Font", Font )
    ok = VRSet( "RB_IconViewFormat_Flowed",   "Font", Font )
    ok = VRSet( "RB_IconViewFormat_NoFlowed", "Font", Font )
    ok = VRSet( "GB_IconView_Icon",           "Font", Font )
    ok = VRSet( "RB_IconViewIcon_Normal",     "Font", Font )
    ok = VRSet( "RB_IconViewIcon_Mini",       "Font", Font )
    ok = VRSet( "RB_IconViewIcon_Invisible",  "Font", Font )

    ok = VRSet( "GB_TreeView",               "Font", Font )
    ok = VRSet( "GB_TreeView_Format",        "Font", Font )
    ok = VRSet( "RB_TreeViewFormat_Lines",   "Font", Font )
    ok = VRSet( "RB_TreeViewFormat_NoLines", "Font", Font )
    ok = VRSet( "GB_TreeView_Icon",          "Font", Font )
    ok = VRSet( "RB_TreeViewIcon_Normal",    "Font", Font )
    ok = VRSet( "RB_TreeViewIcon_Mini",      "Font", Font )
    ok = VRSet( "RB_TreeViewIcon_Invisible", "Font", Font )

    ok = VRSet( "GB_DetailsViewIcon",        "Font", Font )
    ok = VRSet( "GB_DetailsView_Icon",       "Font", Font )
    ok = VRSet( "RB_DetailsViewIcon_Normal", "Font", Font )
    ok = VRSet( "RB_DetailsViewIcon_Mini",   "Font", Font )

    ok = VRSet( "PB_CloseSetUpViewParameterWindow", "Font", Font )
    ok = VRSet( "PB_Cancel",                        "Font", Font )

return

/*:VRX         SetViewModeParameters
*/
SetViewModeParameters:

    parse arg _ViewMode

    if   _ViewMode = "Enabled" then do
        ok = VRSet( "RB_View_Icon",                     "Enabled", 1 )
        ok = VRSet( "RB_View_Tree",                     "Enabled", 1 )
        ok = VRSet( "RB_View_Details",                  "Enabled", 1 )
        ok = VRSet( "PB_OpenSetUpViewParametersWindow", "Enabled", 1 )
    end
    else if _ViewMode = "Disabled" then do
        ok = VRSet( "RB_View_Icon",                     "Enabled", 0 )
        ok = VRSet( "RB_View_Tree",                     "Enabled", 0 )
        ok = VRSet( "RB_View_Details",                  "Enabled", 0 )
        ok = VRSet( "PB_OpenSetUpViewParametersWindow", "Enabled", 0 )
    end

return

/*:VRX         SL_CdPlayer_Volume_Change
*/
SL_CdPlayer_Volume_Change:

    percentile = VRGet( "SL_CdPlayer_Volume", "Percentile" )
    CdPlayerVolume = percentile

    rc = mciRxSendString("set cda audio volume "CdPlayerVolume, "retStr", "0", "0")

    call WriteInitialFile

return

/*:VRX         SPIN_BackGroundImageMode_Change
*/
SPIN_BackGroundImageMode_Change:

    value = VRGet( "SPIN_BackGroundImageMode", "Value" )
    bg_mode = left(value, 1)

return

/*:VRX         SPIN_BackGroundImageScale_Change
*/
SPIN_BackGroundImageScale_Change:

    value = VRGet( "SPIN_BackGroundImageScale", "Value" )
    parse var value bg_scale "x" .

return

/*:VRX         SPIN_BackGroundType_Change
*/
SPIN_BackGroundType_Change:

    value = VRGet( "SPIN_BackGroundType", "Value" )
    bg_type = left(value, 1)

return

/*:VRX         SPIN_CdAudioId_Change
*/
SPIN_CdAudioId_Change:

    if Timing <> "Startup" then do
        ok = VRSet( "CB_PopFDEnabled", "Set", 0 )
        ok = VRSet( "CB_PopFDEnabled", "ForeColor", "Red" )

        PopCdTrigger = "Disabled"
        call SetPopCdTrigger PopCdTrigger
    end

    value = VRGet( "SPIN_CdAudioId", "Value" )
    CdAudioDeviceId = value

    /* for save parameters in initial file */
    Parameters = "Changed"
/*
    Timing = "Current"
*/
return

/*:VRX         SPIN_Color_Blue_Change
*/
SPIN_Color_Blue_Change:

    bg_blue = VRGet( "SPIN_Color_Blue", "Value" )
    ok = VRSet( "Pict_BackgroundImage", "BorderColor", "("bg_red","bg_green","bg_blue")" )

return

/*:VRX         SPIN_Color_Green_Change
*/
SPIN_Color_Green_Change:

    bg_green = VRGet( "SPIN_Color_Green", "Value" )
    ok = VRSet( "Pict_BackgroundImage", "BorderColor", "("bg_red","bg_green","bg_blue")" )

return

/*:VRX         SPIN_Color_Red_Change
*/
SPIN_Color_Red_Change:

    bg_red = VRGet( "SPIN_Color_Red", "Value" )
    ok = VRSet( "Pict_BackgroundImage", "BorderColor", "("bg_red","bg_green","bg_blue")" )

return

/*:VRX         SPIN_LastDrive_Change
*/
SPIN_LastDrive_Change:

    value = VRGet( "SPIN_LastDrive", "Value" )
    LastDrive = value

    /* for save parameters in initial file */
    Parameters = "Changed"

return

/*:VRX         SPIN_TimerDelay_Change
*/
SPIN_TimerDelay_Change:

    Delay = VRGet( "SPIN_TimerDelay", "Value" )
    ok = VRSet( "TM_PopCdTrigger", "Delay", Delay )

    /* for save parameters in initial file */
    Parameters = "Changed"

return

/*:VRX         SW_CdPlayer_Close
*/
SW_CdPlayer_Close:

    CdPlayerTitleBar  = "Disabled"

    call WriteInitialFile

    call SW_CdPlayer_Fini
return

/*:VRX         SW_CdPlayer_ContextMenu
*/
SW_CdPlayer_ContextMenu: 

    if      CdPlayerTitleBar = "Enabled"  then ok = VRSet( "Menu_HideTitleBar", "Checked", 0 )
    else if CdPlayerTitleBar = "Disabled" then ok = VRSet( "Menu_HideTitleBar", "Checked", 1 )

    if      CdPlayerVolumeMode = "Enabled"  then ok = VRSet( "Menu_HideVolume", "Checked", 0 )
    else if CdPlayerVolumeMode = "Disabled" then ok = VRSet( "Menu_HideVolume", "Checked", 1 )

    /* Default Enabled */
    ok = VRSet( "Menu_PlayPrevious", "Enabled", 1 )
    ok = VRSet( "Menu_PlayNext",     "Enabled", 1 )

    if CurrentTrack = 1           then ok = VRSet( "Menu_PlayPrevious", "Enabled", 0 )
    if CurrentTrack = TrackNumber then ok = VRSet( "Menu_PlayNext",     "Enabled", 0 )

/*  Context Menu Fix (2.19 beta 4, 10.Nov.1999) */
/*
    /* Context Menu Fix (2.18 beta 3, 18.Sep.1999) */
    rc = mciRxSendString("status cda mode wait", "retStr", "0", "0")
    if retStr = "stopped" then do
        ok = VRSet( "Menu_Play", "Enabled", 1 )
        ok = VRSet( "Menu_Stop", "Enabled", 0 )
    end
    else do
        ok = VRSet( "Menu_Play", "Enabled", 0 )
        ok = VRSet( "Menu_Stop", "Enabled", 1 )
    end
*/
    enabled = VRGet( "IPB_CD_Stop", "Enabled" )
    if enabled = 1 then ok = VRSet( "Menu_Stop", "Enabled", 1 )
    if enabled = 0 then ok = VRSet( "Menu_Stop", "Enabled", 0 )

    enabled = VRGet( "IPB_CD_Play", "Enabled" )
    if enabled = 1 then ok = VRSet( "Menu_Play", "Enabled", 1 )
    if enabled = 0 then ok = VRSet( "Menu_Play", "Enabled", 0 )


    /* Set Track List */
    do i = 1 to MaxTrackNumber
        ok = VRSet( "PlayTrack"right(i, 2, "0"), "Checked", 0 )
    end
    ok = VRSet( "PlayTrack"right(CurrentTrack, 2, "0"), "Checked", 1 )
  
    call PopUpCdPlayerMenu

return

/*:VRX         SW_CdPlayer_Create
*/
SW_CdPlayer_Create:
    call SW_CdPlayer_Init
return

/*:VRX         SW_CdPlayer_Fini
*/
SW_CdPlayer_Fini:

    /* CD PlayerがEnabledの時、Positionに変更があったらini fileを保存する(必要ないかもしれないが、念のため...) */
    if CdPlayerTitleBar = "Enabled" then do
        CdPlayerPosX = VRGet( "SW_CdPlayer", "Left" )
        CdPlayerPosY = VRGet( "SW_CdPlayer", "Top" )

        if (CdPlayerPosX <> CdPlayerPosX_old) | (CdPlayerPosY <> CdPlayerPosY_old) then do
            call WriteInitialFile
        end

        CdPlayerPosX_old = CdPlayerPosX
        CdPlayerPosY_old = CdPlayerPosY
    end



    window = VRInfo( "Window" )
    call VRDestroy window
    drop window
return
/*:VRX         SW_CdPlayer_Init
*/
SW_CdPlayer_Init:

    if CdPlayer = "Disabled" then do
        ok = VRset( "SW_CdPlayer",            "BackColor", "Black" )
        ok = VRSet( "IPB_CD_Play",            "BackColor", "Black" )
        ok = VRSet( "IPB_CD_Stop",            "BackColor", "Black" )
        ok = VRSet( "IPB_CD_NextTrack",       "BackColor", "Black" )
        ok = VRSet( "IPB_CD_PrevTrack",       "BackColor", "Black" )
        ok = VRSet( "IPB_CdPlayer_LoadEject", "BackColor", "Black" )
        ok = VRSet( "Pict_Num_10",            "BorderColor", "Black" )
        ok = VRSet( "Pict_Num_01",            "BorderColor", "Black" )
        ok = VRSet( "Pict_TotalNum_10",       "BorderColor", "Black" )
        ok = VRSet( "Pict_TotalNum_01",       "BorderColor", "Black" )

        ok = VRSet( "TM_CdPlayer_Timer", "Caption", "PopCD!" ) /* 特に意味はないが、万一表示された時の対処 */
    end

    call SetCdPlayerDefaultButton

    rc = mciRxSendString("status cda number of tracks wait", "retStr", "0", "0" )
    TrackNumber = retStr

    if TrackNumber > 9 then num10 = left(TrackNumber, 1)
    else                    num10 = 0

    num01 = right(TrackNumber, 1)

    ok = VRSet( "Pict_TotalNum_10", "PicturePath", "#24"num10 )
    ok = VRSet( "Pict_TotalNum_01", "PicturePath", "#24"num01 )

    /* Play Track Number on Popup Menu */
    if TrackNumber <= 40 then MaxTrackNumber = TrackNumber
    else MaxTrackNumber = 40

    do i = 1 to MaxTrackNumber
        ok = VRSet( "PlayTrack"right(i, 2, "0"), "Visible", 1)
    end

    CurrentTrack = 1

    if CdPlayer = "Disabled" then do
        /* Set Volume */
        ok = VRSet( "SL_CdPlayer_Volume", "Percentile", CdPlayerVolume )
        rc = mciRxSendString("set cda audio volume "CdPlayerVolume, "retStr", "0", "0")

        window = VRInfo( "Object" )
        if( \VRIsChildOf( window, "Notebook" ) ) then do
            call VRMethod window, "CenterWindow"

            ok = VRSet( "SW_CdPlayer", "Left", CdPlayerPosX )
            ok = VRSet( "SW_CdPlayer", "Top",  CdPlayerPosY )

            ok = VRSet( "SW_CdPlayer", "Height",  CdPlayerHeightMin )

            if VisibleCdPlayer = "Enabled" then do
                call VRSet window, "Visible", 1
            end
            else do
                call VRSet window, "Visible", 0
            end

            call VRMethod window, "Activate"
        end
        drop window

        CdPlayerVolumeMode = "Disabled"
        ok = VRSet( "IPB_CdPlayerVolume", "PicturePath", "#310" )
    end

    CdPlayer = "Enabled"

    ok = VRMethod( "PB_Dummy", "SetFocus" )

return

/*:VRX         SW_CdPlayer_KeyPress
*/
SW_CdPlayer_KeyPress: 

    keystr = translate(VRGet( "SW_CdPlayer", "KeyString" ))

    select
        when (keystr = "P") | (keystr = "{RIGHT}") then do /* Play */
            call IPB_CD_Play_Click
        end
        when keystr = "N" | (keystr = "{UP}") then do /* Play Next */
            call IPB_CD_NextTrack_Click
        end
        when keystr = "R" | (keystr = "{DOWN}") then do /* Play Previous */
            call IPB_CD_PrevTrack_Click
        end
        when keystr = "S" | (keystr = "{LEFT}") then do /* Stop */
            call IPB_CD_Stop_Click
        end
        when keystr = "E" then do /* Eject */
            call IPB_CdPlayer_LoadEject_Click
        end
        when keystr = "T" then do /* Show/Hide Title Bar */
            call IPB_MinimizeCdPlayer_Click
        end
        when keystr = "V" then do /* Show/Hide Volume */
            call IPB_CdPlayerVolume_Click
        end
        when datatype(keystr, number) = 1 then do /* When number... */

        end

        otherwise
            nop
    end

return

/*:VRX         SW_InternalCdPlayerSetup_Close
*/
SW_InternalCdPlayerSetup_Close:
    call SW_InternalCdPlayerSetup_Fini
return

/*:VRX         SW_InternalCdPlayerSetup_Create
*/
SW_InternalCdPlayerSetup_Create:
    call SW_InternalCdPlayerSetup_Init
return

/*:VRX         SW_InternalCdPlayerSetup_Fini
*/
SW_InternalCdPlayerSetup_Fini:
    window = VRInfo( "Window" )
    call VRDestroy window
    drop window
return
/*:VRX         SW_InternalCdPlayerSetup_Init
*/
SW_InternalCdPlayerSetup_Init:

    /* Setup Parameter */
    /* Visible CD Player */
    if      VisibleCdPlayer = "Enabled"  then do
        ok = VRSet( "CB_VisibleCdPlayer", "Set", 1 )
        ok = VRSet( "CB_CdPlayerAlwaysOnTop", "Enabled", 1 )
    end
    else if VisibleCdPlayer = "Disabled" then do
        ok = VRSet( "CB_VisibleCdPlayer", "Set", 0 )
        ok = VRSet( "CB_CdPlayerAlwaysOnTop", "Enabled", 0 )
    end

    /* CD Player Auto Play */
    if      CdPlayerAutoPlay = "Enabled"  then ok = VRSet( "CB_CdPlayerAutoPlay", "Set", 1 )
    else if CdPlayerAutoPlay = "Disabled" then ok = VRSet( "CB_CdPlayerAutoPlay", "Set", 0 )
/*  ok = VRSet( "SPIN_CdAudioId", "Value", CdAudioDeviceId ) */

    /* CD Player Always on Top */
    if      CdPlayerAlwaysOnTop = "ON"  then ok = VRSet( "CB_CdPlayerAlwaysOnTop", "Set", 1 )
    else if CdPlayerAlwaysOnTop = "OFF" then ok = VRSet( "CB_CdPlayerAlwaysOnTop", "Set", 0 )

    /* Set Font */
    ok = VRSet( "CB_VisibleCdPlayer",           "Font", Font )
    ok = VRSet( "CB_CdPlayerAutoPlay",          "Font", Font )
    ok = VRSet( "CB_CdPlayerAlwaysOnTop",       "Font", Font )
    ok = VRSet( "PB_ExitInternalCdPlayerSetup", "Font", Font )

    window = VRInfo( "Object" )
    if( \VRIsChildOf( window, "Notebook" ) ) then do
        call VRMethod window, "CenterWindow"
        call VRSet window, "Visible", 1
        call VRMethod window, "Activate"
    end
    drop window
return

/*:VRX         SW_Registry_Close
*/
SW_Registry_Close:
    call SW_Registry_Fini
return

/*:VRX         SW_Registry_Create
*/
SW_Registry_Create:
    call SW_Registry_Init
return

/*:VRX         SW_Registry_Fini
*/
SW_Registry_Fini:
    window = VRInfo( "Window" )
    call VRDestroy window
    drop window
return
/*:VRX         SW_Registry_Init
*/
SW_Registry_Init:

    ok = VRSet( "SW_Registry", "Caption", "PopCD! "PopCdVersion )

    anim_cnt = 0

    if Registry = "Registered" then do
        ok = VRSet( "PB_Register", "Visible", 0 )
        ok = VRSet( "PB_NotYet", "Caption", "Return" )

/*
        ok = VRSet( "DT_RegistryType", "BackColor", "(32,178,170)" )
        ok = VRSet( "DT_RegistryType", "ForeColor", "White" )
        ok = VRSet( "DT_RegistryType", "Caption", " Registered " )
        /* DEMO版用 */
        if left(RegisterNumber, 4) = "DEMO" then do
            ok = VRSet( "DT_RegistryType", "Caption", " DEMO " )
        end
*/
        ok = VRSet( "DT_RegistryType", "BackColor", "(065,105,225)" )
        ok = VRSet( "DT_RegistryType", "ForeColor", "White" )
        ok = VRSet( "DT_RegistryType", "Caption", " Freeware " )


        ok = VRSet( "DT_RegistryText",   "Visible", 0 )
        ok = VRSet( "EF_RegistryNumber", "Visible", 0 )

        ok = VRSet( "PB_NotYet",   "Top",    1867 )
        ok = VRSet( "SW_Registry", "Height", 2578 )

        registry_sleep = 1
        ok = VRSet( "TM_Registry", "Enabled", 1 )
        ok = VRSet( "TM_Registry", "Visible", 0 )
    end
    else do
        ok = VRSet( "TM_Registry", "Caption", "Pausing for "registry_sleep" sec." )

        ok = VRSet( "TM_Registry", "Enabled", 1 )
        ok = VRSet( "TM_Registry", "Visible", 1 )

        ok = VRSet( "PB_NotYet",   "Enabled", 0 )

        ok = VRSet( "PB_Register", "Enabled", 0 )
    end

    /* Font */
    ok = VRSet( "DT_3",              "Font", Font )
    ok = VRSet( "GB_1",              "Font", Font )
    ok = VRSet( "DT_5",              "Font", Font )
    ok = VRSet( "EF_EMailAddress",   "Font", Font )
    ok = VRSet( "DT_6",              "Font", Font )
    ok = VRSet( "EF_url",            "Font", Font )
    ok = VRSet( "DT_RegistryText",   "Font", Font )
    ok = VRSet( "EF_RegistryNumber", "Font", Font )
    ok = VRSet( "PB_Register",       "Font", Font )
    ok = VRSet( "PB_NotYet",         "Font", Font )



    window = VRInfo( "Object" )
    if( \VRIsChildOf( window, "Notebook" ) ) then do
        call VRMethod window, "CenterWindow"
        call VRSet window, "Visible", 1
        call VRMethod window, "Activate"
    end
    drop window
return

/*:VRX         SW_SetupAutoPosition_Close
*/
SW_SetupAutoPosition_Close:
    call SW_SetupAutoPosition_Fini
return

/*:VRX         SW_SetupAutoPosition_Create
*/
SW_SetupAutoPosition_Create:
    call SW_SetupAutoPosition_Init
return

/*:VRX         SW_SetupAutoPosition_Fini
*/
SW_SetupAutoPosition_Fini:
    window = VRInfo( "Window" )
    call VRDestroy window
    drop window
return
/*:VRX         SW_SetupAutoPosition_Init
*/
SW_SetupAutoPosition_Init:

    /* Set Value */
    ok = VRSet( "EF_IconPosition_StartPointX", "Value", IconPositionStartPointX )
    ok = VRSet( "EF_IconPosition_StartPointY", "Value", IconPositionStartPointY )
    ok = VRSet( "EF_IconPosition_Rows",        "Value", IconPositionRows )
    ok = VRSet( "EF_IconPosition_IntervalsX",  "Value", IconPositionIntervalsX )
    ok = VRSet( "EF_IconPosition_IntervalsY",  "Value", IconPositionIntervalsY )

    /* Set Font */
    ok = VRSet( "DT_2", "Font", Font )
    ok = VRSet( "EF_IconPosition_StartPointX", "Font", Font )
    ok = VRSet( "DT_4", "Font", Font )
    ok = VRSet( "EF_IconPosition_StartPointY", "Font", Font )
    ok = VRSet( "DT_7", "Font", Font )
    ok = VRSet( "EF_IconPosition_Rows",        "Font", Font )
    ok = VRSet( "DT_8", "Font", Font )
    ok = VRSet( "EF_IconPosition_IntervalsX",  "Font", Font )
    ok = VRSet( "DT_9", "Font", Font )
    ok = VRSet( "EF_IconPosition_IntervalsY",  "Font", Font )
    ok = VRSet( "PB_ExitSetAutoPosition",      "Font", Font )
    ok = VRSet( "PB_ApplyIconPosition",        "Font", Font )

    ok = VRSet( "SW_SetupAutoPosition", "Caption", "PopCD!" )


    window = VRInfo( "Object" )
    if( \VRIsChildOf( window, "Notebook" ) ) then do
        call VRMethod window, "CenterWindow"
        call VRSet window, "Visible", 1
        call VRMethod window, "Activate"
    end
    drop window
return

/*:VRX         SW_SetUpViewParametersWindow_Close
*/
SW_SetUpViewParametersWindow_Close:
    call SW_SetUpViewParametersWindow_Fini
return

/*:VRX         SW_SetUpViewParametersWindow_Create
*/
SW_SetUpViewParametersWindow_Create:
    call SW_SetUpViewParametersWindow_Init
return

/*:VRX         SW_SetUpViewParametersWindow_Fini
*/
SW_SetUpViewParametersWindow_Fini:
    window = VRInfo( "Window" )
    call VRDestroy window
    drop window
return
/*:VRX         SW_SetUpViewParametersWindow_Init
*/
SW_SetUpViewParametersWindow_Init:

    call SetUpViewParametersWindowData

    call SetUpViewParametersWindowFont

    window = VRInfo( "Object" )
    if( \VRIsChildOf( window, "Notebook" ) ) then do
        call VRMethod window, "CenterWindow"

        ok = VRSet( "SW_SetUpViewParametersWindow", "Left", SetUpViewParametersWindowPosX )
        ok = VRSet( "SW_SetUpViewParametersWindow", "Top",  SetUpViewParametersWindowPosY )

        call VRSet window, "Visible", 1
        call VRMethod window, "Activate"
    end
    drop window
return

/*:VRX         TM_CdPlayer_Timer_Trigger
*/
TM_CdPlayer_Timer_Trigger:

    rc = mciRxSendString("status cda mode wait", "retStr", "0", "0")

    if retStr = "stopped" then do
        /* Buttons */
        ok = VRSet( "IPB_CD_Play", "PicturePath", "#200" )
        ok = VRSet( "IPB_CD_Play", "Enabled", 1 )

        ok = VRSet( "IPB_CD_Stop", "PicturePath", "#215" )
        ok = VRSet( "IPB_CD_Stop", "Enabled", 0 )
/*
        if TruckNumber > 1 then do
            ok = VRSet( "IPB_CD_NextTrack", "PicturePath", "#220" )
            ok = VRSet( "IPB_CD_NextTrack", "Enabled", 1 )
        end
        else if TrackNumber = 1 then do
            ok = VRSet( "IPB_CD_NextTrack", "PicturePath", "#225" )
            ok = VRSet( "IPB_CD_NextTrack", "Enabled", 0 )
        end
*/
        /* 2.18 beta 3, 18.Sep.1999 */
        CurrentTrack = 1
        ok = VRSet( "Menu_PlayNext",     "Enabled", 1 )
        ok = VRSet( "IPB_CD_NextTrack", "PicturePath", "#220" )
        ok = VRSet( "IPB_CD_NextTrack", "Enabled", 1 )

        ok = VRSet( "IPB_CD_PrevTrack", "PicturePath", "#235" )
        ok = VRSet( "IPB_CD_PrevTrack", "Enabled", 0 )

        /* Numbers */
        ok = VRSet( "Pict_Num_10", "PicturePath", "#240" )
        ok = VRSet( "Pict_Num_01", "PicturePath", "#241" )

        rc = mciRxSendString("seek cda to start wait", "retStr", "0", "0")

        ok = VRSet( "TM_CdPlayer_Timer", "Enabled", 0 )
    end
    else do
        if CdAudioStatus = "Enabled" then do
            /* Check & Set Current Track Number */
            rc = mciRxSendString("status cda current track wait", "retStr", "0", "0")

            if retStr <> CurrentTrack then do
                CurrentTrack = retStr

                if CurrentTrack > 9 then num10 = left(CurrentTrack, 1)
                else                     num10 = 0

                num01 = right(CurrentTrack, 1)

                ok = VRSet( "Pict_Num_10", "PicturePath", "#24"num10 )
                ok = VRSet( "Pict_Num_01", "PicturePath", "#24"num01 )
            end
        end
        else do
            ok = VRSet( "Pict_Num_10", "PicturePath", "" )
            ok = VRSet( "Pict_Num_01", "PicturePath", "" )
        end
    end

return

/*:VRX         TM_PopCdTrigger_Trigger
*/
TM_PopCdTrigger_Trigger:

    /* 他のREXX ProgramでSysDropFuncsが実行されたときに再度Loadする */
    rc = rxfuncadd( "sysloadfuncs", "rexxutil", "sysloadfuncs")
    if rc <> 1 then rc = sysloadfuncs()

    cdid = c2d(left(AudioCdDrive, 1)) - c2d("A")

    /* a.CD-ROM */
    call PopCdTriggerCdRom

    /* b.Audio CD */
    if AudioCd = "Enabled" then do
        call PopCdTriggerAudioCd
    end

    /* c. Removable Media */
    if OtherRemovableMedia = "Enabled" then do
        call PopCdTriggerRemovableMedia
    end

    /* CD Player Always on Top */
    if (VisibleCdPlayer = "Enabled") & (CdPlayer = "Enabled") & (CdPlayerAlwaysOnTop = "ON") then do
        ok = VRSet( "SW_CdPlayer", "SiblingOrder", 1)
        ok = VRSet( "SW_CdPlayer", "Visible", 1)
    end

    /* Parameterに変更があったときにinitial fileをsaveする */
    if Parameters = "Changed" then do
        call WriteInitialFile

        Parameters = "Not Changed"
    end

return

/*:VRX         TM_Registry_Trigger
*/
TM_Registry_Trigger:

    registry_sleep = registry_sleep - 1

    select
        when registry_sleep = 0 then do
            ok = VRSet( "TM_Registry", "Visible", 0 )
            ok = VRSet( "PB_NotYet", "Enabled", 1 )
        end
        otherwise do
            ok = VRSet( "TM_Registry", "Caption", "Pausing for "registry_sleep" sec." )
        end
    end

    anim_cnt = anim_cnt + 1
    if anim_cnt = 1 then do
        ok = VRSet( "Pict_1", "PicturePath", "#150" )
    end
    if anim_cnt = 2 then do
        ok = VRSet( "Pict_1", "PicturePath", "#152" )
    end
    if anim_cnt = 3 then do
        ok = VRSet( "Pict_1", "PicturePath", "#150" )
    end
    if anim_cnt = 4 then do
        ok = VRSet( "Pict_1", "PicturePath", "#152" )
    end
    if anim_cnt = 5 then do
        ok = VRSet( "Pict_1", "PicturePath", "#150" )
    end
    if anim_cnt = 6 then do
        ok = VRSet( "Pict_1", "PicturePath", "#152" )
    end
    if anim_cnt = 7 then do
        ok = VRSet( "Pict_1", "PicturePath", "#156" )
    end
    if anim_cnt = 8 then do
        ok = VRSet( "Pict_1", "PicturePath", "#150" )
    end
    if anim_cnt = 9 then do
        ok = VRSet( "Pict_1", "PicturePath", "#152" )
    end
    if anim_cnt = 10 then do
        ok = VRSet( "Pict_1", "PicturePath", "#154" )

        anim_cnt = 0
    end


return

/*:VRX         Window1_Close
*/
Window1_Close:
    call Quit
return

/*:VRX         WriteInitialFile
*/
WriteInitialFile:

    PosX = VRGet( "Window1", "Left" )
    PosY = VRGet( "Window1", "Top" )
    if CdPlayer = "Enabled" then do
        CdPlayerPosX = VRGet( "SW_CdPlayer", "Left" )
        CdPlayerPosY = VRGet( "SW_CdPlayer", "Top" )
    end
    if CdPlayerTitleBar = "Enabled" then do
        CdPlayerPosY = CdPlayerPosY + (CdPlayerHeightMax - CdPlayerHeightMin)
    end

    out_file = "PopCd.ini"

    rc = SysFileDelete(out_file)

    call lineout out_file, ";", 1
    call lineout out_file, "; PopCd.ini - PopCD! Initial File ("PopCdVersion")"
    call lineout out_file, ";"
    call lineout out_file, "PosX="PosX
    call lineout out_file, "PosY="PosY
    call lineout out_file, "CdPlayerPosX="CdPlayerPosX
    call lineout out_file, "CdPlayerPosY="CdPlayerPosY
    call lineout out_file, "SetUpViewParametersWindowPosX="SetUpViewParametersWindowPosX
    call lineout out_file, "SetUpViewParametersWindowPosY="SetUpViewParametersWindowPosY

    PopCdObjectsList = "(NONE)"
    do i = 3 to 25
        if PopCdObject.i.STATUS = "MOUNT" then do
            PopCdObjectsList = PopCdObjectsList";"PopCdObject.i.CDOBJECTID
        end
    end
    if PopCdObjectsList <> "(NONE)" then do
        PopCdObjectsList = right(PopCdObjectsList, length(PopCdObjectsList) - length("(NONE);"))
    end
    call lineout out_file, "PopCdObjectsList="PopCdObjectsList";"PopCdAudioObject

    /* CD-ROM */
    call lineout out_file, "UseVolumeLabel="UseVolumeLabel
    call lineout out_file, "DefaultDriveCaption="DefaultDriveCaption
    call lineout out_file, "OpenFolder="OpenFolder
    call lineout out_file, "ViewMode="ViewMode
    call lineout out_file, "CdRomDefaultView="CdRomDefaultView
    call lineout out_file, "LastDrive="LastDrive
    call lineout out_file, "IgnoreDrivesList="IgnoreDrivesList

/* AutoRun機能はちょっと中断 */
/*
    call lineout out_file, "AutoRun="AutoRun

    AutoRunList = ""
    if AutoRunItem.0 > 0 then do
        AutoRunList = AutoRunItem.1.AUTORUN_VOLUMEKEYWORD","AutoRunItem.1.AUTORUN_EXENAME
        do i = 2 to AutoRunItem.0
            AutoRunList = AutoRunList";"AutoRunItem.i.AUTORUN_VOLUMEKEYWORD","AutoRunItem.i.AUTORUN_EXENAME
        end
    end
    call lineout out_file, "AutoRunList="AutoRunList
*/

    /* Other Removable Medias */
    call lineout out_file, "OtherRemovableMedia="OtherRemovableMedia
    call lineout out_file, "OtherRemovableMediaList="OtherRemovableMediaList

    /* CD-ROM Folder Parameters */
    call lineout out_file, "DETAILSVIEW="pDETAILSVIEW
    call lineout out_file, "ICONVIEW="pICONVIEW
    call lineout out_file, "TREEVIEW="pTREEVIEW
    /*
    call lineout out_file, "BACKGROUND="pBACKGROUND
    call lineout out_file, "MINWIN="pMINWIN
    call lineout out_file, "CCVIEW="pCCVIEW
    call lineout out_file, "HIDEBUTTON="pHIDEBUTTON
    */

    /* Audio CD */
/*  call lineout out_file, "AudioCdDrive="AudioCdDrive */
    call lineout out_file, "AudioCd="AudioCd
    call lineout out_file, "CdAudioDeviceId="CdAudioDeviceId
    call lineout out_file, "CdPlayerMode="CdPlayerMode
    call lineout out_file, "VisibleCdPlayer="VisibleCdPlayer
    call lineout out_file, "CdPlayerAutoPlay="CdPlayerAutoPlay
    call lineout out_file, "CdPlayerVolume="CdPlayerVolume
    call lineout out_file, "CdPlayerAlwaysOnTop="CdPlayerAlwaysOnTop
    call lineout out_file, "ExternalCdPlayer="ExternalCdPlayer

    /* Positioning */
    call lineout out_file, "IconPositioning="IconPositioning
    call lineout out_file, "IconPositionStartPointX="IconPositionStartPointX
    call lineout out_file, "IconPositionStartPointY="IconPositionStartPointY
    call lineout out_file, "IconPositionRows="IconPositionRows
    call lineout out_file, "IconPositionIntervalsX="IconPositionIntervalsX
    call lineout out_file, "IconPositionIntervalsY="IconPositionIntervalsY

    /* Common, etc */
    call lineout out_file, "PopCdTrigger="PopCdTrigger
    call lineout out_file, "MinimizedStartup="MinimizedStartup
    call lineout out_file, "Font="Font
    call lineout out_file, "Delay="Delay

/*
    call lineout out_file, "RegisterNumber="RegisterNumber
*/
    call lineout out_file

    /* for save parameters in initial file */
    Parameters = "Saved"

return

