extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var body = $CollisionShape2D




func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	

	move_and_slide()
