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
		7: $startbutton.show()



func enableplat(plat,ena):
	plat.show()
	plat.set_deferred("disabled",false)
	ena.show()
	ena.get_node("CollisionShape").set_deferred("disabled",false)

var buttonarea=false
func _input(event):
	if buttonarea and $startbutton.is_visible() and Input.is_key_pressed(KEY_E):
		$Camera2D.get_node("AnimationPlayer").set_current_animation("rotation")
		$welcome.hide()
		enableplat($platforms.get_node("platform1"),$platforms.get_node("enable1"))
		
func _on_startbutton_body_entered(body):
	buttonarea=true
func _on_startbutton_body_exited(body):
	buttonarea=false


func _enableplat2(area):
	enableplat($platforms.get_node("platform2"),$platforms.get_node("enable2"))
func _enableplat3(area):
	enableplat($platforms.get_node("platform3"),$platforms.get_node("enable3"))


func _enable_minions(body):
	$screen.get_node("AnimationPlayer").set_current_animation("movement#")
