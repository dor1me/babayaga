extends BaseEnemy

var speed
var attack
var player

func _ready():
	super()
	player = $"../player"

func _init():
	speed = G.small_kolobok_speed
	attack = G.small_kolobok_attack
	hp = G.small_kolobok_hp	
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func get_size():
	return Vector2(34,34)

func process_ai(delta):
	if position.x > player.position.x:
		velocity.x = -speed
	else:
		velocity.x = speed
