extends RayCast2D

func _process(delta):
	if Input.is_action_just_pressed("left_click"):
		print("clicked")
