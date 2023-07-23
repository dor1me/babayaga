extends CharacterBody2D


var speed = G.small_kolobok_speed
var attack = G.small_kolobok_attack
var hp = G.small_kolobok_hp
@onready var player = $"../player"
@onready var body = $CollisionShape2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	var direction
	if position.x > player.position.x:
		velocity.x = -speed
	else:
		velocity.x = speed
	
	if ! is_on_floor():
		velocity.y += gravity * delta
	
	move_and_slide()
