extends Control

onready var grid = get_node("MarginContainer/VBoxContainer/ScrollContainer/GridContainer")

var cardNode = load("res://CardControl.tscn").instance()

var selectionMaxQueue = []

# Called when the node enters the scene tree for the first time.
func _ready():
	
# warning-ignore:unused_variable
	for _i in range(100):
		#grid.add_child(cardNode)
		var b = Button.new()
		b.text = "Hi"
		b.size_flags_horizontal = SIZE_EXPAND_FILL
		grid.add_child(b)
	
	# for i in range(7):
		# $MarginContainer/VBoxContainer/ScrollContainer/GridContainer.add_child_below_node(new CardButton())
		
	
#func selectCard


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
