extends Node2D



onready var pg = $pg
onready var gate = $gate
onready var gatelabel = $gatelabel
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func changescene(vp, scene):
	for child in vp.get_children(): child.queue_free()
	vp.add_child(load(scene).instance())



func _process(delta):
	if pg.position.x>810:
		pg.position.x = -5
		gate.show()
	elif pg.position.x < -10:
		pg.position.x = 805
		gate.show()
		
	if pg.position.y>610:
		pg.position.y = -5
		gate.show()
	elif pg.position.y < -10:
		pg.position.y = 605
		gate.show()

var insidegate = false
func _input(event):
	if Input.is_key_pressed(KEY_E) and insidegate:
		changescene(get_viewport(),"res://scenes/gate.tscn")
	

func _on_Area2D_body_entered(body):
	insidegate = true
	gatelabel.show()

func _on_Area2D_body_exited(body):
	insidegate = false
	gatelabel.hide()
