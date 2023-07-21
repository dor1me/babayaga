extends Area2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var speed = G.small_kolobok_speed
var attack = G.small_kolobok_attack
var hp = G.small_kolobok_hp
@onready var player = $"../player"
@onready var body = $CollisionShape2D




func _physics_process(delta):
	if position.x < player.position.x:
		position.x += SPEED / 100 
	elif position.x > player.position.x:
		position.x -= SPEED / 100 

