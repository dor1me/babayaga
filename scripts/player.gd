extends CharacterBody2D

var SPEED = G.player_speed
var JUMP_VELOCITY = G.jump_velocity
var health = G.player_hp
var attack = G.player_attack
var x = G.player_posx
#var y = G.player
@onready var shape = $CollisionShape2D
@onready var zindex = $AnimatedSprite2D
@onready var _animated_sprite = $AnimatedSprite2D
@onready var camera = $Camera2D

	


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#onready var _animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_just_pressed("ui_text_completion_replace"):
		_animated_sprite.play("jump")
		velocity.y += JUMP_VELOCITY
		velocity.x += 150
		#while 
		velocity.y += JUMP_VELOCITY
		velocity.x += SPEED
		zindex.z_index = 5
		shape.disabled = true
		
	if Input.is_action_pressed("ui_right"):
		x += velocity.x
		_animated_sprite.play("run")
	else:
		_animated_sprite.play("idle")
	
	if Input.is_action_pressed("ui_left"):
		x -= velocity.x
	move_and_slide()



