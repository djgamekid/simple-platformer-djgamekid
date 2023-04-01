extends Node2D

signal display_victory

onready var coinSound = $getCoin
onready var keySound = $getKey

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Player/Camera2D/HUD/ColorRect").visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_KillPlane_body_entered(body):
	$Player.position.x = 309
	$Player.position.y = 137


func _on_Door_victory():
	get_tree().paused = true
	emit_signal("display_victory")
