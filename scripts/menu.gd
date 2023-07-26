extends Control

var M;
@onready var pressed = $pressed
#func _ready():
#	M = $music_player;
#	M.play()


func _on_button_pressed():
	pressed.play()
	G.change_level_quick("comics")
	


func _on_button_tutor_pressed():
	G.change_level_quick("start")
