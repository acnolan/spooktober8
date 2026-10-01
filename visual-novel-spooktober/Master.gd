



	
extends Node2D


func _ready() -> void:
	Dialogic.timeline_ended.connect(_on_timeline_ended)

	Dialogic.start("res://Timelines/mastertimeline.dtl")

func _on_timeline_ended() -> void:
	print("The End")
	get_tree().quit()
