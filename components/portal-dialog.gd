extends Area2D

@export_enum("kolobok","vodyanoy","irka") var dialog: String


func _on_body_entered(body):
	if body.name == "player":
		G.goto_dialog(dialog)
