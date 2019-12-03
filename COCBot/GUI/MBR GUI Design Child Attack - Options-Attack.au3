; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file creates the "Attack" tab under the "Options" tab under the "Search & Attack" tab under the "Attack Plan" tab
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......: CodeSlinger69 (2017), MonkeyHunter (03-2017)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2019
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include-once

; Hero abilities
Global $g_hRadAutoQueenAbility = 0, $g_hRadAutoKingAbility = 0, $g_hRadAutoWardenAbility = 0
Global $g_hRadManQueenAbility = 0, $g_hRadManKingAbility = 0, $g_hRadManWardenAbility = 0
Global $g_hTxtManQueenAbility = 0, $g_hTxtManKingAbility = 0, $g_hTxtManWardenAbility = 0
Global $g_hRadBothQueenAbility = 0, $g_hRadBothKingAbility = 0, $g_hRadBothWardenAbility = 0

Global $g_hRadAutoAbilities = 0, $g_hRadManAbilities = 0, $g_hTxtManAbilities = 0, $g_hChkUseWardenAbility = 0, $g_hTxtWardenAbility = 0

; Attack schedule
Global $g_hChkAttackPlannerEnable = 0, $g_hChkAttackPlannerCloseCoC = 0, $g_hChkAttackPlannerCloseAll = 0, $g_hChkAttackPlannerSuspendComputer = 0, $g_hChkAttackPlannerRandom = 0, _
	   $g_hCmbAttackPlannerRandom = 0, $g_hChkAttackPlannerDayLimit = 0, $g_hCmbAttackPlannerDayMin = 0, $g_hCmbAttackPlannerDayMax = 0
Global $g_ahChkAttackWeekdays[7] = [0, 0, 0, 0, 0, 0, 0], $g_ahChkAttackHours[24] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

Global $g_hLbAttackPlannerRandom = 0, $g_hLbAttackPlannerDayLimit = 0, $g_ahChkAttackWeekdaysE = 0, $g_ahChkAttackHoursE1 = 0, $g_ahChkAttackHoursE2 = 0

; Clan castle
Global $g_hChkDropCCHoursEnable = 0, $g_ahChkDropCCHours[24] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
GLobal $g_hLblDropCChour = 0, $g_ahLblDropCChoursE = 0
GLobal $g_hLblDropCChours[12] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $g_ahChkDropCCHoursE1 = 0, $g_ahChkDropCCHoursE2 = 0

Func CreateAttackSearchOptionsAttack()

	Local $sTxtTip = ""
	Local $x = 25, $y = 45
	GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "Group_01", "Hero Abilities"), $x - 20, $y - 20, $g_iSizeWGrpTab4, 95)
	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnQueen, $x, $y, 22, 22)
	GUIStartGroup()
	$x += 30
		$g_hRadAutoQueenAbility = GUICtrlCreateRadio(GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "RadAutoAbilities", "Auto activate (red zone)"), $x, $y, -1, -1)
			$sTxtTip = GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "RadAutoAbilities_Info_01", "Activate the Ability when the Hero becomes weak.") & @CRLF & _
					   GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "RadAutoAbilities_Info_02", "Heroes are checked and activated individually.")
			_GUICtrlSetTip(-1, $sTxtTip)
			GUICtrlSetState(-1, $GUI_CHECKED)
	$x += 145
		$g_hRadManQueenAbility = GUICtrlCreateRadio(GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "RadManAbilities", "Timed after") & ":", $x , $y , -1, -1)
			$sTxtTip = GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "RadManAbilities_Info_01", "Activate the Ability on a timer.") & @CRLF & _
					   GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "RadManAbilities_Info_02", "All Heroes are activated at the same time.")
			_GUICtrlSetTip(-1, $sTxtTip)
			GUICtrlSetState(-1, $GUI_UNCHECKED)

		$g_hTxtManQueenAbility = GUICtrlCreateInput("9", $x + 80, $y + 3, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$sTxtTip = GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "TxtManAbilities_Info_01", "Set the time in seconds for Timed Activation of Hero Abilities.")
			_GUICtrlSetTip(-1, $sTxtTip)
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetBkColor(-1, 0xD1DFE7)
		GUICtrlCreateLabel(GetTranslatedFileIni("MBR Global GUI Design", "sec.", -1), $x + 115, $y + 4, -1, -1)
	$x += 145
		$g_hRadBothQueenAbility = GUICtrlCreateRadio(GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "RadBothAbilities_Info_01", "Check Both"), $x, $y, -1, -1)
			$sTxtTip = GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "RadBothAbilities_Info_02", "Activate the Ability when Hero becomes weak or when timer runs out")
			_GUICtrlSetTip(-1, $sTxtTip)
			GUICtrlSetState(-1, $GUI_UNCHECKED)

	Local $x = 25, $y = 69
	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnKing, $x, $y, 22, 22)
	GUIStartGroup()
	$x += 30
		$g_hRadAutoKingAbility = GUICtrlCreateRadio(GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "RadAutoAbilities", "Auto activate (red zone)"), $x, $y, -1, -1)
			$sTxtTip = GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "RadAutoAbilities_Info_01", "Activate the Ability when the Hero becomes weak.") & @CRLF & _
					   GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "RadAutoAbilities_Info_02", "Heroes are checked and activated individually.")
			_GUICtrlSetTip(-1, $sTxtTip)
			GUICtrlSetState(-1, $GUI_CHECKED)
	$x += 145
		$g_hRadManKingAbility = GUICtrlCreateRadio(GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "RadManAbilities", "Timed after") & ":", $x , $y , -1, -1)
			$sTxtTip = GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "RadManAbilities_Info_01", "Activate the Ability on a timer.") & @CRLF & _
					   GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "RadManAbilities_Info_02", "All Heroes are activated at the same time.")
			_GUICtrlSetTip(-1, $sTxtTip)
			GUICtrlSetState(-1, $GUI_UNCHECKED)

		$g_hTxtManKingAbility = GUICtrlCreateInput("9", $x + 80, $y + 3, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$sTxtTip = GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "TxtManAbilities_Info_01", "Set the time in seconds for Timed Activation of Hero Abilities.")
			_GUICtrlSetTip(-1, $sTxtTip)
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetBkColor(-1, 0xD1DFE7)
		GUICtrlCreateLabel(GetTranslatedFileIni("MBR Global GUI Design", "sec.", -1), $x + 115, $y + 4, -1, -1)

	$x += 145
		$g_hRadBothKingAbility = GUICtrlCreateRadio(GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "RadBothAbilities_Info_01", "Check Both"), $x, $y, -1, -1)
			$sTxtTip = GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "RadBothAbilities_Info_02", "Activate the Ability when Hero becomes weak or when timer runs out")
			_GUICtrlSetTip(-1, $sTxtTip)
			GUICtrlSetState(-1, $GUI_UNCHECKED)

	Local $x = 25, $y = 95
	_GUICtrlCreateIcon($g_sLibIconPath, $eIcnWarden, $x, $y , 22, 22)
	GUIStartGroup()
	$x += 30
		$g_hRadAutoWardenAbility = GUICtrlCreateRadio(GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "RadAutoAbilities", "Auto activate (red zone)"), $x, $y, -1, -1)
			$sTxtTip = GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "RadAutoAbilities_Info_01", "Activate the Ability when the Hero becomes weak.") & @CRLF & _
					   GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "RadAutoAbilities_Info_02", "Heroes are checked and activated individually.")
			_GUICtrlSetTip(-1, $sTxtTip)
			GUICtrlSetState(-1, $GUI_CHECKED)
	$x += 145
		$g_hRadManWardenAbility = GUICtrlCreateRadio(GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "RadManAbilities", "Timed after") & ":", $x , $y , -1, -1)
			$sTxtTip = GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "RadManAbilities_Info_01", "Activate the Ability on a timer.") & @CRLF & _
					   GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "RadManAbilities_Info_02", "All Heroes are activated at the same time.")
			_GUICtrlSetTip(-1, $sTxtTip)
			GUICtrlSetState(-1, $GUI_UNCHECKED)

		$g_hTxtManWardenAbility = GUICtrlCreateInput("9", $x + 80, $y + 3, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$sTxtTip = GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "TxtManAbilities_Info_01", "Set the time in seconds for Timed Activation of Hero Abilities.")
			_GUICtrlSetTip(-1, $sTxtTip)
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetBkColor(-1, 0xD1DFE7)
		GUICtrlCreateLabel(GetTranslatedFileIni("MBR Global GUI Design", "sec.", -1), $x + 115, $y + 4, -1, -1)

	$x += 145
		$g_hRadBothWardenAbility = GUICtrlCreateRadio(GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "RadBothAbilities_Info_01", "Check Both"), $x, $y, -1, -1)
			$sTxtTip = GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "RadBothAbilities_Info_02", "Activate the Ability when Hero becomes weak or when timer runs out")
			_GUICtrlSetTip(-1, $sTxtTip)
			GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 25, $y = 145
	GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "Group_02", "Attack Schedule"), $x - 20, $y - 20, $g_iSizeWGrpTab4, 138)
	$x -= 5
		$g_hChkAttackPlannerEnable = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "ChkAttackPlannerEnable", "Enable Schedule"), $x, $y - 4, -1, -1)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "ChkAttackPlannerEnable_Info_01", "This option will allow you to schedule attack times") & @CRLF & _
							   GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "ChkAttackPlannerEnable_Info_02", "Bot continues to run and will attack only when schedule allows"))
			GUICtrlSetOnEvent(-1, "chkAttackPlannerEnable")
		$g_hChkAttackPlannerCloseCoC = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "ChkAttackPlannerCloseCoC", "Close CoC"), $x, $y + 15, -1, -1)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "ChkAttackPlannerCloseCoC_Info_01", "This option will close CoC app when not scheduled to Search & Attack!") & @CRLF & _
							   GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "ChkAttackPlanner_Info_01", "Bot Continues to run and will restart when schedule allows"))
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "chkAttackPlannerCloseCoC")
		$g_hChkAttackPlannerCloseAll = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "ChkAttackPlannerCloseAll", "Close emulator"), $x, $y + 34, -1, -1)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "ChkAttackPlannerCloseAll_Info_01", "This option will close emulator when not scheduled to Search & Attack!") & @CRLF & _
							   GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "ChkAttackPlanner_Info_01",-1))
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "chkAttackPlannerCloseAll")
		$g_hChkAttackPlannerSuspendComputer = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "ChkAttackPlannerSuspendComputer", "Suspend Computer"), $x, $y + 53, -1, -1)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "ChkAttackPlannerSuspendComputer_Info_01", "This option will suspend computer when not scheduled to Search & Attack!") & @CRLF & _
							   GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "ChkAttackPlanner_Info_01",-1))
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "chkAttackPlannerSuspendComputer")
		$g_hChkAttackPlannerRandom = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "ChkAttackPlannerRandom", "Random Disable"), $x, $y + 72, -1, -1)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "ChkAttackPlannerRandom_Info_01", "This option will randomly stop attacking") & @CRLF & _
							   GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "ChkAttackPlanner_Info_01",-1))
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "chkAttackPlannerRandom")
		$g_hCmbAttackPlannerRandom = GUICtrlCreateCombo("", $x + 110, $y + 70, 37, 16, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "ChkAttackPlannerRandom_Info_02", "Select number of hours to stop attacking"))
			GUICtrlSetData(-1, "1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20", "4")
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "cmbAttackPlannerRandom")
		$g_hLbAttackPlannerRandom = GUICtrlCreateLabel(GetTranslatedFileIni("MBR Global GUI Design", "hrs", "hrs"), $x + 148, $y + 74, -1,-1)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$g_hChkAttackPlannerDayLimit = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "ChkAttackPlannerDayLimit", "Daily Limit"), $x, $y + 92, -1, -1)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "ChkAttackPlannerDayLimit_Info_01", "Will randomly stop attacking when exceed random number of attacks between range selected") & @CRLF & _
							   GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "ChkAttackPlanner_Info_01",-1))
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetOnEvent(-1, "chkAttackPlannerDayLimit")
		$g_hCmbAttackPlannerDayMin = GUICtrlCreateInput("12", $x + 110, $y + 94, 37, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "TxtMinLbAttackPlannerDayLimit_Info_01", "Enter minimum number of attacks allowed per day"))
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetOnEvent(-1, "cmbAttackPlannerDayMin")
		$g_hLbAttackPlannerDayLimit = GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "LbAttackPlannerDayLimit", "To"), $x + 152, $y + 96, -1, -1)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$g_hCmbAttackPlannerDayMax = GUICtrlCreateInput("15", $x + 167, $y + 94, 37, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "TxtMaxLbAttackPlannerDayLimit_Info_01", "Enter maximum number of attacks allowed per day"))
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetOnEvent(-1, "cmbAttackPlannerDayMax")

	$x += 198
	$y -= 5
		GUICtrlCreateLabel(GetTranslatedFileIni("MBR Global GUI Design", "Day", -1) & ":", $x, $y, -1, 15)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR Global GUI Design", "Only_during_day", -1))
		GUICtrlCreateLabel(GetTranslatedFileIni("MBR Global GUI Design", "Su", -1), $x + 30, $y, -1, 15)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR Global GUI Design", "Sunday", -1))
		GUICtrlCreateLabel(GetTranslatedFileIni("MBR Global GUI Design", "Mo", -1), $x + 46, $y, -1, 15)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR Global GUI Design", "Monday", -1))
		GUICtrlCreateLabel(GetTranslatedFileIni("MBR Global GUI Design", "Tu", -1), $x + 63, $y, -1, 15)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR Global GUI Design", "Tuesday", -1))
		GUICtrlCreateLabel(GetTranslatedFileIni("MBR Global GUI Design", "We", -1), $x + 79, $y, -1, 15)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR Global GUI Design", "Wednesday", -1))
		GUICtrlCreateLabel(GetTranslatedFileIni("MBR Global GUI Design", "Th", -1), $x + 99, $y, -1, 15)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR Global GUI Design", "Thursday", -1))
		GUICtrlCreateLabel(GetTranslatedFileIni("MBR Global GUI Design", "Fr", -1), $x + 117, $y, -1, 15)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR Global GUI Design", "Friday", -1))
		GUICtrlCreateLabel(GetTranslatedFileIni("MBR Global GUI Design", "Sa", -1), $x + 133, $y, -1, 15)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR Global GUI Design", "Saturday", -1))
		GUICtrlCreateLabel("X", $x + 155, $y+1, -1, 15)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR Global GUI Design", "Clear_set_row_of_boxes", -1))

	$y += 13
		$g_ahChkAttackWeekdays[0] = GUICtrlCreateCheckbox("", $x + 30, $y, 16, 16)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR Global GUI Design", "Only_during_day", -1))
		$g_ahChkAttackWeekdays[1] = GUICtrlCreateCheckbox("", $x + 47, $y, 16, 16)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR Global GUI Design", "Only_during_day", -1))
		$g_ahChkAttackWeekdays[2] = GUICtrlCreateCheckbox("", $x + 64, $y, 16, 16)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR Global GUI Design", "Only_during_day", -1))
		$g_ahChkAttackWeekdays[3] = GUICtrlCreateCheckbox("", $x + 81, $y, 16, 16)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR Global GUI Design", "Only_during_day", -1))
		$g_ahChkAttackWeekdays[4] = GUICtrlCreateCheckbox("", $x + 99, $y, 16, 16)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR Global GUI Design", "Only_during_day", -1))
		$g_ahChkAttackWeekdays[5] = GUICtrlCreateCheckbox("", $x + 117, $y, 16, 16)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR Global GUI Design", "Only_during_day", -1))
		$g_ahChkAttackWeekdays[6] = GUICtrlCreateCheckbox("", $x + 133, $y, 16, 16)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR Global GUI Design", "Only_during_day", -1))
		$g_ahChkAttackWeekdaysE = GUICtrlCreateCheckbox("", $x + 151, $y, 15, 15, BitOR($BS_PUSHLIKE, $BS_ICON))
			_GUICtrlSetImage(-1, $g_sLibIconPath, $eIcnGoldStar, 0)
			GUICtrlSetState(-1, $GUI_UNCHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR Global GUI Design", "Clear_set_row_of_boxes", -1))
			GUICtrlSetOnEvent(-1, "chkattackWeekDaysE")

	$x -= 25
	$y += 17
		GUICtrlCreateLabel(GetTranslatedFileIni("MBR Global GUI Design", "Hour", "Hour") & ":", $x, $y, -1, 15)
			$sTxtTip = GetTranslatedFileIni("MBR Global GUI Design", "Only_during_hours", "Only during these hours of each day")
			_GUICtrlSetTip(-1, $sTxtTip)
		GUICtrlCreateLabel(" 0", $x + 30, $y, 13, 15)
			_GUICtrlSetTip(-1, $sTxtTip)
		GUICtrlCreateLabel(" 1", $x + 45, $y, 13, 15)
			_GUICtrlSetTip(-1, $sTxtTip)
		GUICtrlCreateLabel(" 2", $x + 60, $y, 13, 15)
			_GUICtrlSetTip(-1, $sTxtTip)
		GUICtrlCreateLabel(" 3", $x + 75, $y, 13, 15)
			_GUICtrlSetTip(-1, $sTxtTip)
		GUICtrlCreateLabel(" 4", $x + 90, $y, 13, 15)
			_GUICtrlSetTip(-1, $sTxtTip)
		GUICtrlCreateLabel(" 5", $x + 105, $y, 13, 15)
			_GUICtrlSetTip(-1, $sTxtTip)
		GUICtrlCreateLabel(" 6", $x + 120, $y, 13, 15)
			_GUICtrlSetTip(-1, $sTxtTip)
		GUICtrlCreateLabel(" 7", $x + 135, $y, 13, 15)
			_GUICtrlSetTip(-1, $sTxtTip)
		GUICtrlCreateLabel(" 8", $x + 150, $y, 13, 15)
			_GUICtrlSetTip(-1, $sTxtTip)
		GUICtrlCreateLabel(" 9", $x + 165, $y, 13, 15)
			_GUICtrlSetTip(-1, $sTxtTip)
		GUICtrlCreateLabel("10", $x + 180, $y, 13, 15)
			_GUICtrlSetTip(-1, $sTxtTip)
		GUICtrlCreateLabel("11", $x + 195, $y, 13, 15)
			_GUICtrlSetTip(-1, $sTxtTip)
		GUICtrlCreateLabel("X", $x + 214, $y + 1, 11, 11)
			_GUICtrlSetTip(-1, $sTxtTip)

	$y += 15
		$g_ahChkAttackHours[0] = GUICtrlCreateCheckbox("", $x + 30, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkAttackHours[1] = GUICtrlCreateCheckbox("", $x + 45, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkAttackHours[2] = GUICtrlCreateCheckbox("", $x + 60, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkAttackHours[3] = GUICtrlCreateCheckbox("", $x + 75, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkAttackHours[4] = GUICtrlCreateCheckbox("", $x + 90, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkAttackHours[5] = GUICtrlCreateCheckbox("", $x + 105, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkAttackHours[6] = GUICtrlCreateCheckbox("", $x + 120, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkAttackHours[7] = GUICtrlCreateCheckbox("", $x + 135, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkAttackHours[8] = GUICtrlCreateCheckbox("", $x + 150, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkAttackHours[9] = GUICtrlCreateCheckbox("", $x + 165, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkAttackHours[10] = GUICtrlCreateCheckbox("", $x + 180, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkAttackHours[11] = GUICtrlCreateCheckbox("", $x + 195, $y, 15, 15)
		   GUICtrlSetState(-1, $GUI_CHECKED)
		   GUICtrlSetState(-1, $GUI_DISABLE)
		$g_ahChkAttackHoursE1 = GUICtrlCreateCheckbox("", $x + 211, $y + 1, 13, 13, BitOR($BS_PUSHLIKE, $BS_ICON))
		   _GUICtrlSetImage(-1, $g_sLibIconPath, $eIcnGoldStar, 0)
		   GUICtrlSetState(-1, $GUI_UNCHECKED)
		   GUICtrlSetState(-1, $GUI_DISABLE)
		   _GUICtrlSetTip(-1, GetTranslatedFileIni("MBR Global GUI Design", "Clear_set_row_of_boxes", -1))
		   GUICtrlSetOnEvent(-1, "chkattackHoursE1")
		GUICtrlCreateLabel(GetTranslatedFileIni("MBR Global GUI Design", "AM", "AM"), $x + 10, $y)

	$y += 15
		$sTxtTip = GetTranslatedFileIni("MBR Global GUI Design", "Only_during_hours", -1)
		$g_ahChkAttackHours[12] = GUICtrlCreateCheckbox("", $x + 30, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkAttackHours[13] = GUICtrlCreateCheckbox("", $x + 45, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkAttackHours[14] = GUICtrlCreateCheckbox("", $x + 60, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkAttackHours[15] = GUICtrlCreateCheckbox("", $x + 75, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkAttackHours[16] = GUICtrlCreateCheckbox("", $x + 90, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkAttackHours[17] = GUICtrlCreateCheckbox("", $x + 105, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkAttackHours[18] = GUICtrlCreateCheckbox("", $x + 120, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkAttackHours[19] = GUICtrlCreateCheckbox("", $x + 135, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkAttackHours[20] = GUICtrlCreateCheckbox("", $x + 150, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkAttackHours[21] = GUICtrlCreateCheckbox("", $x + 165, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkAttackHours[22] = GUICtrlCreateCheckbox("", $x + 180, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkAttackHours[23] = GUICtrlCreateCheckbox("", $x + 195, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkAttackHoursE2 = GUICtrlCreateCheckbox("", $x + 211, $y + 1, 13, 13, BitOR($BS_PUSHLIKE, $BS_ICON))
			_GUICtrlSetImage(-1, $g_sLibIconPath, $eIcnGoldStar, 0)
			GUICtrlSetState(-1, $GUI_UNCHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR Global GUI Design", "Clear_set_row_of_boxes", -1))
			GUICtrlSetOnEvent(-1, "chkattackHoursE2")
		GUICtrlCreateLabel(GetTranslatedFileIni("MBR Global GUI Design", "PM", "PM"), $x + 10, $y)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 25, $y = 290
	GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "Group_03", "ClanCastle"), $x - 20, $y - 20, $g_iSizeWGrpTab4, 102)
		_GUICtrlCreateIcon($g_sLibIconPath, $eIcnCC, $x, $y + 8, 64, 64)

	$y -= 8
		$g_hChkDropCCHoursEnable = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "ChkDropCCHoursEnable", "Enable CC Drop Schedule" ), $x + 70, $y, -1, -1)
			GUICtrlSetState(-1, $GUI_UNCHECKED)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Attack - Options-Attack", "ChkDropCCHoursEnable_Info_01", "Use schedule to define when dropping CC is allowed, \r\n CC is always dropped when schedule is not enabled"))
			GUICtrlSetOnEvent(-1, "chkDropCCHoursEnable")

	$x += 188
	$y += 20
		GUICtrlCreateLabel(GetTranslatedFileIni("MBR Global GUI Design", "Only_during_hours", -1), $x + 8, $y)

	$y += 14
	$x -= 21
		$g_hLblDropCChour = GUICtrlCreateLabel(GetTranslatedFileIni("MBR Global GUI Design", "Hour", -1) & ":", $x, $y, -1, 15)
			Local $sTxtTip = GetTranslatedFileIni("MBR Global GUI Design", "Only_during_hours", -1)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_hLblDropCChours[0] = GUICtrlCreateLabel(" 0", $x + 30, $y, 13, 15)
		$g_hLblDropCChours[1] = GUICtrlCreateLabel(" 1", $x + 45, $y, 13, 15)
		$g_hLblDropCChours[2] = GUICtrlCreateLabel(" 2", $x + 60, $y, 13, 15)
		$g_hLblDropCChours[3] = GUICtrlCreateLabel(" 3", $x + 75, $y, 13, 15)
		$g_hLblDropCChours[4] = GUICtrlCreateLabel(" 4", $x + 90, $y, 13, 15)
		$g_hLblDropCChours[5] = GUICtrlCreateLabel(" 5", $x + 105, $y, 13, 15)
		$g_hLblDropCChours[6] = GUICtrlCreateLabel(" 6", $x + 120, $y, 13, 15)
		$g_hLblDropCChours[7] = GUICtrlCreateLabel(" 7", $x + 135, $y, 13, 15)
		$g_hLblDropCChours[8] = GUICtrlCreateLabel(" 8", $x + 150, $y, 13, 15)
		$g_hLblDropCChours[9] = GUICtrlCreateLabel(" 9", $x + 165, $y, 13, 15)
		$g_hLblDropCChours[10] = GUICtrlCreateLabel("10", $x + 180, $y, 13, 15)
		$g_hLblDropCChours[11] = GUICtrlCreateLabel("11", $x + 195, $y, 13, 15)
		$g_ahLblDropCChoursE = GUICtrlCreateLabel("X", $x + 213, $y + 2, 11, 11)

	$y += 15
		$g_ahChkDropCCHours[0] = GUICtrlCreateCheckbox("", $x + 30, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			$sTxtTip = GetTranslatedFileIni("MBR Global GUI Design", "Only_during_hours", -1)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkDropCCHours[1] = GUICtrlCreateCheckbox("", $x + 45, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkDropCCHours[2] = GUICtrlCreateCheckbox("", $x + 60, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkDropCCHours[3] = GUICtrlCreateCheckbox("", $x + 75, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkDropCCHours[4] = GUICtrlCreateCheckbox("", $x + 90, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkDropCCHours[5] = GUICtrlCreateCheckbox("", $x + 105, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkDropCCHours[6] = GUICtrlCreateCheckbox("", $x + 120, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkDropCCHours[7] = GUICtrlCreateCheckbox("", $x + 135, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkDropCCHours[8] = GUICtrlCreateCheckbox("", $x + 150, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkDropCCHours[9] = GUICtrlCreateCheckbox("", $x + 165, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkDropCCHours[10] = GUICtrlCreateCheckbox("", $x + 180, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkDropCCHours[11] = GUICtrlCreateCheckbox("", $x + 195, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkDropCCHoursE1 = GUICtrlCreateCheckbox("", $x + 211, $y + 1, 13, 13, BitOR($BS_PUSHLIKE, $BS_ICON))
			_GUICtrlSetImage(-1, $g_sLibIconPath, $eIcnGoldStar, 0)
			GUICtrlSetState(-1, $GUI_UNCHECKED )
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR Global GUI Design", "Clear_set_row_of_boxes", -1))
			GUICtrlSetOnEvent(-1, "chkDropCCHoursE1")
		GUICtrlCreateLabel(GetTranslatedFileIni("MBR Global GUI Design", "AM", -1), $x + 10, $y)

	$y += 15
		$sTxtTip = GetTranslatedFileIni("MBR Global GUI Design", "Only_during_hours", -1)
		$g_ahChkDropCCHours[12] = GUICtrlCreateCheckbox("", $x + 30, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkDropCCHours[13] = GUICtrlCreateCheckbox("", $x + 45, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkDropCCHours[14] = GUICtrlCreateCheckbox("", $x + 60, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkDropCCHours[15] = GUICtrlCreateCheckbox("", $x + 75, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkDropCCHours[16] = GUICtrlCreateCheckbox("", $x + 90, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkDropCCHours[17] = GUICtrlCreateCheckbox("", $x + 105, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkDropCCHours[18] = GUICtrlCreateCheckbox("", $x + 120, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkDropCCHours[19] = GUICtrlCreateCheckbox("", $x + 135, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkDropCCHours[20] = GUICtrlCreateCheckbox("", $x + 150, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkDropCCHours[21] = GUICtrlCreateCheckbox("", $x + 165, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkDropCCHours[22] = GUICtrlCreateCheckbox("", $x + 180, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkDropCCHours[23] = GUICtrlCreateCheckbox("", $x + 195, $y, 15, 15)
			GUICtrlSetState(-1, $GUI_CHECKED )
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlSetTip(-1, $sTxtTip)
		$g_ahChkDropCCHoursE2 = GUICtrlCreateCheckbox("", $x + 211, $y + 1, 13, 13, BitOR($BS_PUSHLIKE, $BS_ICON))
			_GUICtrlSetImage(-1, $g_sLibIconPath, $eIcnGoldStar, 0)
			GUICtrlSetState(-1, $GUI_UNCHECKED )
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR Global GUI Design", "Clear_set_row_of_boxes", -1))
			GUICtrlSetOnEvent(-1, "chkDropCCHoursE2")
		GUICtrlCreateLabel(GetTranslatedFileIni("MBR Global GUI Design", "PM", -1), $x + 10, $y)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

EndFunc   ;==>CreateAttackSearchOptionsAttack
