extends Node

signal collect_item(item)
signal update_equipment(equipment)
signal update_health(health)
signal mission_task(type, object)
signal update_current_mission()

func _ready():
	pass

func emit_collect_item(item):
	emit_signal("collect_item", item)
	
func emit_update_equipment(equipment):
	emit_signal("update_equipment", equipment)

func emit_update_health(health):
	emit_signal("update_health", health)
	
func emit_mission_task(type, object):
	emit_signal("mission_task", type, object)

func emit_update_current_mission():
	emit_signal("update_current_mission")