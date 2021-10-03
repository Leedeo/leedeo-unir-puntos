extends Area2D

func _process(_delta):
	if not GLOBAL.pressed: get_node("Sprite").modulate = Color(1, 1, 1, 1)
	

func _on_Point_input_event(_viewport, event, _shape_idx):
	if GLOBAL.pressed:
		if event is InputEventMouseMotion:
			get_node("Sprite").modulate = Color(1, 0, 0, 1)
