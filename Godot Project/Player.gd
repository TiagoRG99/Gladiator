extends AnimatedSprite

var health = 100


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if health <= 0:
		print ("dead")
	pass
