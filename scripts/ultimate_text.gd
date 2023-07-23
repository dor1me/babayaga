extends Label

var ultimate = G.player_ultimate
# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = ultimate.toString()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
