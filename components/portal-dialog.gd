extends Area2D
class_name DialogPortal

@export_enum("dialog-kolobok","dialog-vodyanoy","dialog-irka", "dialog-koshei") var dialog: String

@onready var sprite = $sprite

#@onready var vodyanoy = $vodya

#func end_level():
#	if 1==1:
#		vodyanoy.collision_
#		
func _on_body_entered(body):
	if body.name == "player":
		G.show_dialog(dialog)
		disable()

func disable():
	collision_mask = 0

func enable():
	if sprite:
		sprite.visible = true
	collision_mask = 2

