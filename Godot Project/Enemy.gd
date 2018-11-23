extends AnimatedSprite

var health = 100

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if health <= 0:
		animation = "Die_Troll_1"
		$Timer.start()
		health = 1


func _on_Timer_timeout():
	get_tree().change_scene("res://NewGameScreen.tscn")
