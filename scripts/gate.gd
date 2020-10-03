extends Node2D

onready var pg = $pg


func changescene(vp, scene):
	for child in vp.get_children(): child.queue_free()
	vp.add_child(load(scene).instance())

# Called when the node enters the scene tree for the first time.
func _input(event):
	if $yesno.is_visible():
		if Input.is_key_pressed(KEY_N):
			$yesyou.show()
		if Input.is_key_pressed(KEY_Y):
			changescene(get_viewport(),"res://scenes/room.tscn")

func _process(delta):
	if pg.position.x>810:
		pg.position.x = -5
	elif pg.position.x < -10:
		pg.position.x = 805
	if pg.position.y>610:
		pg.position.y = -5
	elif pg.position.y < -10:
		pg.position.y = 605


var c=0
func _on_Timer_timeout():
	c+=1
	match c:
		1: $Iam.show()
		2: $whoare.show()
		3: $areyou.show()
		4: $yesno.show()
