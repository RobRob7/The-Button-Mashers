extends KinematicBody2D

# speed of enemy
var speed : int = 97

# gravity var
var gravity : int = 800

# inital velocity var
var velocity : Vector2 = Vector2()

# var for direction enemy is facing
var direction : int = 1

# physics process
func _physics_process(delta) -> void:
	
	# apply velocity horizontally
	velocity.y += gravity * delta
	
	# apply velocity vertically
	velocity.x = speed * direction
	
	# adjust velocity based on previous updated values
	velocity = move_and_slide(velocity, Vector2.UP)
	
	# call to function that checks enemy is on platform
	check_if_still_on_platform()

# function checks for enemy on platform and handles direction of enemy
func check_if_still_on_platform():
	if(not $RayCastLeft.is_colliding() && is_on_floor()):
		direction = 1
		$Angery.flip_h = true
	if(not $RayCastRight.is_colliding() && is_on_floor()):
		direction = -1
		$Angery.flip_h = false

# function deals with collision of player or wall
func _on_hitbox_body_entered(body):
	if body.get_name() == "Player":
		body.respawn()
	if body.is_in_group("wall"):
		direction = -direction
