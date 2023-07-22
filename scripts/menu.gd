extends Control

var M;

#func _ready():
#	M = $music_player;
#	M.play()


func _on_button_pressed():
	G.change_level_quick("underlevel")
