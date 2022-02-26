; gets called by the top panel menu actions
; this has to be done programmatically, changing the slide with html attributes
; leads to a reload of the page, which destroys our dynammically generated form fields
change_slide(neutron, event, number) {
  neutron.wnd.changeSlide(number)
}
