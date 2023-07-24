extends BaseEnemy

func _init():
	
	hp = G.small_kolobok_hp	
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func kick(vector : Vector2):
	pass
	
func damage(vector: Vector2, strength: float):
	super(Vector2(), strength)
	
	
