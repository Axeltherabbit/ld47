extends Node

func changescene(vp, scene):
	vp.get_children()[0].queue_free()
	vp.add_child(load(scene).instance())
