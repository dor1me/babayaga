extends Area2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var speed = G.small_kolobok_speed
var attack = G.small_kolobok_attack
var hp = G.small_kolobok_hp
var player_posx = G.player_posx
@onready var kolobok_posx = $Node2D
@onready var body = $CollisionShape2D




func _physics_process(delta):
	if position.x < player_posx:
		position.x += SPEED / 10 
	elif position.x > player_posx:
		position.x -= SPEED / 10 

