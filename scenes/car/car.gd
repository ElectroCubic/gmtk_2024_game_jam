extends RigidBody2D

@onready var wheels := get_tree().get_nodes_in_group("Wheel")
var SPEED: int = 60000
const MAX_SPEED: int = 50
const MAX_SCALE: Vector2 = Vector2(4,4)
var speed_modifier: int = 10
var scale_modifier: float = 0.1

func _physics_process(delta):
	if Input.is_action_pressed("Forward"):
		for wheel in wheels:
			if wheel.angular_velocity < MAX_SPEED:
				wheel.apply_torque(SPEED * delta * speed_modifier)
	
	if Input.is_action_pressed("Backward"):
		for wheel in wheels:
			if wheel.angular_velocity > -MAX_SPEED:
				wheel.apply_torque(-SPEED * delta * speed_modifier)
				
	if Input.is_action_pressed("IncreaseTyreSize"):
		for wheel in wheels:
			var wheel_collider = wheel.get_child(-1)
			if wheel_collider.scale < MAX_SCALE:
				wheel_collider.scale += Vector2(scale_modifier,scale_modifier)



