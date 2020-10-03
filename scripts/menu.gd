extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func changescene(vp, scene):
	for child in vp.get_children(): child.queue_free()
	vp.add_child(load(scene).instance())

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if Input.is_key_pressed(KEY_E):
		changescene(get_viewport(),"res://scenes/cave.tscn")


func _on_istructions_pressed():
	$istructions_text.show()


func _on_credits_pressed():
	$credits_text.show()
