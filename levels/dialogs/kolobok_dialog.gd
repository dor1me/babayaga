extends BaseDialog

@onready var typing_sound = $typing

var messages = [
	"Здравствуйте, круглый мой дружочек!\rНе запрыгнешь на носочек!?",
	"Ой, Яга, не хохочи!\rЯ не тот уж, не свищи -\rЯ теперь 'клубок учёный',\rА не гриб какой моченый!\rВсё, что хочешь вопрошай -\rИ ответов ожидай",
	"Не видал ли...",
	"Ой, видал\rМного ль, мало ль... Каравай.\rИ кровать, и стул и ложку...\rЯ сварил вчера окрошку!",
	"Ой, касатик, мне б Кощея...\rА не то одна идея...",
	"Эт не знаю, может Ырка!\rВот она то здесь пронырка..."
]

var answers = [
	"Ну а ты так и остался\rПростаком и оборванцем!\rМожно многое сменить,\rНо души в тебя не вшить!", 
	"Ладно-ладно, полечу -\rЫрку может отыщу.\rА совет благодарю - \rПомощь делу моему."]

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
	if Input.is_action_just_released("lkm_mouse") and can_click:
		can_click = false
		conversation()
		pass		
