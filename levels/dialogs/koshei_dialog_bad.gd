extends BaseDialog

@onready var typing_sound = $typing

var messages = [
	"Вот те раз! Какие люди!\rА чего не в Халивуде?\rТы чего здесь позабыл?\rИли от МЕНЯ уплыл!?",
	"Ох, прости, моя старушка,\rНо уж нервы не игрушка.\rНе могу терпеть твой крик,\rКак начнёшь - готовь побег!",
	"Ах вот так заговорил!?\rНу ты глянь - мозги пропил!\rЯ ж тебе и для тебя!\rЯ ж тебя всею себя!",
	"Ты прости меня, родная,\rНо, видать, не перестало\rСердце у меня шалить:\rЧуть вскричу - и сразу ныть.\rНо тебя не прекращая,\rНавсегда отождествляя\rСо богиней красоты, справедливости, любви,\rНесравненная царевна,\rЯ люблю тебя безмерно!",
	"Нет уж, нет уж! Врешь, чудак!\rЗнаю я таких писак -\rВсюду буквы, всюду речи, а копнешь - \rТо черт излечишь!\rЧто ж, раз так - я ухожу.\rВпредь тобой не дорожу.\rОставайся, убирайся,\rХоть к луне иди слоняйся!",
]

func _ready():
	super()
	conversation()

var can_click = false
var x = 0

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


func _on_end_typing_message():
	x+=1
	if(x < messages.size()):
		typing_sound.stop()
		can_click = true
	else:
		show_end()

func conversation():
	typing_sound.play()
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
	
