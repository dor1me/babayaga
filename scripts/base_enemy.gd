extends CharacterBody2D

class_name BaseEnemy

var hp

var hp_progress
var hp_progress_inner
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var timer = Timer.new()
var damage_vector
var damage_vector_ratio
var kick_vector
var kick_vector_ratio
var dead = false

@onready var collider = $collider

@export var collision_damage : float = 1

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
	if self.modulate.a <= 0:
		print("kill" + name)
		queue_free()
	
func disapear():
	dead = true
	timer.timeout.connect(disapear_timer_on_timeout)
	timer.wait_time = 0.05
	add_child(timer)
	timer.start();

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

func damage(vector: Vector2, strength: float):
	hp -= strength
	if hp <= 0:
		hp = 0
		disapear()
	
	update_hp_progres()
	damage_vector = vector*10
	damage_vector_ratio = 1

func kick(vector : Vector2):
	#disable player collision
	#collision_mask -= 2
	#position += vector
	velocity = vector*10
	kick_vector = vector
	kick_vector_ratio = 1
	

func process_ai(delta):
	pass



func _physics_process(delta):
	var direction
	if dead:
		return
		
	if kick_vector:
		kick_vector_ratio -= delta
		#velocity = kick_vector*kick_vector_ratio
		if kick_vector_ratio<0.5 and is_on_floor():
			kick_vector = null
			velocity = Vector2()
			#collision_mask += 2
		if kick_vector_ratio<0:
			kick_vector = null
			velocity = Vector2()
			#collision_mask += 2
		
	elif damage_vector:
		damage_vector_ratio -= delta
		velocity = damage_vector*damage_vector_ratio
		if damage_vector_ratio<0:
			damage_vector = null
	else:
		process_ai(delta) 
	
	
	if ! is_on_floor():
		velocity.y += gravity * delta
	
	move_and_slide()
