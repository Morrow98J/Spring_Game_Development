extends Spatial

const MAX_HEALTH = 5
const DEFAULT_ATTACK = 1

var team = ""
var health = MAX_HEALTH
var attack = DEFAULT_ATTACK
var timer
var explosion = preload("res://explosion3d.tscn")

func _ready():

	# Timer setup
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.wait_time = 1.0
	timer.set_autostart(true)
	add_child(timer)

func setTeam(new_team):
	if new_team == "enemies":
		get_node("Body").set_surface_material(0, globals.redMaterial)
	if new_team == "allies":
		get_node("Body").set_surface_material(0, globals.blueMaterial)
	self.team = new_team

func updateHealth(amount):
	health += amount
	$HealthBar3D.update(health, MAX_HEALTH)

func die():
	var explode = explosion.instance()
	add_child(explode)
	explode.global_translate(self.translation)
	return explode
	#queue_free()

func _process(delta):

	# Die if health is zero or below
	if health <= 0:
		die()
		return

	var target = findNearestEnemy()
	if target == null:
		# print("No enemies found")
		pass
	else:
		look_at(target.translation, Vector3(0,1,0))
		if target.translation.distance_to(self.translation) <= target.translation.distance_to(findNearestAlly(target).translation):
			if target.translation.distance_to(self.translation) > 2:
				self.translate(Vector3(0,0,-0.5*delta))
		else:
			# print("{a} is within range to attack {b}".format({"a": self, "b": target}))
			if timer.get_time_left() == 0:
				# print("{a} attacks {b}".format({"a": self, "b": target}))
				target.updateHealth(-self.attack)
				timer.start()

func findNearestEnemy():
	var nearest = null
	var nearestDistance = INF
	for unit in get_parent().get_children():
		if unit != self and unit.team != self.team:
			var iterDistance = unit.translation.distance_to(self.translation)
			if iterDistance < nearestDistance:
				nearestDistance = iterDistance
				nearest = unit
	return nearest

func findNearestAlly(enemy):
	var nearest = null
	var nearestDistance = self.translation.distance_to(enemy.translation)
	for unit in get_parent().get_children():
		if unit.team == self.team:
			for u in get_parent().get_children():
				if unit.team == self.team:
					if unit.translation.distance_to(enemy.translation) < u.translation.distance_to(enemy.translation):
						nearestDistance = unit.translation.distance_to(enemy.translation)
						nearest = unit
	return nearest
