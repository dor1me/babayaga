extends Node2D

@onready var chat = $chat
@onready var say1 = $Button
@onready var say2 = $Button2

var left_texture



func create_label(str, alignment):
	var label = Label.new()
	var image
	var label_offset_x = 0
	if alignment==HORIZONTAL_ALIGNMENT_LEFT: 
		image = Image.load_from_file("res://maps/chat/left.png")
	else:
		image = Image.load_from_file("res://maps/chat/right.png")
		label_offset_x = 100
		
	label.horizontal_alignment = alignment
	
	
	
	var texture = ImageTexture.create_from_image(image)
	label.add_theme_font_size_override("font_size", 24)
	label.add_theme_color_override("font_color", Color.BLACK)
	chat.add_child(label)
	label.position.x = 60+label_offset_x
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART;
	label.text = str
	
	
	label.size.x = chat.size.x - 240
	label.size.y = label.get_line_height()*label.get_line_count()
	
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
	
	
	# move up
	for child in chat.get_children(false):
		if child == label:
			continue
		child.position.y -= label.size.y + label.get_line_height()+60;

	label.position.y = chat.size.y - label.size.y -120
	
	
	return label

var messages = [
	"Здравствуйте, круглый мой дружочек!\rНе запрыгнешь на носочек!?",
	"Ой, Яга, не хохочи!"
]

var x = 0

func conversation():
	if x%2==0:
		create_label(messages[x],HORIZONTAL_ALIGNMENT_RIGHT)
		say1.disabled = true
		say2.disabled = false
		
	else: 
		create_label(messages[x],HORIZONTAL_ALIGNMENT_LEFT)
		say1.disabled = false
		say2.disabled = true
		
	x+=1
	
	if(x > messages.size()-1):
		say1.disabled = true
		say2.disabled = true


func _on_button_2_pressed():
	conversation()


func _on_button_pressed():
	conversation()
	
