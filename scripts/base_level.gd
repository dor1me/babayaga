extends Node2D
class_name BaseLevel

@export var player_attack_multiplier : float = 1
@export var cleaner_enabled : bool = true


@onready var hud : Hud = $hud

func update_hud():
	if hud:
		hud.update()
