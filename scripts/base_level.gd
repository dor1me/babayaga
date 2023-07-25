extends Node2D
class_name BaseLevel

@export var player_attack_multiplier : float = 1
@export var cleaner_enabled : bool = true

@onready var hud : Hud = $hud


func _ready():
	G.level_enemy_count = get_enemy_count()
	if hud != null:
		hud.update()

func update_hud():
	if hud:
		hud.update()

func get_enemy_count():
	var count = 0
	for node in get_children(false):
		if node as BaseEnemy:
			count += 1
	
	return count
	
func on_enemy_die(enemy : BaseEnemy):
	G.on_enemy_die(self, enemy)

func on_dialog_close():
	pass
