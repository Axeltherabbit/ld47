extends Sprite




# Called when the node enters the scene tree for the first time.
func updatetex():
	
	var file = File.new()
	file.open("user://room.png", File.READ)
	var bytes = file.get_buffer(file.get_len())
	file.close()
	var img = Image.new()
	img.load_png_from_buffer(bytes) # or img.load_jpg_from_buffer()
	var imgtexture = ImageTexture.new()
	imgtexture.create_from_image(img)

	self.set_texture(imgtexture)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
