extends Node2D
class_name BaseLevel

@export var player_attack_multiplier : float = 1
@export var cleaner_enabled : bool = true

@onready var hud : Hud = $hud
@onready var portal : Area2D = $portal
@onready var portal_wall : CharacterBody2D = $portal_wall
@onready var dialog_portal : DialogPortal = $portal_dialog

func _ready():
	G.level_enemy_count = get_enemy_count()
	if hud != null:
		hud.update()

func update_hud():
	if hud:
		hud.update()

func update_sobes():
	if dialog_portal:
		dialog_portal.enable()

func open_portal():
	if portal_wall:
		portal_wall.collision_layer = 0
	

func get_enemy_count():
	var count = 0
	for node in get_children(false):
		if node as BaseEnemy:
			count += 1
	
	return count
	
func on_enemy_die(enemy : BaseEnemy):
	G.on_enemy_die(self, enemy)

func on_dialog_close():
	open_portal()
	pass
