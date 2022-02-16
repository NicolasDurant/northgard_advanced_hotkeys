; File path to write to
ini_name = settings.ini
; Default hotkey configuration
initial_village := {brewery: "j & SC027",forge: "j & l",healer: "j & k",house: "j & o",scout: "j & p"}
initial_production := {field: "h & l",fish: "h & SC028",hunt: "h & k",mine: "h & p",silo: "h & SC027",stone: "h & n",wood: "h & o"}
initial_military := {axe: "n & l",shield: "n & SC027",tower: "n & o",training: "n & k"}
initial_trading := {lighthouse: "b & SC027",longship: "b & l",market: "b & k",trading: "b & o"}
initial_units := {brewer: "none",farmer: "none",fisherman: "none",healer: "none",hunter: "none",loremaster: "none",mender: "none",merchant: "none",miner: "none",norn: "none",sailor: "none",scout: "none",skald: "none",smith: "none",thrall: "none",villager: "none",woodcutter: "none"}
initial_config := {village: initial_village, production: initial_production, military: initial_military, trading: initial_trading, units: initial_units}

; Check if there is an .ini file in given path, or create with default hotkeys
if FileExist(ini_name)
  read_ini()
else
  init_ini()

; Creates the .ini file in the given path
init_ini(){
  ; Get the necessary variables from the global scope
  global ini_name
  global initial_config
  ; Get sections
  For key, value in initial_config
    ; Get item and its hotkey of a section
    For k, v in value
      ; Create .ini file with key = value in a section
      IniWrite, %v%, %ini_name%, %key%, %k%
}

; Reads the .ini file and creates an object out of it for further use
read_ini(){
  ; Get the necessary variables from the global scope
  global ini_name
  global initial_config
  ; Get sections
  For key, value in initial_config
    ; Get item and its hotkey of a section
    For k, v in value
    {
      ; Create .ini file with key = value in a section
      IniRead, OutputVar, %ini_name%, %key%, %k%
      MsgBox, %key% %k%  "=" %OutputVar%
      initial_config[key][k] = OutputVar
      MsgBox, % initial_config[key][k]
    }
}
