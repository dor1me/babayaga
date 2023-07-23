extends CharacterBody2D

var H_SPEED =  G.player_speed
var V_SPEED = G.player_speed
var F_SPEED = G.player_speed
var JUMP_VELOCITY = G.jump_velocity
var health = G.player_hp
var attack = G.player_attack
var status =  G.player_status
var x = G.player_posx

var end_dialog = false

#var y = G.player
@onready var shape = $CollisionShape2D
@onready var zindex = $AnimatedSprite2D
@onready var _animated_sprite = $AnimatedSprite2D
@onready var camera = $Camera2D
@onready var cleaner_label = $CleanerHP


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") * 1.5

var flying = false
var flying_wave = 0;
var flying_wave_delta = 1
var flying_wave_range = 20

var cleaner_hp = 20


func diagonal():
	if shape.position.x < 820 and shape.position.y < 460 :
		shape.disabled = true
		velocity.x += H_SPEED * 1.5
		velocity.y -= V_SPEED / 7
	_animated_sprite.play("fly")
		
func _physics_process(delta):
	
	
	cleaner_label.set_text(String.num(cleaner_hp,0))
	
		
		
	if flying:
		
		if cleaner_hp <= 0:
			cleaner_hp = 0
			flying = false
			
		if cleaner_hp > 0:
			cleaner_hp -= 0.1
		
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
		
		if !Input.is_action_pressed("shift"):
				flying = false
		
	#not flying
	else: 
		
		velocity.x = H_SPEED * (Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left"))
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
				velocity.y = JUMP_VELOCITY
				
		_animated_sprite.play("run")
		if Input.is_action_pressed("ui_right"):
			_animated_sprite.flip_h = false
		elif Input.is_action_pressed("ui_left"):
			_animated_sprite.flip_h = true
			
		else: 
			_animated_sprite.play("idle")
		
		if Input.is_action_pressed("lkm_mouse"):
			_animated_sprite.play("attack")
		
		if not is_on_floor() && Input.is_action_pressed("shift") && cleaner_hp > 10:
			flying = true
		if is_on_floor():
			if cleaner_hp < 40:
				cleaner_hp += 0.1
				
			if cleaner_hp > 10 && Input.is_action_pressed("shift"):
				flying = true
			
		else:	
			velocity.y += gravity * delta
	
	
	if Input.is_action_pressed("ui_cancel"):
		end_dialog = true
	
	if end_dialog == true: 
		diagonal()
		
	#shape.disabled = false

	#var collision = move_and_collide(velocity, true)
	#if collision:
	#	print("I collided with ", collision.get_collider().name)

	# Using move_and_slide.
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		print("I collided with ", collision.get_collider().name)
	
	
