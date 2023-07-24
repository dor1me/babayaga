extends "res://levels/dialogs/base_dialog.gd"

@onready var say1 = $Button
@onready var say2 = $Button2

var messages = [
	"Ой, касатик! Ой, любимый!\rТак давно меня покинул!\rНи вороны, ни словечка -\rЯ ж сгораю точно свечка!",
	"Милая моя старушка,\rНе вини, но вот отдушка:\rЗдесь сидел с начала тура,\rХороша то синекура...",
	"Ничего не понимаю...\rРазве дома докучаю?",
	"Ты, Яга, краса и диво,\rСердце, да, твоё ретиво,\rНо характер, голосок...\rЯ кончаюсь - вот урок!",
	"Да к сказал бы, солнце ясно!\rПонимаю ж я прекрасно - \rВсё бывает, всё в порядке,\rНо теперь летим обратно.",
	"Люба ты моя царица!\rНу прости меня глупицу!\rПылесос я починю,\rДо избушки отвезу!"
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
	if x%2==0:
		create_label(messages[x],HORIZONTAL_ALIGNMENT_RIGHT)
	else: 
		create_label(messages[x],HORIZONTAL_ALIGNMENT_LEFT)

func _on_button_2_pressed():
	conversation()


func _on_button_pressed():
	conversation()
	
