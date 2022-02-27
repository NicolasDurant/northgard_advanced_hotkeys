; gets called when the user clicks a predefined area in the image map
; of the lore skill tree, so we can autoskill the selected order in our script
lore_clicked(neutron, event, lore) {
  MsgBox, %lore%
}
