extends BaseLevel



func _on_enable_cleaner_area_body_entered(body):
	if body.name == "player":
		cleaner_enabled = true


func _on_freeze_timer_timeout():
	pass # Replace with function body.
