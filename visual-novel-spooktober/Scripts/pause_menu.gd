extends Control

@onready var main = $"../../"

func _on_resume_pressed() -> void:
	main.pause()


func _on_save_pressed() -> void:
	pass # Add save logic here


func _on_exit_pressed() -> void:
	get_tree().quit()
