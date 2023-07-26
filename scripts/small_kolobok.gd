extends BaseEnemy

var speed
var attack
var player
var sprite : Sprite2D
var skew_dir = 1
func _ready():
	super()
	player = $"../player"
	sprite = $Sprite2D

func _init():
	speed = G.small_kolobok_speed
	attack = G.small_kolobok_attack
	hp = G.small_kolobok_hp	
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func get_size():
	return Vector2(34,34)

func on_freeze_tick(delta):
	sprite.skew += skew_dir*delta*5
	if abs(sprite.skew)>0.25:
		skew_dir = -skew_dir
	
func on_unfreeze():
	sprite.skew = 0

func process_ai(delta):
	if self.freezing:
		velocity.x = 0
	elif position.x > player.position.x:
		velocity.x = -speed
	else:
		velocity.x = speed
