extends KinematicBody2D

# speed of player var
var speed : int = 185

# jump force of player var
var jumpForce : int = 300

# double jump force of player var
var doubleJumpForce : int = 250

# gravity on player var
var gravity : int = 1000

# dash speed of player var
var dashSpeed : int = 20

# var to hold state of player (dead or alive)
var playerDead : int = 0

# max health of player
const maxHealthPlayer = 1

# current health of player
var healthPlayer : int  = maxHealthPlayer

# max jump times
var jump_max = 2

# current jump counter
var jump_count = 0

# inital velocity vector
var vel : Vector2 = Vector2()

# get the player model
onready var sprite : Sprite = get_node("Sprite")

# get initial position of player
onready var initPos : Vector2 = Vector2(position.x, position.y)

# utlizes Cooldown.gd script
const cooldown = preload("res://Scripts/Player/Cooldown.gd")

# set the dash cooldown (in seconds)
onready var dash_cooldown = cooldown.new(3);

# set the sprint cooldown (in seconds)
onready var sprint_cooldown = cooldown.new(3);

# timer for sprint
onready var sprintTimer := $SprintTimer

# timer for sprint cooldown
onready var sprintCooldown := $SprintCooldown

# physics process
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
	
	if playerDead:
		print("DEAD")
		get_tree().change_scene("res://Scenes/Player/PlayerGameOverScreen.tscn")

### function checks the health of player and resets position
func health_of_player():
	if(healthPlayer <= 0):
		set_global_position(initPos)
		healthPlayer = maxHealthPlayer;
		playerDead = 1
	

### checks for if player is trying to jump
func check_for_jump():
	if(is_on_floor() && jump_count!=0):
		jump_count = 0
	
	if(jump_count < jump_max):
		if Input.is_action_just_pressed("jump"):
			vel.y = -jumpForce
			jump_count += 1


### checks whether player is moving left or right
func check_for_walking_left_and_right():
	
	# moving left
	if(Input.is_action_pressed("move_left")):
		vel.x = -speed
		$AnimatedSprite.play("walk")
	# moving right
	elif(Input.is_action_pressed("move_right")):
		vel.x = speed
		$AnimatedSprite.play("walk")
	else:
		$AnimatedSprite.play("idle")


### checks if player is trying to sprint
func check_for_sprinting():
	
	# sprinting with "shift" key and moving left
	if(Input.is_action_pressed("move_left") && Input.is_action_pressed("sprint") && is_on_floor()):
		vel.x -= speed
	
	# sprinting with "shift" key and moving right
	elif(Input.is_action_pressed("move_right") && Input.is_action_pressed("sprint") && is_on_floor()):
		vel.x += speed

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

### function respawns player
func respawn():
	healthPlayer = healthPlayer - 1
	print(healthPlayer)
	health_of_player()

### function checks collision with enemy
func _on_PlayerHitbox_body_entered(body):
	if body.get_name() == "Enemy":
		respawn()
