extends HBoxContainer

var cardScene = preload("res://CardControl.tscn")
var handSize = 4
var cardWidth = 120.0
var hand = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in handSize:
		var card = cardScene.instance()
		self.add_child(card)
		card.rect_position = Vector2(i * cardWidth, 0)
		card.rect_min_size = Vector2(cardWidth, 289.0)
		card.margin_right = cardWidth
		card.margin_bottom = cardWidth
		hand.append(card)
		
func addCard():
	var card = cardScene.instance()
	self.add_child(card)
	hand.append(card)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	for i in len(hand):
		var card = hand[i]
		#card.rect_position = Vector2(i * cardWidth, 0)
		card.rect_min_size = Vector2(cardWidth, 289.0)
		card.margin_right = cardWidth
		card.margin_bottom = cardWidth
