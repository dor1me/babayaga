extends CharacterBody2D

class_name BaseEnemy

var speed
var attack
var hp
var player
var hp_progress
var hp_progress_inner
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var timer = Timer.new()
	
func update_hp_progres():
	var hp_ratio = hp/100
	var hp_color
	
	if hp_ratio < 0.25:
		hp_color = Color.DARK_RED
	elif hp_ratio < 0.50:
		hp_color = Color.DARK_GOLDENROD
	elif  hp_ratio < 0.90:
		hp_color = Color.DARK_OLIVE_GREEN
	else:
		hp_color = Color.DARK_GREEN
			
	hp_progress_inner.color = hp_color
	
	hp_progress_inner.size = Vector2(max(1,hp_progress.size.x*hp_ratio),1)


func disapear_timer_on_timeout():
	self.modulate.a -= 0.1
	if self.modulate.a == 0:
		queue_free()
	
func disapear():
	timer.timeout.connect(disapear_timer_on_timeout)
	timer.wait_time = 0.05
	add_child(timer)
	timer.start();
	
	

func damage(strength: float):
	hp -= strength
	if hp < 0:
		hp = 0
		disapear()
	
	update_hp_progres()

func _ready():
	hp_progress = ColorRect.new()
	hp_progress.position = -get_size()/2
	hp_progress.size = Vector2(20,1)
	hp_progress.color = Color.DARK_GRAY
	
	hp_progress_inner = ColorRect.new()
	hp_progress_inner.position = Vector2(0,0)
	hp_progress_inner.size = Vector2(hp_progress.size.x,1)
	
	hp_progress.add_child(hp_progress_inner)
	
	update_hp_progres()
	
	add_child(hp_progress);
	
func get_size():
	return Vector2(0,0)

func _physics_process(delta):
	var direction
	if position.x > player.position.x:
		velocity.x = -speed
	else:
		velocity.x = speed
	
	if ! is_on_floor():
		velocity.y += gravity * delta
	
	move_and_slide()
