extends KinematicBody2D

export (int) var speed = 400
export (int) var jump_speed = -600
export (int) var GRAVITY = 1200
export (int) var max_jumps = 2

var jumps_remaining = 0

const UP = Vector2(0,-1)

var velocity = Vector2()

func get_input():
	velocity.x = 0
	if is_on_floor():
		jumps_remaining = max_jumps
		if Input.is_action_just_pressed("ui_up"):
			jumps_remaining -= 1
			velocity.y = jump_speed
	elif jumps_remaining > 0 and Input.is_action_just_pressed("ui_up"):
		jumps_remaining -= 1
		velocity.y = jump_speed
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	if Input.is_action_pressed('ui_left'):
		velocity.x -= speed

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	get_input()
	velocity = move_and_slide(velocity, UP)

func _ready():
	pass
