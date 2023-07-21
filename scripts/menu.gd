extends Control

var M;

func _ready():
	M = $music_player;
	M.play()
