extends KinematicBody2D

const MAX_SPEED = 500
const ACCEL = 500
const FRICTION = 900
const JUMP = 600
var key = false
var coinCounter = 0
var gravity = 950
onready var anim = $AnimatedSprite
var on_ladder = false
var completed = false

var velocity = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("Idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = move_toward(velocity.x, MAX_SPEED, ACCEL * delta)
		anim.play("Walking")
		anim.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = move_toward(velocity.x, -MAX_SPEED, ACCEL * delta)
		anim.play("Walking")
		anim.flip_h = true
	else:
		if on_ladder == false:
			velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
			anim.play("Idle")
	
	if(Input.is_action_just_pressed("ui_select") and is_on_floor()):
		velocity.y = -JUMP
	if not is_on_floor() and on_ladder == false:
		anim.play("Jumping")
		
	if(on_ladder == true):
		gravity = 0
		if(Input.is_action_pressed("ui_up")):
			velocity.y = -MAX_SPEED/2
			anim.play("Climbing")
		if(Input.is_action_just_pressed("ui_down")):
			velocity.y = MAX_SPEED/2
			anim.play("Climbing")
	else:
		gravity = 950
	
	if(coinCounter == 5 and key == true):
		completed = true
		

func _physics_process(delta):
	# gravity
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	
	
func _on_AddJump_body_entered(body):
	velocity.y = -JUMP

