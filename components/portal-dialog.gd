extends Area2D

@export_enum("kolobok","vodyanoy","irka") var dialog: String
@onready var vodyanoy = $vodya
func end_level():
	if 1==1:
		vodyanoy.collision_
		
func _on_body_entered(body):
	if body.name == "player":
		G.goto_dialog(dialog)
