extends AnimatedSprite

var health = 100
var stamina = 100


func _on_Timer_timeout():
	get_tree().quit()
