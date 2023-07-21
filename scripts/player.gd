extends CharacterBody2D

var SPEED = G.player_speed
var JUMP_VELOCITY = G.jump_velocity
var health = G.player_hp
var attack = G.player_attack
var status =  G.player_status
var x = G.player_posx

#var y = G.player
@onready var shape = $CollisionShape2D
@onready var zindex = $AnimatedSprite2D
@onready var _animated_sprite = $AnimatedSprite2D
@onready var camera = $Camera2D



var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")



#func flying():
	##	_animated_sprite.play("fly")
	#	gravity = 0
		



func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		x += velocity.x
		_animated_sprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		x -= velocity.x
		_animated_sprite.play("run")
	else: 
		_animated_sprite.play("idle")
		
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	move_and_slide()

	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	#if Input.is_action_just_pressed("ui_text_completion_replace"):
		#_animated_sprite.play("jump")
		#velocity.y += JUMP_VELOCITY
		#velocity.x += 150
		#while 
		#velocity.y += JUMP_VELOCITY
		#velocity.x += SPEED
		#zindex.z_index = 5
		#shape.disabled = true
		

		
	##if Input.is_action_pressed("shift"):
		##status = "flying"
		#flying()
	#else:
	#	status = "running"
	#	running()
		
		


	



