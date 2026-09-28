extends CanvasLayer

@onready var alert_panel = $Panel

var alert_tween_reference = null

func _ready():
	alert_panel.modulate = Color(1,1,1,0)

func showAlert (message = "Saved"):
	if alert_tween_reference:
		alert_tween_reference.kill()
		
	alert_panel.find_child("Label").text = message
	alert_panel.modulate = Color(1,1,1,1)
	
	alert_tween_reference = create_tween()
	alert_tween_reference.tween_interval(1)
	alert_tween_reference.tween_property(alert_panel, "modulate", Color(1,1,1,0), 0.5)
