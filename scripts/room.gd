extends Control


onready var viewport = get_viewport()


func saveviewport():
	var vt = viewport.get_texture()
	var img = vt.get_data()
	img.flip_y()
	img.resize(400,300)
	img.lock()
	img.save_png("res://test.png")

func _ready():
	saveviewport()



func _viewportupdater():
	saveviewport()
	$screen.updatetex()


var c=0
func _on_1seccounter_timeout():
	c+=1
	match c:
		5: $welcome.show()
