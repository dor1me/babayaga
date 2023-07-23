extends Node2D

var dust_class = preload("res://components/dust.tscn")

func _on_button_pressed():
	for i in 50:
		var dust_node = dust_class.instantiate()
		
		dust_node.velocity = Vector2(randi()%10 * 0.1,0.2)
		dust_node.radius = 15
		dust_node.opacity = 0.3
		var color_offset = (randf()-0.5)*0.2
		dust_node.color = Color(0.5+color_offset, 0.5+color_offset, 0.5+color_offset)
		var offset = Vector2(randi()%40-20,randi()%40-20)
		dust_node.position = Vector2(600,100)+offset
		get_tree().get_root().add_child(dust_node)
	
	
	
