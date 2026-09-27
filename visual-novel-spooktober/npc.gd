extends Area2D

@export var timeline: String = "timeline1"

var player_in_range = false

func _ready():
	$label.visible = false 
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		player_in_range = true
		$label.visible = true

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_in_range = false
		$label.visible = false

func _unhandled_input(event):
	if player_in_range and event.is_action_pressed("interact"):
		if Dialogic.current_timeline == null:
			Dialogic.start(timeline)
			$label.visible = false
