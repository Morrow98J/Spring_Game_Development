extends Node


var redMaterial
var blueMaterial

func _ready():
	redMaterial =  SpatialMaterial.new()
	redMaterial.albedo_color = Color.red
	blueMaterial =  SpatialMaterial.new()
	blueMaterial.albedo_color = Color.blue
