extends Area2D



@export_enum("underlevel","hotline","cavelevel","kosckhei", "menu",  "start", "good_end","bad_end") var to_level: String



func _on_body_entered(body):
	if body.name == "player":
		G.goto_level(to_level)
