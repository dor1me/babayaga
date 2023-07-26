extends BaseEnemy

var skew_dir = 1
@onready var sprite : AnimatedSprite2D = $animation

func _init():
	
	hp = G.small_kolobok_hp	
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func get_size():
	return Vector2(30,30)

func kick(vector : Vector2):
	pass
	
func damage(vector: Vector2, strength: float):
	super(Vector2(), strength)
	
func on_freeze_tick(delta):
	sprite.skew += skew_dir*delta*5
	if abs(sprite.skew)>0.25:
		skew_dir = -skew_dir
	
func on_unfreeze():
	sprite.skew = 0	


func _on_timer_timeout():
	$animation.play("idle")
