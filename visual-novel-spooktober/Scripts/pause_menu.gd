extends Control

@onready var main = $"../../"

func _on_resume_pressed() -> void:
	main.pause()

func _on_save_pressed() -> void:
	var file = FileAccess.open("user://savegame.json", FileAccess.WRITE)
	var save_data = {}
	
	save_data['currentScene'] = "res://" + get_tree().current_scene.name + ".tscn"
	
	var json = JSON.stringify(save_data)
	
	file.store_string(json)
	file.close()
	Notification.showAlert("Saved!")

	main.pause()

func _on_exit_pressed() -> void:
	get_tree().quit()
