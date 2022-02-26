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

; NEUTRON
; Create a new NeutronWindow and navigate to the main HTML page
neutron := new NeutronWindow()
neutron.Load("main.html")

; Use the Gui method to set a custom label prefix for GUI events. This code is
; equivalent to the line `Gui, name:+LabelNeutron` for a normal GUI.
neutron.Gui("+LabelNeutron")
prefill_forms(neutron)
; Show the GUI, with an initial size of 1000 x 800.
neutron.Show("w1000 h800")
; We have to activate the hotkey listeners after the Neutron Window is created.
; Putting this include at the top of the file, would block the UI.
; At the end of the file it wouldn't work either, because of the return.
#Include ./scripts/hotkey_controller.ahk
return


; On neutron window close, exit app.
NeutronClose:
ExitApp
return


; --- Trigger AHK by page events ---

; --- Update page by Hotkey ---
; Limit this hotkey to only fire while our Neutron window is the active window.
#if WinActive("ahk_id" neutron.hWnd)

~1::UpdateKeyExample(neutron, "1", "active")
~2::UpdateKeyExample(neutron, "2", "active")
~3::UpdateKeyExample(neutron, "3", "active")
~4::UpdateKeyExample(neutron, "4", "active")
~1 Up::UpdateKeyExample(neutron, "1", "")
~2 Up::UpdateKeyExample(neutron, "2", "")
~3 Up::UpdateKeyExample(neutron, "3", "")
~4 Up::UpdateKeyExample(neutron, "4", "")

UpdateKeyExample(neutron, keyName, className) {
	; Use the JavaScript function document.querySelectorAll to find elements
	; based on a CSS selector.
	keyDivs := neutron.doc.querySelectorAll(".keys > div")

	; Use Neutron's .Each() method to iterate through the HTMLCollection in a
	; for loop.
	for i, div in neutron.Each(keyDivs)
	{
		; Check if the div's innerText matches the key that was pressed
		if (div.innerText == keyName)
		{
			; Update the div's className property to change its style on the fly
			div.className := className
		}
	}
}
#if


; --- Dynamic Content Generation ---

Ex4_Submit1(neutron, event)
{
	event.preventDefault()
	formData := neutron.GetFormData(event.target)

	; Generate the HTML we're going to add to the page. To do this, we use the
	; FormatHTML static method, which will run the values through an HTML escape
	; function before passing them on to the AHK Format function. This will
	; take care of any special sequences such as angle brackets or quotes that
	; exist in the data and keep them from breaking the page.
	html := neutron.FormatHTML("<tr><td>{}</td><td>{}</td>", formData.ex4_item1, formData.ex4_cost1)

	; Add our HTML to the page, as part of the table body. To do this, we'll be
	; using the element.insertAdjacentHTML function. However, if we wanted to
	; replace the body contents instead of adding to them, we could instead use
	; `.innerHTML := html`.
	;
	; Read more about element.insertAjacentHTML here:
	; https://developer.mozilla.org/en-US/docs/Web/API/Element/insertAdjacentHTML
	neutron.qs("#ex4_table1>tbody").insertAdjacentHTML("beforeend", html)
}

Ex4_Submit2(neutron, event)
{
	event.preventDefault()
	formData := neutron.GetFormData(event.target)

	; Create the row element to add cells to
	tr := neutron.doc.createElement("tr")

	; Create the first column cell and add it to the row
	td := neutron.doc.createElement("td")
	td.innerText := formData.ex4_item2
	tr.appendChild(td)

	; Create the second column cell and add it to the row
	td := neutron.doc.createElement("td")
	td.innerText := formData.ex4_cost2
	tr.appendChild(td)

	; Add the row to the table
	neutron.qs("#ex4_table2>tbody").appendChild(tr)
}
