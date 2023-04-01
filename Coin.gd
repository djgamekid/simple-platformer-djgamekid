extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Coin_1_body_entered(body):
	get_node("../Player").coinCounter += 1
	queue_free()
	get_parent().coinSound.play()
	
func _on_Coin_2_body_entered(body):
	get_node("../Player").coinCounter += 1
	queue_free()
	get_parent().coinSound.play()
	
func _on_Coin_3_body_entered(body):
	get_node("../Player").coinCounter += 1
	queue_free()
	get_parent().coinSound.play()
	
func _on_Coin_4_body_entered(body):
	get_node("../Player").coinCounter += 1
	queue_free()
	get_parent().coinSound.play()
	
func _on_Coin_5_body_entered(body):
	get_node("../Player").coinCounter += 1
	queue_free()
	get_parent().coinSound.play()
	

