extends BaseDialog

@onready var typing_sound = $typing

var messages = [
	"Ты откуда здесь, Яга!?",
	"Да, летела к вам пол дня!", 
	"Где метёлка-то? Сломала?",
	"Эть те раз! Вот так попала!...\rМётлы — это прошлый век!\rСовременный человек,\rКоль решил гонять всерьёз,\rВыбирает пылесос!",
	"От меня то чего хочешь?\rЗнаю, что ничто не прочишь...",
	"Муженька бы моего...",
	"Не не не, Яга, постой!\rНе покроется с лихвой...\rДа и время, да и силы...\rНе, старушка... Не, на вилы!"
]
	
	
var answers = [
	"Вот упрямый! Вот наглец!\rПодавись ка, огурец!\rА прохвост... Не изменился...\rТолько с жизнью заблудился!", 
	"Вот те на... Ой, как сложилось...\rНу хоть я не заблудилась.\rЧто ж, касатик, продавай.\rЖаль, что так всё, но бывай."
	]

var can_click = true
var x = 0
func _on_end_typing_message():
	x+=1
	if(x < messages.size()):
		typing_sound.stop()
		can_click = true
	else:
		ask_question(answers)

func conversation():
	typing_sound.play()
	if x%2==0:
		create_label(messages[x],HORIZONTAL_ALIGNMENT_RIGHT)
	else: 
		create_label(messages[x],HORIZONTAL_ALIGNMENT_LEFT)
	

func on_answer_question(index):
	create_label(answers[index],HORIZONTAL_ALIGNMENT_LEFT)
	if index == 0:
		G.player_bad_choise += 1
	close_dialog()
	
func _physics_process(delta):
	if Input.is_action_pressed("lkm_mouse") and can_click:
		can_click = false
		conversation()
		pass		
	
	

	
	
