"GameMenu"
{
	"5"
	{
		"label" "#GameUI_GameMenu_PlayerList"
		"command" "OpenPlayerListDialog"
		"OnlyInGame" "1"
		"notsingle" "1"
	}
	"14"
	{
		"label" "#GameUI_GameMenu_FindServers"
		"command" "OpenServerBrowser"
		"notsingle" "1"
		"HelpText" "#GameUI_MainMenu_Hint_FindServer"
	}
	"15"
	{
		"label" "#GameUI_GameMenu_CreateServer"
		"command" "OpenCreateMultiplayerGameDialog"
		"notsingle" "1"
		"HelpText" "#GameUI_MainMenu_Hint_CreateServer"
	}
	"16"
	{
		"label" "#TTT_GameUI_GameMenu_Discord"
		"command" "engine discord"
		"HelpText" "#TTT_GameUI_MainMenu_Hint_CreateServer"
	}
//	"16"
//	{
//		"name" "LoadDemo"
//		"label" "#GameUI_GameMenu_PlayDemo"
//		"command" "OpenLoadDemoDialog"
//	}
	"18"
	{
		"label" "#GameUI_GameMenu_Options"
		"command" "OpenOptionsDialog"
		"HelpText" "#GameUI_MainMenu_Hint_Configuration"
	}
	"19"
	{
		"label" "#GameUI_GameMenu_Disconnect"
		"command" "Disconnect"
		"OnlyInGame" "1"
		"notsingle" "1"
	}
	"20"
	{
		"label" "#GameUI_GameMenu_LeaveGame"
		"command" "Disconnect"
		"OnlyInGame" "1"
		"notmulti" "1"
	}
	"21"
	{
		"label" "#TTT_GameUI_Help"
		"command" "engine ttt_tutorial"
		"OnlyInGame" "1"
		"notsingle" "1"
	}
	"22"
	{
		"label" "#GameUI_GameMenu_Quit"
		"command" "Quit"
		"HelpText" "#TTT_GameUI_MainMenu_Hint_QuitGame"
	}
}
