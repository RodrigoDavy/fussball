extends CharacterBody3D

var digital_rotation_speed = 15.0
var digital_speed = 40.0

func _physics_process(delta):
	# Handle player input
	var direction = Vector3.ZERO
	var movement = {}
	var rotation = 0
	
	movement = process_digital_movement(direction, rotation)
	direction = movement['direction']
	rotation = movement['rotation']

	velocity = direction * digital_speed
	
	rotate(Vector3(0, 0, 1), rotation * digital_rotation_speed * delta)

	# Move the character
	move_and_slide()

func process_digital_movement(direction, rotation):
	if Input.is_action_pressed("digital_right"):
		rotation += 1
	if Input.is_action_pressed("digital_left"):
		rotation -= 1
	if Input.is_action_pressed("digital_forward"):
		direction.z += 1
	if Input.is_action_pressed("digital_back"):
		direction.z -= 1
	
	return({ 'direction': direction, 'rotation': rotation})
