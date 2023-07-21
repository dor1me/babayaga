extends Node2D

var player_speed = 180
var jump_velocity = -300
var player_hp = 300
var player_attack = 70
var player_ultimate = 0
var player_bad_choise = 0
var player_posx = 200
var player_posy = 80
var player_status = "running"


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
	"cavelevel": preload("res://levels/cavelevel.tscn"),
	"kosckhei": preload("res://levels/kosckhei.tscn")
}

var loading = preload("res://scenes/loading.tscn")
var lastloading = preload("res://scenes/lastloading.tscn")

var current_level = "underlevel1"

func _ready():
	pass

func exit(): 
	get_tree().quit()

func new_game():
	pass

func reload():
	get_tree().reload_current_scene();
	
func change_to_next_level():
	current_level = next_level
	get_tree().change_scene_to_packed(levels[next_level])
	
func goto_level(to_level):
	if current_level == to_level:
		return
		
	if levels.has(to_level):
		next_level = to_level
		get_tree().change_scene_to_packed(loading)
		
func goto_exit():
	get_tree().change_scene_to_packed(lastloading)



