extends AnimatedSprite

var health = 100

func _on_Timer_timeout():
	get_tree().change_scene("res://NewGameScreen.tscn")
