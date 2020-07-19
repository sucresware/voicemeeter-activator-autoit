#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=icon.ico
#AutoIt3Wrapper_Outfile_x64=build\VoiceMeeterPotatoActivator_x64.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_CompanyName=SucresWare
#AutoIt3Wrapper_Res_Language=1033
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <Sound.au3>

DirCreate(@TempDir & "\VMPA")
FileInstall("music.wav", @TempDir & "\VMPA\")

GUICreate("VoiceMeeter Potato 3.0.1.3", 300, 160)
GUISetBkColor(0x2C3D4D)

GUICtrlCreateLabel("", 0, 0, 300, 80)
GUICtrlSetBkColor(-1, 0x36495A)

GUICtrlCreateLabel("VoiceMeeter Potato 3.0.1.3", 0, 20, 300, 20, $SS_CENTER)
GUICtrlSetBkColor(-1, 0x36495A)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont (-1, 9, 800)

GUICtrlCreateLabel("Activator by SucresWare", 0, 40, 300, 20, $SS_CENTER)
GUICtrlSetBkColor(-1, 0x36495A)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont (-1, 9, 800)

$statusInpt = GUICtrlCreateInput("[Waiting]", 10, 90, 280, 20, $SS_CENTER)
$crackBtn = GUICtrlCreateButton("Activate", 10, 120, 135, 25)
$exitBtn = GUICtrlCreateButton("Close", 155, 120, 135, 25)

GUISetState(@SW_SHOW)

$music = _SoundOpen(@TempDir & "\VMPA\music.wav")

While 1
	$guiMsg = GUIGetMsg()

	Select
		Case $guiMsg = $GUI_EVENT_CLOSE Or $guiMsg = $exitBtn
			GUICtrlSetData($statusInpt, "[Exit] Goodbye !")
			Sleep(1000)

			GUIDelete()
			Exit

		Case $guiMsg = $crackBtn
			GUICtrlSetData($statusInpt, "[Working] Closing VoiceMeeter...")
			ProcessClose("voicemeeter8.exe")
			GUICtrlSetData($statusInpt, "[Working] Activating VoiceMeeter...")
			RegWrite("HKEY_CURRENT_USER\VB-Audio\VoiceMeeter", "code", "REG_DWORD", 0x00123456)

			GUICtrlSetData($statusInpt, "[Success] VoiceMeeter is now activated.")
	EndSelect

	If _SoundStatus($music) = "stopped" Then
		_SoundPlay($music)
	EndIf

	Sleep(1)
WEnd
