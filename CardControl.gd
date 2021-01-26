extends Control

var mouse = "m"
var button1 = Button.new()
var launchIcon = load("res://icon.png")
var unitScene = preload("Robot_unit.tscn")
const faces = [preload("res://assets/cards/robotinfantry.png"),
				preload("res://assets/cards/robotgenerator.png"),
				preload("res://assets/cards/robotranged.png")]
onready var cardFace = get_node("CardSprite")
var timer
onready var units = get_node("/root/World/units")


# Called when the node enters the scene tree for the first time.
func _ready():

	randomize()

	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(0.5)
	timer.set_autostart(true)
	add_child(timer)

	cardFace.texture = faces[round(rand_range(0,2))]
	self.anchor_top = 0.6
	add_child(button1)
	button1.set_button_icon(launchIcon)
	button1.set_margins_preset(4)
	pass # Replace with function body.

func _input(event):
	var hand = get_node("/root/World/Control/GUIBottom/HBoxContainer/cards_Hand")
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if event.position.x > self.rect_position.x && event.position.x < self.rect_position.x+hand.cardWidth:
				self.anchor_top = 0
				button1.show()
			else:
				self.anchor_top = 0.6
				button1.hide()




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (self.button1.is_pressed()):
		if timer.get_time_left() == 0:

			var unitc = unitScene.instance()
			var teams = ["allies", "enemies"]
			var hand = get_node("/root/World/Control/GUIBottom/HBoxContainer/cards_Hand")
			unitc.setTeam(teams[randi() % teams.size()])
			# print(unitc.team)
			units.add_child(unitc)
			unitc.global_translate(Vector3(randi()%11-5,0,randi()%11-5))
			timer.start()
			hand.addCard()
			# print(len(hand.hand))
			for i in len(hand.hand)-1:
				if self == hand.hand[i]:
					hand.hand.erase(hand.hand[i])
					self.queue_free()


			#self.queue_free()
	else:
		pass
