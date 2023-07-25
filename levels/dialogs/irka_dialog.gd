extends BaseDialog

@onready var typing_sound = $typing
@onready var sigh = $sigh

var messages = [
	"Добрый вечер, берегиня!\rМне б вопрос к тебе, княгиня,\rПопытаться отыскать\rМне б Кощея, да не ждать.",
	"Ой, любовь! Подумать диво!\rМожет сгнил уж твой любимый!\rДа и не моя та сила, чтоб от чувств не воротило!",
	"Ырка, душенька, прошу!\rНе могу я! Пропаду!\rТы знаешь, что да как...\rЗнаешь вон, где чей кушак!",
	"Не надейся, я бессильна,\rДа и дела нет мне сильно...\rНо Кощей, пожалуй, в лес\rЗря полез и... до небес."
]


var answers = [
	"(почертыхаться)", 
	"молча уйти"
	]
	
var can_click = false
var x = 0

func _ready():
	sigh.play()
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
	if index == 0:
		G.player_bad_choise += 1
	close_dialog()
	
func _physics_process(delta):
	if Input.is_action_pressed("lkm_mouse") and can_click:
		can_click = false
		conversation()
		pass		




