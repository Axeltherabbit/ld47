extends KinematicBody2D

onready var sprite = $AnimatedSprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


var gravity = -10
var jump = -500
var movement = Vector2()
const speed = 100
var jumpkey = false
var onfloor = false
func _input(event):
	movement.x = (int(Input.is_key_pressed(KEY_D))-int(Input.is_key_pressed(KEY_A)))*speed
	jumpkey = Input.is_key_pressed(KEY_SPACE)

 
func _physics_process(delta):
	if movement.x < 0 : sprite.set_flip_h(true)
	else : sprite.set_flip_h(false)
	
	movement.y -= gravity
	movement.y = min(movement.y,400)
	movement=move_and_slide(movement,Vector2.UP)
	if is_on_floor() and jumpkey:
		movement.y= jump

