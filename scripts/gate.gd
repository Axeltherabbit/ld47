extends Node2D

onready var pg = $pg

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if pg.position.x>810:
		pg.position.x = -5
	elif pg.position.x < -10:
		pg.position.x = 805
	if pg.position.y>610:
		pg.position.y = -5
	elif pg.position.y < -10:
		pg.position.y = 605



func _on_LineEdit_text_entered(new_text):
	$Iam.hide()
	$whoare.hide()
	$LineEdit.hide()
	$areyou.show()
	$YesButton.show()
	$NoButton.show()

var c=0
func _on_Timer_timeout():
	c+=1
	match c:
		1: $Iam.show()
		2: $whoare.show()
		3: $LineEdit.show()


func _on_YesButton_pressed():
	get_tree().change_scene("res://scenes/room.tscn")


func _on_NoButton_pressed():
	$NoButton.hide()
	$yesyou.show()
