extends CanvasLayer
class_name Hud

@onready var hp = $hp_text
@onready var ultimate = $ultimate_text
@onready var not_ready = $not_ready
func icon():
	if G.ultimate == 100:
		not_ready.visible = false

func update():
	hp.text = String.num(G.player_hp)
	ultimate.text = String.num(G.player_ultimate)

