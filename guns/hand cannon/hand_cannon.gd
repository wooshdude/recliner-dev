extends Node2D

onready var bulletPath = $bullet/bulletPath
onready var cooldown = $cooldown
onready var shotLength = $shotLength
onready var sprite = $Sprite
var jam = false

func _process(delta):
	var mpos = get_global_mouse_position()
	
	if is_network_master():
		look_at(mpos)
	
	shoot()	

	print(sprite.rotation_degrees)
	
	if sprite.rotation > 90:
		sprite.set_flip_h(true)
	
func _ready():
	set_process(true)
	
func shoot():
	if jam == false:
		if Input.is_action_just_pressed("left_click"):
			bulletPath.disabled = false
			shotLength.start()
			jam = true
			cooldown.start()

func _on_shotLength_timeout():
	 bulletPath.disabled = true


func _on_cooldown_timeout():
	jam = false
