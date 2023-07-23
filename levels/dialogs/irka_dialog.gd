extends "res://levels/dialogs/base_dialog.gd"

var messages = [
	"Добрый вечер, берегиня!\rМне б вопрос у тебе, княгиня,\rПопытаться отыскать\rМне б Кощея, да не ждать.",
	"Ой, любовь! Подумать диво!\rМожет сгнил уж твой любимый!\rДа и не моя та сила, чтоб от чувств не воротило!",
	"Ырка, душенька, прошу!\rНе могу я! Пропаду!\rТы знаешь, что да как...\rЗнаешь вон, где чей кушак!",
	"Не надейся, я бессильна,\rДа и дела нет мне сильно...\rНо Кощей, пожалуй, в лес\rЗря полез и... до небес."
]

var x = 0
func _on_end_typing_message():
	x+=1
	if(x < messages.size()):
		say1.disabled = !x%2==0
		say2.disabled = x%2==0

func conversation():
	say1.disabled = true
	say2.disabled = true
	if x%2==0:
		create_label(messages[x],HORIZONTAL_ALIGNMENT_RIGHT)
	else: 
		create_label(messages[x],HORIZONTAL_ALIGNMENT_LEFT)


func _on_button_2_pressed():
	conversation()


func _on_button_pressed():
	conversation()
	
