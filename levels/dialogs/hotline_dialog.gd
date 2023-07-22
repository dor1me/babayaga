extends Node2D

@onready var chat = $chat

func create_label(str):
	var label = Label.new()
	
	
	label.position.x = 10
	label.text = str
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART;
	label.size.y = label.get_line_height()*label.get_line_count()
	label.size.x = chat.size.x - 20
	
	chat.add_child(label)
	
	# move up
	for child in chat.get_children(false):
		if child == label:
			continue
		child.position.y -= label.size.y + 20;

	label.position.y = chat.size.y - label.size.y
	
	
	return label



func generate_text():
	var str = ""
	var n = String.num(chat.get_child_count(false));
	for i in randi()%3+1:
		if str.length() !=0:
			str += "\r"
			
		str += n + ") das sd fas dfa asd"
		
	return str

func _on_button_pressed():
	var label = create_label(generate_text())
	
