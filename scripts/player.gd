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
var flying_wave = 0;
var flying_wave_delta = 1
var flying_wave_range = 20

#func flying():
	##	_animated_sprite.play("fly")
	#	gravity = 0
		



func _physics_process(delta):
	
	var flying = Input.is_action_pressed("shift")
	
	
		
		
	if flying:
		_animated_sprite.play("fly")
		if Input.is_action_pressed("ui_right"):
			_animated_sprite.flip_h = false
			
		elif Input.is_action_pressed("ui_left"):
			_animated_sprite.flip_h = true
			
		
		if flying_wave > flying_wave_range || flying_wave < -flying_wave_range:
			flying_wave_delta *=-1
			
		flying_wave += flying_wave_delta
		
		velocity.y = F_SPEED * (Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")) + flying_wave
		velocity.x = F_SPEED * (Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left"))
		
	#not flying
	else: 
		velocity.x = H_SPEED * (Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left"))
		if Input.is_action_just_pressed("ui_accept"):
				velocity.y = JUMP_VELOCITY
		if Input.is_action_pressed("ui_right"):
			_animated_sprite.play("run")
		elif Input.is_action_pressed("ui_left"):
			_animated_sprite.play("flipped run")
		else: 
			_animated_sprite.play("idle")
			
		if is_on_floor():
			pass
			
		else:	
			velocity.y += gravity * delta
	
	
	move_and_slide()

	



