extends Label

var health = G.player_hp


# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = health.toString()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
