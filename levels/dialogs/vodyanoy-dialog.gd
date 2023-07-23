extends "res://levels/dialogs/base_dialog.gd"

var messages = [
	"Ты откуда здесь, Яга!?",
	"Да, летела к вам пол дня!", 
	"Где метёлка-то? Сломала?",
	"Эть те раз! Вот так попала!...\rМётлы — это прошлый век!\rСовременный человек,\rКоль решил гонять всерьёз,\rВыбирает пылесос!",
	"От меня то чего хочешь?\rЗнаю, что ничто не прочишь...",
	"Муженька бы моего...",
	"Не не не, Яга, постой!\rНе покроется с лихвой...\rДа и время, да и силы...\rНе, старушка... Не, на вилы!"
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
	
