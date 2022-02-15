if FileExist("settings.ini")
  read_ini()
else
  init_ini()

init_ini(){
  ; VILLAGE
  ; brewery
  IniWrite, j & SC027, settings.ini, village, brewery
  ; forge
  IniWrite, j & l, settings.ini, village, forge
  ; healer
  IniWrite, j & k, settings.ini, village, healer
  ; house
  IniWrite, j & o, settings.ini, village, house
  ; scout
  IniWrite, j & p, settings.ini, village, scout

  ; PRODUCTION
  ; field
  IniWrite, h & l, settings.ini, production, field
  ; fish
  IniWrite, h & SC028, settings.ini, production, fish
  ; hunt
  IniWrite, h & k, settings.ini, production, hunt
  ; mine
  IniWrite, h & p, settings.ini, production, mine
  ; silo
  IniWrite, h & SC027, settings.ini, production, silo
  ; stone
  IniWrite, h & n, settings.ini, production, silo
  ; wood
  IniWrite, h & o, settings.ini, production, wood

  ; MILITARY
  ; axe
  IniWrite, n & l, settings.ini, military, axe
  ; shield
  IniWrite, n & SC027, settings.ini, military, shield
  ; tower
  IniWrite, n & o, settings.ini, military, tower
  ; training
  IniWrite, n & k, settings.ini, military, training

  ; TRADING
  ; lighthouse
  IniWrite, b & SC027, settings.ini, trading, lighthouse
  ; longship
  IniWrite, b & l, settings.ini, trading, longship
  ; market
  IniWrite, b & k, settings.ini, trading, market
  ; trading
  IniWrite, b & o, settings.ini, trading, trading

  ; UNITS
  ; brewer
  IniWrite, none, settings.ini, units, brewer
  ; farmer
  IniWrite, none, settings.ini, units, farmer
  ; fisherman
  IniWrite, none, settings.ini, units, fisherman
  ; healer
  IniWrite, none, settings.ini, units, healer
  ; hunter
  IniWrite, none, settings.ini, units, hunter
  ; loremaster
  IniWrite, none, settings.ini, units, loremaster
  ; mender
  IniWrite, none, settings.ini, units, mender
  ; merchant
  IniWrite, none, settings.ini, units, merchant
  ; miner
  IniWrite, none, settings.ini, units, miner
  ; norn
  IniWrite, none, settings.ini, units, norn
  ; sailor
  IniWrite, none, settings.ini, units, sailor
  ; scout
  IniWrite, none, settings.ini, units, scout
  ; skald
  IniWrite, none, settings.ini, units, skald
  ; smith
  IniWrite, none, settings.ini, units, smith
  ; thrall
  IniWrite, none, settings.ini, units, thrall
  ; villager
  IniWrite, none, settings.ini, units, villager
  ; woodcutter
  IniWrite, none, settings.ini, units, woodcutter
}

read_ini(){
  IniRead, names, settings.ini
  MsgBox, %names%
}
