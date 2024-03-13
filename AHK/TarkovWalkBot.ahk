CoordMode, Pixel, Window
Gui, Add, Tab, x2 y-1 w1290 h820 , Main|Physical|Guns
Gui, Tab, Main
Gui, Add, Button, x235 y513 w131 h36 , Long AFK Strength
Gui, Add, Button, x235 y513 w131 h36 , Long AFK Strength
Gui, Add, Button, x796 y520 w131 h36 , Test
Gui, Tab, Physical
Gui, Add, Button, x235 y513 w131 h36 gStrength_farm, Strength
Gui, Add, Picture, x235 y331 w131 h125 , C:\Users\Dustyn\Downloads\Skill_physical_strength.png
Gui, Add, Button, x796 y520 w131 h36 gEndurance_farm, Endurance
Gui, Add, Picture, x784 y325 w147 h141 , C:\Users\Dustyn\Downloads\Skill_physical_endurance.png
Gui, Tab, Guns
Gui, Add, Picture, x107 y114 w122 h121 , C:\Users\Dustyn\Downloads\Skill_combat_assaultrifles.png
Gui, Add, Picture, x314 y115 w133 h121 , C:\Users\Dustyn\Downloads\Skill_combat_dmrs.png
Gui, Add, Picture, x529 y119 w153 h128 , C:\Users\Dustyn\Downloads\Skill_combat_lmgs.png
Gui, Add, Picture, x786 y124 w166 h124 , C:\Users\Dustyn\Downloads\Skill_combat_pistols.png
Gui, Add, Picture, x113 y407 w149 h165 , C:\Users\Dustyn\Downloads\Skill_combat_shotguns.png
Gui, Add, Picture, x423 y388 w200 h185 , C:\Users\Dustyn\Downloads\Skill_combat_smgs.png
Gui, Add, Picture, x791 y385 w198 h189 , C:\Users\Dustyn\Downloads\Skill_combat_sniperrifles.png
Gui, Add, Button, x116 y284 w102 h34 gMag_farm, Assault Rifles
Gui, Add, Button, x321 y271 w119 h42 gMag_farm, DMRs
Gui, Add, Button, x541 y273 w132 h49 gMag_farm, LMGs
Gui, Add, Button, x794 y270 w147 h48 gMag_farm, Pistols
Gui, Add, Button, x114 y597 w146 h51 gMag_farm, Shotguns
Gui, Add, Button, x429 y596 w184 h59 gMag_farm, SMGs
Gui, Add, Button, x798 y597 w178 h60 gMag_farm, SniperRifles


; Generated using SmartGUI Creator 4.0
Gui, Show, x364 y117 h838 w1305, New GUI Window
return






GuiClose:
ExitApp

Strength_farm(){ ;*[Farming Farah]
	if WinExist("EscapeFromTarkov") {
		WinActivate
		sleep 600
		Loop{
			MouseMove 960, 647, 3 ; "start"
			MouseClick, Left
			MouseMove, 955, 945, 3 ; next
			MouseClick, Left
			sleep 100
			MouseMove, 734, 434, 3 ; Map
			MouseClick, Left
			sleep 100
			MouseMove, 1204, 1004, 3 ; ready
			MouseClick, Left
			Loop, 130{
				Send {w down}
				sleep 2500
				Send {w up}
				sleep 50
				Send {s down}
				sleep 2700
				Send {s up}
				PixelSearch, px, py, 1317, 884, 1317, 884, 0x840404, 2, RGB Fast ;death check
				{
					if ErrorLevel = 0
						Goto, death
					else if ErrorLevel = 1
						Continue
				}
			}
			Send {esc}
			sleep 100
			MouseMove, 940, 630, 3
			MouseClick, Left
			sleep 100
			MouseMove, 955, 971, 3
			MouseClick, Left
			sleep 15000
			death:
			MouseMove, 955, 955, 3 ;next
			MouseClick, Left
			sleep 100
			MouseClick, Left ;next
			sleep 100
			MouseClick, Left ; next
			sleep 100
			MouseClick, Left ; next
			sleep 100
			MouseMove, 794, 295, 3 ; health select
			MouseClick, Left
			sleep 100
			MouseMove, 1283, 950, 3 ; apply
			MouseClick, Left
			sleep 100
			MouseMove,955,955,3 ; next
			MouseClick, Left
			sleep 100
			sleep 50000 ; wait for main Menu
			
			
			
		}
		
		
		return
	}
	else msgbox Open Tarkov
		
}

Endurance_farm(){
	if WinExist("EscapeFromTarkov"){
		WinActivate
		sleep 100
		MouseMove, 1204, 1004, 3 ; ready
		MouseClick, Left
		Loop, 100{
			Send {w down}
			sleep 100
			Send {Shift down}
			sleep 2500
			Send {Shift up}
			Send {w up}
			sleep 100
			Send {s down}
			sleep 5200
			Send {s up}
			sleep 100
			PixelSearch, px, py, 1317, 884, 1317, 884, 0x840404, 2, RGB Fast ;death check
			{
				if ErrorLevel = 0
					Goto, death1
				else if ErrorLevel = 1
					Continue
			}
		}
		Send {esc}
		sleep 100
		MouseMove, 940, 630, 3
		MouseClick, Left
		sleep 100
		MouseMove, 955, 971, 3
		MouseClick, Left
		sleep 15000
		death1:
		MouseMove, 955, 955, 3 ;next
		MouseClick, Left
		sleep 100
		MouseClick, Left ;next
		sleep 100
		MouseClick, Left ; next
		sleep 100
		MouseClick, Left ; next
		sleep 100
		MouseMove, 794, 295, 3 ; health select
		MouseClick, Left
		sleep 100
		MouseMove, 1283, 950, 3 ; apply
		MouseClick, Left
		sleep 100
		MouseMove,955,955,3 ; next
		MouseClick, Left
		sleep 100
		sleep 50000 ; wait for main Menu
		
	}
	else msgbox open tarkov
}

Mag_farm(){
	if WinExist("EscapeFromTarkov"){
		WinActivate
		sleep 100
		MouseMove, 1204, 1004, 3 ; ready
		MouseClick, Left
		Loop, 800{
			Send {r}
			sleep 1000
			
			PixelSearch, px, py, 1317, 884, 1317, 884, 0x840404, 2, RGB Fast ;death check
			{
				if ErrorLevel = 0
					Goto, death2
				else if ErrorLevel = 1
					Continue
			}
		}
		Send {esc}
		sleep 100
		MouseMove, 940, 630, 3
		MouseClick, Left
		sleep 100
		MouseMove, 955, 971, 3
		MouseClick, Left
		sleep 15000
		death2:
		MouseMove, 955, 955, 3 ;next
		MouseClick, Left
		sleep 100
		MouseClick, Left ;next
		sleep 100
		MouseClick, Left ; next
		sleep 100
		MouseClick, Left ; next
		sleep 100
		MouseMove, 794, 295, 3 ; health select
		MouseClick, Left
		sleep 100
		MouseMove, 1283, 950, 3 ; apply
		MouseClick, Left
		sleep 100
		MouseMove,955,955,3 ; next
		MouseClick, Left
		sleep 100
		sleep 50000 ; wait for main Menu
		
	}
	else msgbox open tarkov
}


f2:: ExitApp
