extends "res://scripts/ai/actions/action_object.gd"

func _init(unit, path):
	self.type = ACTION_CAPTURE
	self.unit = unit
	self.path = path

func execute():
	var field = self.__get_next_tile_from_action()
	if field:
		action_controller.set_active_field(unit.get_pos_map())
		action_controller.handle_action(field.position)
		positions.refresh_buildings()
		return true

	return false