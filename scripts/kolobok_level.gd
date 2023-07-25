extends BaseLevel

var count_enemies = 5
@onready var kol1 = $small_kolobor
@onready var kol2 = $small_kolobor2
@onready var kol3 = $small_kolobor3
@onready var kol4 = $small_kolobor4
@onready var kol5 = $small_kolobor5


func _on_button_pressed():
	G.show_dialog("dialog-kolobok")
