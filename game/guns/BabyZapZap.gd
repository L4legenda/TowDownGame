extends "res://game/guns/BaseGun.gd"

func _shoot():
	can_shoot = false
	var mouse_pos = get_global_mouse_position()
	var direction = (mouse_pos - gun_tip.global_position).normalized()
	gun_tip.rotation = direction.angle()
	call_deferred("createBullet")
	call_deferred("_shootAnim")
	timer.start()

func createBullet():
	for i in 3:
		var b = bullet_scene.instantiate()
		b.setOnwer(player)
		get_tree().root.add_child(b)
		b.position = gun_tip.global_position
		b.rotation = gun_tip.rotation
		fire(b)
		audio.play()
		await get_tree().create_timer(0.15).timeout

func _shootAnim():
	super._shootAnim()
	var tween = get_tree().create_tween().set_parallel(true)
	tween.tween_property(self, "position", position, timer.wait_time).from(position + Vector2(-1, -1))
	tween.tween_property($Sprite2D, "scale", Vector2(1,1), timer.wait_time).from(Vector2(0.5, 1.1))
	add_child(particles_pre.instantiate())

func _on_timer_timeout():
	can_shoot = true
