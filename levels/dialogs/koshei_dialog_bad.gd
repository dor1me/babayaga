extends "res://levels/dialogs/base_dialog.gd"

@onready var say1 = $Button
@onready var say2 = $Button2

var messages = [
	"Вот те раз! Какие люди!\rА чего не в Халивуде?\rТы чего здесь позабыл?\rИли от МЕНЯ уплыл!?",
	"Ох, прости, моя старушка,\rНо уж нервы не игрушка.\rНе могу терпеть твой крик,\rКак начнёшь - готовь побег!",
	"Ах вот так заговорил!?\rНу ты глянь - мозги пропил!\rЯ ж тебе и для тебя!\rЯ ж тебя всею себя!",
	"Ты прости меня, родная,\rНо, видать, не перестало\rСердце у меня шалить:\rЧуть вскричу - и сразу ныть.\rНо тебя не прекращая,\rНавсегда отождествляя\rСо богиней красоты, справедливости, любви,\rНесравненная царевна,\rЯ люблю тебя безмерно!",
	"Нет уж, нет уж! Врешь, чудак!\rЗнаю я таких писак -\rВсюду буквы, всюду речи, а копнешь - \rТо черт излечишь!\rЧто ж, раз так - я ухожу.\rВпредь тобой не дорожу.\rОставайся, убирайся,\rХоть к луне иди слоняйся!",
]

var x = 0
func _on_end_typing_message():
	x+=1
	if(x < messages.size()):
		say1.disabled = x%2==0
		say2.disabled = !x%2==0

func conversation():
	say1.disabled = true
	say2.disabled = true
	if x%2==1:
		create_label(messages[x],HORIZONTAL_ALIGNMENT_RIGHT)
	else: 
		create_label(messages[x],HORIZONTAL_ALIGNMENT_LEFT)
var answers = ["Ну а ты так и остался\rПростаком и оборванцем!\rМожно многое сменить,\rНо души в тебя не вшить!", "Ладно-ладно, полечу -\rЫрку может отыщу.\rА совет благодарю - \rПомощь делу моему."]

func _on_button_2_pressed():
	conversation()


func _on_button_pressed():
	conversation()
	
	
