extends KinematicBody2D

const GRAVITY = 200.0
const WALK_SPEED = 20
const DIAGONAL_SCALE = 1.4

var velocity = Vector2(0,0)
var speed = WALK_SPEED

puppet var slave_position = Vector2(0,0)

var playerID = ""



func _ready():
	slave_position = position

func _process(delta): #change this !
	$Label.set_text(str(playerID))

func _physics_process(delta):
	
	
	
	var key_w = Input.is_action_pressed("key_w")
	var key_s = Input.is_action_pressed("key_s")
	var key_a = Input.is_action_pressed("key_a")
	var key_d = Input.is_action_pressed("key_d")
	#velocity.y += delta * GRAVITY
	if is_network_master(): # you on this local machine is controlling this player
		velocity = Vector2()
		if key_d:
			velocity.x += 2
		if key_a:
			velocity.x -= 2
		if key_w:
			velocity.y -= 2
		if key_s:
			velocity.y += 2
			
		
		velocity = velocity.normalized()*50
		move_and_slide(velocity)

		rset_unreliable("slave_position", position) # you on this local machine is telling everyone else's representation of YOU, that YOU are moving		
	else: # We are not controlling! This is a representation of this other player
		 
		position = slave_position
	move_and_slide(velocity, Vector2(0, -1))
