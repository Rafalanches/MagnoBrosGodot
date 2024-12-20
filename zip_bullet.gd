extends Area2D

var bullet_speed := 300.0
var direction := 1

func _process(delta):
	position.x += bullet_speed * direction * delta


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()

func set_direction(dir):
	direction = dir
	if dir < 0:
		$anim.set_flip_h(true)
	else:
		$anim.set_flip_h(false)
