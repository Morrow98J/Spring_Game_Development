extends Sprite3D

const BAR_SAFE = preload("res://assets/GUI/healthbar/green.png")
const BAR_WARN = preload("res://assets/GUI/healthbar/yellow.png")
const BAR_ALERT = preload("res://assets/GUI/healthbar/red.png")

onready var bar = $Viewport/TextureProgress

func update(value, full):
	var perc = float(value) / full
	bar.texture_progress = BAR_SAFE
	if perc < 0.75:
		bar.texture_progress = BAR_WARN
	if perc < 0.35:
		bar.texture_progress = BAR_ALERT
	bar.value = bar.max_value * perc

func _ready():
	self.texture = $Viewport.get_texture()
