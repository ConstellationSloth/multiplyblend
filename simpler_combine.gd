extends Node2D


func _ready():
	var emPath = "res://WaterWarrior_ArmLeft_EM.png"
	var fabricPath = "res://WaterWarrior_ArmLeft_Fabric.png"
	var metalPath = "res://WaterWarrior_ArmLeft_Metal.png"
	var outlinePath = "res://WaterWarrior_ArmLeft_Outline.png"
	var outputPath = "test.png"
	var em = Image.load_from_file(emPath)
	var fabric = Image.load_from_file(fabricPath)
	var metal = Image.load_from_file(metalPath)
	var outline = Image.load_from_file(outlinePath)
	print(outline.get_format())
	var fullImage = Image.create_empty(em.get_size().x, em.get_size().y, false, Image.FORMAT_RGBA8)
	fullImage.blend_rect(fabric, Rect2i(Vector2.ZERO,fabric.get_size()), Vector2.ZERO)
	fullImage.blend_rect(metal, Rect2i(Vector2.ZERO,metal.get_size()), Vector2.ZERO)
	fullImage.blend_rect(em, Rect2i(Vector2.ZERO,em.get_size()), Vector2.ZERO)
	var result = Image.create_empty(em.get_size().x, em.get_size().y, false, Image.FORMAT_RGBA8)
	for y in range(fullImage.get_height()):
		for x in range(fullImage.get_width()):
			var baseColor = fullImage.get_pixel(x,y)
			var blendColor = outline.get_pixel(x,y)
			var outColor = baseColor * blendColor
			result.set_pixel(x,y, outColor)
	result.save_png(outputPath)
	get_tree().quit()
