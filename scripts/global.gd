extends Node2D

var player_speed = 400
var jump_velocity = -600

var player_hp : float = 100 : set = _set_player_hp
var player_attack : float = 20 : set = _set_player_attack
var player_ultimate : float = 100 : set = _set_player_ultimate
var player_bullets : int = 5 : set = _set_player_bullets
	
var player_bad_choise = 0
var player_posx = 200
var player_posy = 80
var player_status = "running"


var small_kolobok_speed = 220
var small_kolobok_hp = 100
var small_kolobok_attack = 30

var big_kolobok_speed = 60
var big_kolobok_hp = 300
var big_kolobok_attack = 50


func _set_player_ultimate(value : float):
	player_ultimate=value
	_update_hud()
	
func _set_player_attack(value : float):
	player_ultimate=value
	_update_hud()
	
func _set_player_hp(value : float):
	player_hp=max(value,0)
	if player_hp == 0:
		player_hp = 100
		
	_update_hud()
	
func _set_player_bullets(value : int):
	player_bullets=value
	_update_hud()


func _update_hud():
	#find BaseLevel
	for node in get_tree().get_root().get_children(false):
		if node as BaseLevel:
			node.update_hud()



var next_level

var levels = {
	"kolobok": preload("res://levels/kolobok_level.tscn"),
	"underlevel": preload("res://levels/under_level.tscn"),
	"hotline": preload("res://levels/hotline_level.tscn"),
	"kosckhei": preload("res://levels/kosckhei_level.tscn"),
}

var dialogs = {
	"kolobok": preload("res://levels/dialogs/kolobok_dialog.tscn"),
	"vodyanoy": preload("res://levels/dialogs/vodyanoy-dialog.tscn"),
	"irka": preload("res://levels/dialogs/irka_dialog.tscn"),
	"koshei_bad": preload("res://levels/dialogs/koshei_dialog_bad.tscn"),
	"koshei_good": preload("res://levels/dialogs/koshei_dialog_good.tscn"),
}

var loading = preload("res://scenes/loading.tscn")
var lastloading = preload("res://scenes/lastloading.tscn")

var current_level = ""
var bad_end = preload("res://levels/hotline_level.tscn")
var good_end = preload("res://levels/kosckhei_level.tscn")
var dust_class = preload("res://components/dust.tscn")

func generate_dust(count,start_position,direction):
	for i in count:
		var dust_node = dust_class.instantiate()
		
		dust_node.velocity = Vector2(randi()%10 * 0.1*direction,0.2)
		dust_node.radius = 15
		dust_node.opacity = 0.3
		var color_offset = (randf()-0.5)*0.2
		dust_node.color = Color(0.5+color_offset, 0.5+color_offset, 0.5+color_offset)
		var offset = Vector2(randi()%40-20,randi()%40-20)
		dust_node.position = start_position+offset
		get_tree().get_root().add_child(dust_node)



func _ready():
	pass

func exit(): 
	get_tree().quit()

func new_game():
	pass

func reload():
	get_tree().reload_current_scene();

func goto_dialog(to_dialog):
	if current_level == to_dialog:
		return
	
	if to_dialog == "koshei":
		if player_bad_choise <2:
			to_dialog = "koshei_good"
		else:
			to_dialog = "koshei_bad"
		
		
	if dialogs.has(to_dialog):
		get_tree().change_scene_to_packed(dialogs[to_dialog])


func change_level_quick(to_level):
	if current_level == to_level:
		return
		
	if levels.has(to_level):
		current_level = to_level
		get_tree().change_scene_to_packed(levels[to_level])
	
	
func change_to_next_level():
	if current_level == "hotline":
		ending()
	else:
		current_level = next_level
		get_tree().change_scene_to_packed(levels[next_level])
func goto_level(to_level):
	if current_level == to_level:
		return
		
	if levels.has(to_level):
		next_level = to_level
		get_tree().change_scene_to_packed(loading)
	
func ending():
	if player_bad_choise <= 1:
		current_level = "koshei"
	else:
		current_level = "koshei"
		
#func goto_last_level():
	#goto_level("kosckhei")
	



