; Coordinates of the build button for hotkey execution
x_position_build_button = 0
y_position_build_button = 0
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
; Hotkeys have to be manually started, the programm starts in suspend mode
suspend
; Register 'Enter' as Pause key for the script
; 'Enter' has the advantage that you press it once for opening the chat and
; again to close it. So the hotkeys automatically deactivate when you write
; and reactivate, when you are finished texting.
Enter::suspend
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

; Gets called whenever a registered hotkey is pressed.
; Receives the category image to find the category on the screen via ImageSearch.
; Finds the build button on the screen and presses the correct building via the category.
; The position of the desired building is counted from left to right and top to bottom to form a grid.
select_building(category_image, position) {
  ; access global variables
  global x_position_build_button
  global y_position_build_button
  ; save current mouse position
  MouseGetPos, x_mouse, y_mouse
  ; check if we got the button position already to save some ressources
  if(x_position_build_button = 0 & y_position_build_button = 0)
    search_build_key()
  ; press build key
  MouseClick, , %x_position_build_button%, %y_position_build_button%
  ; search category image
  category_position = search_category_image(%category_image%)
  ; calculate the position of the building in relation to the found category and the grid
  MouseClick, , category_position.x + (20 * (%position% - 1)), category_position.y + 20 * %position%
  ; mouse position jump back
  MouseMove, x_mouse, y_mouse
}

; Extracted search for the build key and save it globally.
search_build_key() {
  ; access global variables
  global x_position_build_button
  global y_position_build_button
  global categories
  ; interprets the coordinates below as relative to the screen rather than the active window.
  CoordMode Pixel
  ; search build key and save it globally
  ImageSearch, x_build, y_build, 0, 0, A_ScreenWidth, A_ScreenHeight, categories.build
  ; error handling
  if (ErrorLevel = 2)
      OutputDebug, Could not conduct the search.
  else if (ErrorLevel = 1)
      OutputDebug, Image could not be found on the screen.
  else
      OutputDebug, The image was found at %x_build%x%y_build%.
      ; save coordinates
      x_position_build_button := x_build
      y_position_build_button := y_build
}

; Extracted search for the category image key and return it.
search_category_image(category_image) {
  ; access global variables
  global x_position_build_button
  global y_position_build_button
  ; interprets the coordinates below as relative to the screen rather than the active window.
  CoordMode Pixel
  ; search build key and save it globally
  ImageSearch, x_build, y_build, 0, 0, A_ScreenWidth, A_ScreenHeight, %category_image%
  ; error handling
  if (ErrorLevel = 2)
      MsgBox Could not conduct the search.
  else if (ErrorLevel = 1){
    OutputDebug, Image %category_image% could not be found on the screen. \n Pressing the build button and searching again.
    ; press "build" key, because the image can't be found (menu is closed)
    ; search build key and save it globally
    ImageSearch, x_build, y_build, 0, 0, A_ScreenWidth, A_ScreenHeight, %category_image%
    ; error handling
    if (ErrorLevel = 2)
    OutputDebug, Could not conduct the search.
    else if (ErrorLevel = 1)
    OutputDebug, Image %category_image% could not be found on the screen.
    else
    MsgBox The image was found at %x_build%x%y_build%.
    return {x: %x_build%, y: %y_build%}
  }
  else
      OutputDebug, The image was found at %x_build%x%y_build%.
      return {x: %x_build%, y: %y_build%}
}
