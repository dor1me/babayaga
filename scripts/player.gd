extends CharacterBody2D

var H_SPEED = G.player_speed
var V_SPEED = G.player_speed
var F_SPEED = G.player_speed
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
	
	var flying = Input.is_action_pressed("shift")
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = H_SPEED 
		_animated_sprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -H_SPEED
		_animated_sprite.play("flipped run")
	else: 
		_animated_sprite.play("idle")
		velocity.x = 0
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
		
	if flying:
		_animated_sprite.play("fly")
		velocity.y = F_SPEED * (Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up"))
		velocity.x = F_SPEED * (Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left"))
		
	#not flying
	else: 
		velocity.x = H_SPEED * (Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left"))
		if is_on_floor():
			if Input.is_action_pressed("ui_right"):
				_animated_sprite.play("run")
			elif Input.is_action_pressed("ui_left"):
				_animated_sprite.play("flipped run")
			else: 
				_animated_sprite.play("idle")
			
		else:	
			velocity.y += gravity * delta
	
	
	move_and_slide()

	



