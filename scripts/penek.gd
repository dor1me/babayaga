extends BaseEnemy

func _init():
	
	hp = G.small_kolobok_hp	
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func get_size():
	return Vector2(30,30)

func kick(vector : Vector2):
	pass
	
func damage(vector: Vector2, strength: float):
	super(Vector2(), strength)
	
	


func _on_timer_timeout():
	$animation.play("idle")
