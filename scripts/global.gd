extends Node2D

var player_speed = 400
var jump_velocity = -600
var player_hp = 100
var player_attack = 70
var player_ultimate = 100
var player_bad_choise = 0
var player_posx = 200
var player_posy = 80
var player_status = "running"
var player_bullets = 5



var small_kolobok_speed = 100
var small_kolobok_hp = 100
var small_kolobok_attack = 30

var big_kolobok_speed = 60
var big_kolobok_hp = 300
var big_kolobok_attack = 50

var next_level

var levels = {
	"underlevel": preload("res://levels/underlevel.tscn"),
	"hotline": preload("res://levels/hotline.tscn"),
	#"kosckhei": preload("res://levels/kosckhei.tscn"),
}

var dialogs = {
	"kolobok": preload("res://levels/dialogs/kolobok_dialog.tscn"),
	"vodyanoy": preload("res://levels/dialogs/vodyanoy-dialog.tscn"),
	"irka": preload("res://levels/dialogs/irka_dialog.tscn"),
}

var loading = preload("res://scenes/loading.tscn")
var lastloading = preload("res://scenes/lastloading.tscn")

var current_level = ""
var bad_end = preload("res://levels/hotline.tscn")
var good_end = preload("res://levels/kosckhei.tscn")
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
		current_level = good_end
	else:
		current_level = bad_end
		
#func goto_last_level():
	#goto_level("kosckhei")
	



