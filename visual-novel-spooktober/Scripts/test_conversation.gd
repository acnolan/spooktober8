extends Node2D


func _ready() -> void:
	Dialogic.timeline_ended.connect(_on_timeline_ended)

	Dialogic.start("timeline1")

func _on_timeline_ended() -> void:
	print("Dialogic timeline has finished!")
	get_tree().quit()
