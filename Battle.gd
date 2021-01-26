extends Spatial

var unitScene = preload("Robot_unit.tscn")
onready var units = get_node("units")

func _ready():
	generateUnit("allies", Vector3(6,0,0))
	generateUnit("allies", Vector3(0,0,3))
	generateUnit("enemies")

func generateUnit(team="allies", pos=Vector3(0,0,0)):
	var unit = unitScene.instance()
	unit.setTeam(team)
	units.add_child(unit)
	unit.global_translate(pos)
	return unit
