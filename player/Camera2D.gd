extends Camera2D
	
	
onready var player = $".."

onready var weaponRange = get_parent().get_node("hand cannon/bullet/bulletPath")
var mpos = get_local_mouse_position()
var view

func _process(delta):
	self.position.x =  lerp(player.position.x, mpos.x, 1) / 2
	self.position.y =  lerp(player.position.y, mpos.y, 1) / 2
	mpos = get_local_mouse_position()
#
#	self.global_position = self.global_position - (get_global_mouse_position() - player.position) /2


	
	
	
	
	
	
	
	
	
	
	
	
