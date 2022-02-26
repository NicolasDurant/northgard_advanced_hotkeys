; initially creates the HTML form data input fields
; this is a dynamic insertion of the read .ini config
prefill_forms(neutron){
	global initial_config
	; generate BUILDINGS form
	For key, value in initial_config{
    ; Skip civilians for now
		if(key = "civilians")
			continue
	  ; Get item and its hotkey of a section
	  For k, v in value
	    {
	      ; Generate HTML dynamic input field with label for our building hotkeys
				html := neutron.FormatHTML("<div class='form-group ae-5 fromLeft'><input id='{}' class='rounded form-control-input' type='text' name='{}' value='{}'/><label class='form-control-label' for='{}'>{}</label></div>", k, k, v, k, k)
				neutron.qs("#hotkey-buildings-form").insertAdjacentHTML("afterbegin", html)
	    }
	}
}

; save the hotkey in the settings.ini file
; reload configuration to reflect the changes
write_ini() {

}

; user presses the save button and entered a hotkey combination
; has to write .ini and fill the according fields with the data
submit_building_hotkeys(neutron, event)
{
	; Some events have a default action that needs to be prevented. A form will
	; redirect the page by default, but we want to handle the form data ourself.
	event.preventDefault()

	; Use Neutron's GetFormData method to process the form data into a form that
	; is easily accessed. Fields that have a 'name' attribute will be keyed by
	; that, or if they don't they'll be keyed by their 'id' attribute.
	formData := neutron.GetFormData(event.target)

	; You can access all of the form fields by iterating over the FormData
	; object. It will go through them in the order they appear in the HTML.
	out := "Access all fields by iterating:`n"
	for name, value in formData
		out .= name ": " value "`n"
	out .= "`n"

	; Show the output
	MsgBox, %out%
}
