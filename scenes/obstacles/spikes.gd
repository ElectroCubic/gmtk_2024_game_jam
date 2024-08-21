extends StaticBody2D

const MIN_SCALE: Vector2 = Vector2(1.5,1.5)

func _on_spike_area_body_entered(body):
	if body.is_in_group("Wheel"):
		if Global.tyre_health > 0:
			Global.tyre_health -= 5
			
		if body.get_child(-1).scale > MIN_SCALE:
			body.get_child(-1).scale -= Vector2(0.4,0.4)
			body.get_child(-2).scale -= Vector2(0.4 * 0.05, 0.4 * 0.05)
