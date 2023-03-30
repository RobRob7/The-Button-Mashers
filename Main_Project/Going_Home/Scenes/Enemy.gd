extends KinematicBody2D

var speed : int = 25
var angrySpeed : int = 150
var gravity : int = 800
var inView : bool = false
var distFromPlay = 0

var velocity : Vector2 = Vector2()


onready var sprite : Sprite = get_node("Angery")

func _physics_process(delta):
	
	distFromPlay = getPlayDist()
	if distFromPlay <= 150:
		inView = true
	else:
		inView = false
	
	if inView:
		
		get_node("Angery").hide()
		get_node("inViewAngery").show()
		sprite = get_node("inViewAngery")
			
		if sprite.flip_h == true:
			velocity.x = -0.001
		else:
			velocity.x = 0.001
			
		if get_parent().get_node("Player").get_position().x < self.get_position().x :
			sprite.flip_h = true
			velocity.x -= angrySpeed
		elif get_parent().get_node("Player").get_position().x > self.get_position().x:
			sprite.flip_h = false
			velocity.x += angrySpeed
			
		$Angery.flip_h = $inViewAngery.flip_h
			
	else:
		
		get_node("Angery").show()
		get_node("inViewAngery").hide()
		sprite = get_node("Angery")
		
		if sprite.flip_h == true:
			velocity.x = -0.001
		else:
			velocity.x = 0.001
		
		if sprite.flip_h == true:
			velocity.x -= speed
		elif sprite.flip_h == false:
			velocity.x += speed
			
		$inViewAngery.flip_h = $Angery.flip_h
	
	velocity = velocity.normalized() * speed
	
	var collide = move_and_collide(velocity * delta)
	
	if collide:
		if sprite.flip_h == true:
			sprite.flip_h = false
		else:
			sprite.flip_h = true
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.y += gravity * delta
	
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false
		
	

func getPlayDist():
	
	var enemyX : float = self.get_position().x
	var enemyY : float = self.get_position().y
	var playX : float = get_parent().get_node("Player").get_position().x
	var playY : float = get_parent().get_node("Player").get_position().y
	
	var xDiff : float = enemyX - playX
	var yDiff : float = enemyY - playY
	
	return sqrt(( xDiff * xDiff) + ( yDiff * yDiff ))


func _on_hitbox_body_entered(body):
	if body.get_name() == "Player":
		body.respawn()
