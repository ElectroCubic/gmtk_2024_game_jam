extends RigidBody2D

@onready var wheels := get_tree().get_nodes_in_group("Wheel")
@onready var front_joint = $FrontJoint
@onready var back_joint = $BackJoint

@export var SPEED: int = 60000
const MAX_SPEED: int = 50
const MAX_SCALE: Vector2 = Vector2(2.8,2.8)
@export var speed_modifier: int = 10
@export var scale_modifier: float = 0.1
var car_flipped: bool = false
var dist_between_joints: float


func _physics_process(delta):
	#dist_between_joints = front_joint.position.distance_to(back_joint.position)
	#print(dist_between_joints)
	#print(Global.tyre_health)
	
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
			var wheel_sprite = wheel.get_child(-2)
			if wheel_collider.scale < MAX_SCALE:
				wheel_collider.scale += Vector2(scale_modifier,scale_modifier)
				wheel_sprite.scale += Vector2(scale_modifier * 0.05,scale_modifier * 0.05)


func _on_car_flip_detection_body_entered(body):
	if body.name == "Terrain":
		car_flipped = true
		print("Flipped")
