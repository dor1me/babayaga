extends Node2D


func _on_video_stream_player_finished():
	#get_tree().change_scene_to_packed(preload("res://levels/startlevel.tscn"))
	#
	print(G._next_level)
	
	G.change_to_next_level()
	return

	
