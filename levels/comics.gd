extends Node2D

var slide = 1

func set_slide_visiblity(slide_num, visiblity):
	get_node("slide"+String.num(slide_num)).visible = visiblity

func next():
	if slide == 6:
		G.change_level_quick("start")
		#G.goto_level("start")
	else:
		slide+=1
		return
		
	set_slide_visiblity(slide, false)
	slide +=1
	set_slide_visiblity(slide, true)
	
	
func prev():
	if slide == 1:
		return
		
	set_slide_visiblity(slide, false)
	slide -=1
	set_slide_visiblity(slide, true)
	

func _process(delta):
	if Input.is_action_just_released("lkm_mouse"):
		next()
