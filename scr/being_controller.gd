extends KinematicBody2D

class_name being_controller

export var health = 100
export var movement_speed = 200

var gravity = 600
var jump_force = 300
var equipment = [0,0,0,0] #gold/wood/rock/leather
var item_scene
var active_move = true
var movement = Vector2()

var direction = 1

func _ready():
	item_scene = preload("res://scenes/item_scene.tscn")
	pass

func _process(delta):
	if active_move:
		movement.y += gravity * delta
		movement = move_and_slide(movement, Vector2(0,-1), true)
	pass
	
func fire_item(name):
	var new_item = item_scene.instance()
	new_item.item_name = name
	new_item.global_position = global_position
	new_item.linear_velocity = Vector2(randi() % 150 - 75, -(randi() % 50 + 50) )
	new_item.angular_velocity = randi() % 40 - 20
	get_tree().get_root().call_deferred("add_child", new_item)
	pass
	
func take_damage(val):
	health -= val
	if health <= 0:
		dead()
	pass
	
func dead():
	for e in range(equipment.size()):
		print_debug(equipment[e])
		for i in range(equipment[e]):
			var item_name
			match e:
				0:
					item_name = "gold"
				1:
					item_name = "wood"
				2:
					item_name = "rock"
				3:
					item_name = "leather"
			print_debug(i)
			fire_item(item_name)			
	queue_free()
	pass