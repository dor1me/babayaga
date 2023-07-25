extends BaseDialog

@onready var typing_sound = $typing

var messages = [
	"Ой, касатик! Ой, любимый!\rТак давно меня покинул!\rНи вороны, ни словечка -\rЯ ж сгораю точно свечка!",
	"Милая моя старушка,\rНе вини, но вот отдушка:\rЗдесь сидел с начала тура,\rХороша то синекура...",
	"Ничего не понимаю...\rРазве дома докучаю?",
	"Ты, Яга, краса и диво,\rСердце, да, твоё ретиво,\rНо характер, голосок...\rЯ кончаюсь - вот урок!",
	"Да к сказал бы, солнце ясно!\rПонимаю ж я прекрасно - \rВсё бывает, всё в порядке,\rНо теперь летим обратно.",
	"Люба ты моя царица!\rНу прости меня глупицу!\rПылесос я починю,\rДо избушки отвезу!"
]

var answers = [
	"Понятно."]

var can_click = true
var x = 0

func _ready():
	super()
	conversation()

func _on_end_typing_message():
	x+=1
	if(x < messages.size()):
		typing_sound.stop()
		can_click = true
	else:
		ask_question(answers)

func conversation():
	typing_sound.play()
	if x%2==1:
		create_label(messages[x],HORIZONTAL_ALIGNMENT_RIGHT)
	else: 
		create_label(messages[x],HORIZONTAL_ALIGNMENT_LEFT)
	

func on_answer_question(index):
	create_label(answers[index],HORIZONTAL_ALIGNMENT_LEFT)
	
	close_dialog()
	
func _physics_process(delta):
	if Input.is_action_pressed("lkm_mouse") and can_click:
		can_click = false
		conversation()
		pass		
	
	
