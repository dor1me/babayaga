extends Node2D
class_name BaseDialog

@onready var chat = $chat

var timer
var question

var left_texture

var last_label
var last_label_back
var last_label_message

var image_left = load("res://maps/chat/left.png")
var image_right = load("res://maps/chat/right.png")
var image_question = load("res://maps/chat/question.png")


func _ready():
	timer = Timer.new()
	question = NinePatchRect.new()
	
	timer = Timer.new()
	timer.timeout.connect(_on_timer_timeout)	
	timer.wait_time = 0.01
	self.add_child(timer)
	
	
	question.texture = ImageTexture.create_from_image(image_question)
	question.size.x = 500
	question.size.y = 300
	question.position.x = 100
	question.position.y = 400
	question.patch_margin_bottom = 40
	question.patch_margin_top = 40
	question.patch_margin_left = 40
	question.patch_margin_right = 40
	question.visible = false
	self.add_child(question)

func close_dialog():
	G.close_dialog(self)
	

func ask_question(answers):
	var answer_funcs = [
		_on_answer0_pressed,
		_on_answer1_pressed,
		_on_answer2_pressed,
		_on_answer3_pressed,
		_on_answer5_pressed,
		_on_answer4_pressed,
		_on_answer5_pressed,
		_on_answer6_pressed,
		_on_answer7_pressed,
		_on_answer8_pressed,
		_on_answer9_pressed
	]
	
	
	for child in question.get_children():
		question.remove_child(child)
		
	var height = 0
	var i = 0;
	for answer in answers:
		var button = Button.new()
		button.text = answer
		button.add_theme_font_size_override("font_size", 24)
		button.size.x = question.size.x - 100
		button.position.x = 40
		button.position.y = 30 + height
		button.pressed.connect(answer_funcs[i])
		i += 1
		question.add_child(button)
		
		if button.size.y<60:
			button.size.y = 60
		
		height += button.size.y + 10
	
	question.size.y = height +80
	question.visible = true

func create_label(str, alignment):
	
	var label = Label.new()
	var image
	var label_offset_x = 0
	if alignment==HORIZONTAL_ALIGNMENT_LEFT: 
		image = image_left
	else:
		image = image_right
		label_offset_x = 200
		
	label.visible = false
	#label.horizontal_alignment = alignment
	
	
	
	var texture = image
	label.add_theme_font_size_override("font_size", 24)
	label.add_theme_color_override("font_color", Color.BLACK)
	chat.add_child(label)
	label.position.x = 60+label_offset_x
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART;
	label.text = " "
	
	
	
	label.size.x = chat.size.x - 340
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

func on_answer_question(index):
	close_dialog()
	pass

func _on_answer0_pressed():
	question.visible = false
	on_answer_question(0)
		
func _on_answer1_pressed():
	question.visible = false
	on_answer_question(1)
	
func _on_answer2_pressed():
	question.visible = false
	on_answer_question(2)
	
func _on_answer3_pressed():
	question.visible = false
	on_answer_question(3)
	
func _on_answer4_pressed():
	question.visible = false
	on_answer_question(4)
	
func _on_answer5_pressed():
	question.visible = false
	on_answer_question(5)
	
func _on_answer6_pressed():
	question.visible = false
	on_answer_question(6)
	
func _on_answer7_pressed():
	question.visible = false
	on_answer_question(7)
	
func _on_answer8_pressed():
	question.visible = false
	on_answer_question(8)
	
func _on_answer9_pressed():
	question.visible = false
	on_answer_question(9)
	

func _on_timer_timeout():
	var current_len = last_label.text.length()
	
	if current_len < last_label_message.length():
		var new_text = last_label_message.left(current_len+1)
		update_label_text(new_text)
		if current_len+1 == last_label_message.length():
			timer.stop()
			_on_end_typing_message()
