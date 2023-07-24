extends Node2D
class_name BaseLevel

@onready var hud : Hud = $hud

func update_hud():
	if hud:
		hud.update()	
