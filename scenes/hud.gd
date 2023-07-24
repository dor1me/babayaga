extends Node2D
class_name Hud

@onready var hp = $hp_text
@onready var ultimate = $ultimate_text

func update():
	hp.text = String.num(G.player_hp)
	ultimate.text = String.num(G.player_ultimate)

