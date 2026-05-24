extends StaticBody2D

@onready var anim_player = $AnimationPlayer

func buka_pintu(buka: bool):
	if buka:
		anim_player.play("new_animation")
