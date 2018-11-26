extends AnimatedSprite

var health = 100


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if health <= 0:
		$TextureRect/Player.animation = "Die_Elf_1"
		$Timer.start()
	pass


func _on_Timer_timeout():
	get_tree().change_scene("res://NewGameScreen.tscn")