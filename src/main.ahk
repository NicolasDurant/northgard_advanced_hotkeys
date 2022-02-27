; CONFIGURATION
; Avoids checking empty variables to see if they are environment variables (recommended for all new scripts).
#NoEnv
; Use SetBatchLines -1 to never sleep (i.e. have the script run at maximum speed).
SetBatchLines, -1
; Include the Neutron library
#Include ./modules/Neutron.ahk
; Include scripts that provide the imports and methods for NAH
#Include ./scripts/asset_import.ahk
#Include ./scripts/ini_controller.ahk
#Include ./scripts/form_controller.ahk
#Include ./scripts/ui_controller.ahk
#Include ./scripts/lore_controller.ahk
; NEUTRON
; Create a new NeutronWindow and navigate to the main HTML page
neutron := new NeutronWindow()
neutron.Load("main.html")
; Use the Gui method to set a custom label prefix for GUI events. This code is
; equivalent to the line `Gui, name:+LabelNeutron` for a normal GUI.
neutron.Gui("+LabelNeutron")
; Before we show the application window, we generate the input form fields
; with the information we get out of the settings.ini
prefill_forms(neutron)
; Show the GUI, with an initial sizes
neutron.Show("w1200 h975")
; We have to activate the hotkey listeners after the Neutron Window is created.
; Putting this include at the top of the file, would block the UI.
; At the end of the file it wouldn't work either, because of the return.
#Include ./scripts/hotkey_controller.ahk
return

; On neutron window close, exit app.
NeutronClose:
ExitApp
return
