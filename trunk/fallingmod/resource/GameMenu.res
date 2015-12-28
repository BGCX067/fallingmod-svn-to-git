"GameMenu"
{
	"1"
	{
		"label" "#GameUI_GameMenu_ResumeGame"
		"command" "ResumeGame"
		"OnlyInGame" "1"
	}
	"2"
	{
		"label" "#GameUI_GameMenu_FM_BackToLobby"
		"command" "engine fm_backtolobby"
		"OnlyInGame" "1"
	}
	"5"
	{
		"label" "#GameUI_GameMenu_NewGame"
		"command" "OpenNewGameDialog"
		"notmulti" "1"
		"notsingle" "1"
	}
	"6"
	{
		"label" "#GameUI_GameMenu_LoadGame"
		"command" "OpenLoadGameDialog"
		"notmulti" "1"
	}
	"7"
	{
		"label" "#GameUI_GameMenu_SaveGame"
		"command" "OpenSaveGameDialog"
		"notmulti" "1"
		"OnlyInGame" "1"
	}
	"11"
	{
		"label" "#GameUI_GameMenu_Friends"
		"command" "OpenFriendsDialog"
	}
	"12"
	{
		"label" "#GameUI_GameMenu_Options"
		"command" "OpenOptionsDialog"
	}
	"13"
	{
		"label" "Show FPS"
		"command" "engine cl_showfps 1"
	}
	"14"
	{
		"label" "Hide FPS"
		"command" "engine cl_showfps 0"
	}
	"15"
	{
		"label" "Toggle Console"
		"command" "engine toggleconsole"
	}
	"16"
	{
		"label" "Check for Updates"
		"command" "engine fm_updatecheck"
	}
	"17"
	{
		"label" "#GameUI_GameMenu_Quit"
		"command" "Quit"
	}
}

