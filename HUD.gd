extends CanvasLayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Coins.text = "Coins: " + str(get_parent().get_parent().coinCounter)
	if(get_parent().get_parent().key == false):
		$Key.text = "Key Not Found"
	else:
		$Key.text = "Key Found"


func _on_World_display_victory():
	$ColorRect.visible = true
	$victorySound.play()
	
