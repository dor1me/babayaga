extends BaseDialog

@onready var typing_sound = $typing
@onready var end = $ges

var messages = [
	"Ой, касатик! Ой, любимый!\rТак давно меня покинул!\rНи вороны, ни словечка -\rЯ ж сгораю точно свечка!",
	"Милая моя старушка,\rНе вини, но вот отдушка:\rЗдесь сидел с начала тура,\rХороша то синекура...",
	"Ничего не понимаю...\rРазве дома докучаю?",
	"Ты, Яга, краса и диво,\rСердце, да, твоё ретиво,\rНо характер, голосок...\rЯ кончаюсь - вот урок!",
	"Да к сказал бы, солнце ясно!\rПонимаю ж я прекрасно - \rВсё бывает, всё в порядке,\rНо теперь летим обратно.",
	"Люба ты моя царица!\rНу прости меня глупицу!\rПылесос я починю,\rДо избушки отвезу!"
]

func on_timeout():
	G.change_level_quick("bad_end")

func show_end():
	var t = Timer.new()
	t.set_wait_time(4)
	t.set_one_shot(true)
	t.connect.timeout(on_timeout)
	self.add_child(t)
	t.start()
	pass	

var can_click = false
var x = 0

func _ready():
	super()
	conversation()

func _on_end_typing_message():
	x+=1
	if(x < messages.size()):
		typing_sound.stop()
		can_click = true
	show_end()

func conversation():
	if x%2==1:
		create_label(messages[x],HORIZONTAL_ALIGNMENT_RIGHT)
	else: 
		create_label(messages[x],HORIZONTAL_ALIGNMENT_LEFT)
	

func on_answer_question(index):
	show_end()
	
func _physics_process(delta):
	if Input.is_action_just_released("lkm_mouse") and can_click:
		can_click = false
		conversation()
		pass		
	
	
