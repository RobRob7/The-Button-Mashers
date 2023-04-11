extends Area2D



const speed : int = 150
var velocity : Vector2 = Vector2()
onready var sprite : Sprite = get_node("Laser")
var initPos : Vector2 = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	
	initPos.x = 93
	initPos.y = 216
	self.position = initPos
	velocity.x = 0
	velocity.y = 0
	sprite.show()


func _physics_process(delta):
	
	position += velocity * speed * delta
	
	
func launch(direction):
	
	velocity = direction

func _on_laserHitBox_body_entered(body):
	if body.get_name() == "Player":
		get_parent().get_node("Player").respawn()
