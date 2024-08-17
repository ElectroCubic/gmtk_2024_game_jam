extends StaticBody2D

const MIN_SCALE: Vector2 = Vector2(1,1)

func _on_spike_area_body_entered(body):
	
	#print(body.is_in_group("Wheel"))
	if body.is_in_group("Wheel"):
		if body.get_child(-1).scale > MIN_SCALE:
			body.get_child(-1).scale -= Vector2(0.4,0.4)
