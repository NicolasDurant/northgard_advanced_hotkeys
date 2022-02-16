; Get sections
For key, value in initial_config
  ; Get item and its hotkey of a section
  For k, v in value
    {
      ; We skip .ini entries that have "none" as their value, those are not set
      if(v = "none")
        continue
      ; Create hotkeys for all .ini key, value pairs and match them with the correct labels
      Hotkey, % initial_config[key][k], %k%
    }
return

; VILLAGE
; brewery
brewery:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; forge
forge:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; healerhut
healerhut:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; house
house:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; scout
scout:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return

; PRODUCTION
; field
field:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; fish
fish:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; hunt
hunt:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; mine
mine:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; silo
silo:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; stone
stone:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; wood
wood:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return

; MILITARY
; axe
axe:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; shield
shield:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; tower
tower:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; training
training:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return

; TRADING
; lighthouse
lighthouse:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; longship
longship:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; market
market:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; trading
trading:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return

; UNITS
; brewer
brewer:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; farmer
farmer:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; fisherman
fisherman:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; healer
healer:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; hunter
hunter:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; loremaster
loremaster:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; mender
mender:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; merchant
merchant:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; miner
miner:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; norn
norn:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; sailor
sailor:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; scouts
scouts:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; skald
skald:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; smith
smith:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; thrall
thrall:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; villager
villager:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
; woodcutter
woodcutter:
MsgBox %A_ThisLabel% You pressed %A_ThisHotkey%.
return
