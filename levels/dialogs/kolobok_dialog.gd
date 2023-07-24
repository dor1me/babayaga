extends "res://levels/dialogs/base_dialog.gd"

@onready var say1 = $Button
@onready var say2 = $Button2
@onready var typing_sound = $typing


var messages = [
	"Здравствуйте, круглый мой дружочек!\rНе запрыгнешь на носочек!?",
	"Ой, Яга, не хохочи!\rЯ не тот уж, не свищи -\rЯ теперь 'клубок учёный',\rА не гриб какой моченый!\rВсё, что хочешь вопрошай -\rИ ответов ожидай",
	"Не видал ли...",
	"Ой, видал\rМного ль, мало ль... Каравай.\rИ кровать, и стул и ложку...\rЯ сварил вчера окрошку!",
	"Ой, касатик, мне б Кощея...\rА не то одна идея...",
	"Эт не знаю, может Ырка!\rВот она то здесь пронырка..."
	
	
	
]

var x = 0
func _on_end_typing_message():
	x+=1
	if(x < messages.size()):
		say1.disabled = x%2==0
		say2.disabled = !x%2==0


func conversation():
	typing_sound.play()
	say1.disabled = true
	say2.disabled = true
	if x%2==1:
		create_label(messages[x],HORIZONTAL_ALIGNMENT_RIGHT)
	else: 
		create_label(messages[x],HORIZONTAL_ALIGNMENT_LEFT)
	typing_sound.stop()
var answers = ["Ну а ты так и остался\rПростаком и оборванцем!\rМожно многое сменить,\rНо души в тебя не вшить!", "Ладно-ладно, полечу -\rЫрку может отыщу.\rА совет благодарю - \rПомощь делу моему."]

func _on_button_2_pressed():
	conversation()


func _on_button_pressed():
	conversation()
	
