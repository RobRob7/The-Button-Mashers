extends KinematicBody2D

var speed : int = 200
var jumpForce : int = 500
var gravity : int = 1000
var dashSpeed : int = 20

var vel : Vector2 = Vector2()

var initPos : Vector2 = Vector2(144, 440)

# get the player model
onready var sprite : Sprite = get_node("Sprite")

onready var initPos : Vector2 = Vector2(position.x, position.y)

#var initPos : Vector2 = sprite.getPosition()

# utlizes Cooldown.gd script
const cooldown = preload("res://scripts/Cooldown.gd")

# set the dash cooldown (in seconds)
onready var dash_cooldown = cooldown.new(3);

# set the sprint cooldown (in seconds)
onready var sprint_cooldown = cooldown.new(3);

# timer for sprint
onready var sprintTimer := $SprintTimer

# timer for sprint cooldown
onready var sprintCooldown := $SprintCooldown


func _physics_process(delta):
	
	dash_cooldown.tick(delta)
	
	sprint_cooldown.tick(delta)
	
	vel.x = 0
	
	check_for_jump()
	
	check_for_walking_left_and_right()
	
	check_for_sprinting()
	
	check_for_dash()
	
	flip_character_model_depending_on_direction()
	
	vel = move_and_slide(vel, Vector2.UP)
	
	vel.y += gravity * delta


### checks for if player is trying to jump
func check_for_jump():
	
	if Input.is_action_just_pressed("jump"):
		if(is_on_floor()):
			vel.y -= jumpForce
#		else:
#			$AnimatedSprite.play("jump")


### checks whether player is moving left or right
func check_for_walking_left_and_right():
	
	# moving left
	if(Input.is_action_pressed("move_left")):
		vel.x -= speed
		$AnimatedSprite.play("walk")
	# moving right
	elif(Input.is_action_pressed("move_right")):
		vel.x += speed
		$AnimatedSprite.play("walk")
	else:
		$AnimatedSprite.play("idle")


### checks if player is trying to sprint
func check_for_sprinting():
	
	# sprinting with "shift" key and moving left
	if(Input.is_action_pressed("move_left") && Input.is_action_pressed("sprint") && is_on_floor()):
		vel.x -= speed
#		sprintTimer.start()
#		if(sprintTimer.is_stopped()):
#			dash_cooldown.tick(delta)
		#$AnimatedSprite.play("sprint")
		#vel.x *= 20;
	
	# sprinting with "shift" key and moving right
	elif(Input.is_action_pressed("move_right") && Input.is_action_pressed("sprint") && is_on_floor()):
		vel.x += speed
		#sprintTimer.start()
		#$AnimatedSprite.play("sprint")
		#vel.x *= 20;

### checks if player is trying to dash
func check_for_dash():
	
	# dashing with "RMB" key and moving left
	if(Input.is_action_pressed("move_left") && (Input.is_action_just_pressed("dash") && dash_cooldown.is_ready())):
		#vel.x -= speed
		vel.x *= dashSpeed;
	
	# dashing with "RMB" key and moving right
	if(Input.is_action_pressed("move_right") && (Input.is_action_just_pressed("dash") && dash_cooldown.is_ready())):
		#vel.x += speed
		vel.x *= dashSpeed;


### alters orientation of player model based on movement direction
func flip_character_model_depending_on_direction():
	if vel.x < 0:
		$AnimatedSprite.flip_h = true
	elif vel.x > 0:
		$AnimatedSprite.flip_h = false


### respawn player at original starting position
func respawn():
	set_global_position(initPos)

func respawn():
	set_global_position(initPos)
