extends CanvasLayer



func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://kai's_room.tscn")

func _on_load_game_button_pressed() -> void:
	var path = "user://savegame.json"
	
	if not FileAccess.file_exists(path):
		Notification.showAlert("No save file found")
		return
	
	var file = FileAccess.open(path, FileAccess.READ)
	
	var json = file.get_as_text()
	var save_data = JSON.parse_string(json)
	get_tree().change_scene_to_file(save_data['currentScene'])
	file.close()
