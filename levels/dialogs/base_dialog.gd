extends Node2D

@onready var chat = $chat
@onready var say1 = $Button
@onready var say2 = $Button2

var timer = Timer.new()
var left_texture

var last_label
var last_label_back
var last_label_message


func _ready():
	timer = Timer.new()
	timer.timeout.connect(_on_timer_timeout)	
	timer.wait_time = 0.03
	self.add_child(timer)

func create_label(str, alignment):
	
	var label = Label.new()
	var image
	var label_offset_x = 0
	if alignment==HORIZONTAL_ALIGNMENT_LEFT: 
		image = Image.load_from_file("res://maps/chat/left.png")
	else:
		image = Image.load_from_file("res://maps/chat/right.png")
		label_offset_x = 100
		
	label.visible = false
	label.horizontal_alignment = alignment
	
	
	
	var texture = ImageTexture.create_from_image(image)
	label.add_theme_font_size_override("font_size", 24)
	label.add_theme_color_override("font_color", Color.BLACK)
	chat.add_child(label)
	label.position.x = 60+label_offset_x
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART;
	label.text = " "
	
	
	
	label.size.x = chat.size.x - 240
	label.size.y = label.get_line_height()
	
	var back = NinePatchRect.new();
	back.texture = texture;
	back.patch_margin_bottom = 70
	back.patch_margin_top = 50
	back.patch_margin_left = 50
	back.patch_margin_right = 50
	back.show_behind_parent = true
	
	back.position.x = -60
	back.position.y = -30
	back.size.x = label.size.x+120
	back.size.y = label.size.y+120
	label.add_child(back)
	
	last_label = label
	last_label_back = back
	last_label_message = str
	
	
	update_label_text("")
	
	label.visible = true
	timer.start()

func update_label_text(str):
	last_label.text = str
	last_label.size.y = last_label.get_line_height()*last_label.get_line_count()
	last_label_back.size.y = last_label.size.y+120
	
	# move up
	var height = 0
	var labels = chat.get_children(false)
	for i in range(labels.size(),0,-1):
		var child = labels[i-1];
		height += child.size.y+last_label.get_line_height()+60
		child.position.y = chat.size.y - height
		
		#child.position.y = label.size.y + label.get_line_height()+60;

func _on_end_typing_message():
	pass

func _on_timer_timeout():
	var current_len = last_label.text.length()
	
	if current_len < last_label_message.length():
		var new_text = last_label_message.left(current_len+1)
		update_label_text(new_text)
		if current_len+1 == last_label_message.length():
			timer.stop()
			_on_end_typing_message()
