extends BaseEnemy

var speed
var attack
var player

func _ready():
	super()
	player = $"../player"

func _init():
	speed = 30
	attack = G.small_kolobok_attack
	hp = G.small_kolobok_hp	
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func get_size():
	return Vector2(19,18)


func process_ai(delta):
	pass
	

func jump():
	if !is_on_floor():
		return
	if abs(position.x - player.position.x) > 100:
		return
	elif position.x > player.position.x:
		velocity = Vector2(-speed,-30)*10
	else:
		velocity = Vector2(speed,-30)*10
	pass

func _on_timer_timeout():
	jump()
