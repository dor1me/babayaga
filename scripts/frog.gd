extends BaseEnemy

var speed
var attack
var player
var sprite : Sprite2D
var skew_dir = 1

var jumping = false
var go_jump = false

func _ready():
	super()
	player = $"../player"
	sprite = $Sprite2D
	
func _init():
	speed = 30
	attack = G.small_kolobok_attack
	hp = G.small_kolobok_hp	
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func get_size():
	return Vector2(19,18)

func on_freeze_tick(delta):
	sprite.skew += skew_dir*delta*5
	if abs(sprite.skew)>0.25:
		skew_dir = -skew_dir
	
func on_unfreeze():
	sprite.skew = 0

func process_ai(delta):
	if self.freezing:
		velocity.x = 0
	elif go_jump and is_on_floor():
		go_jump = false
		jumping = true
	elif jumping and is_on_floor():
		velocity = Vector2()

		

func jump():
	if !is_on_floor():
		return
	if (position - player.position).length() > 100:
		return
	elif position.x > player.position.x:
		velocity = Vector2(-speed,-30)*10
	else:
		velocity = Vector2(speed,-30)*10
	pass
	go_jump = true

func _on_timer_timeout():
	jump()
