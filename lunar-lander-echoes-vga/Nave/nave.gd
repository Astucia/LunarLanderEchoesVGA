class_name Nave 
extends RigidBody3D

@export var impulso : float = 10
@export var inclinacion : float = 100
@export var combustible : float = 1000
@export var consumo : float = 10
@export var escudo : int = 1

@onready var explosion: AudioStreamPlayer = $ExplosionSFX
@onready var victoria: AudioStreamPlayer = $VictoriaSFX
@onready var turbina: AudioStreamPlayer3D = $TurbinaIzq


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("motor") and combustible > 0:
		apply_central_impulse(basis.y * impulso * delta)
		combustible = clamp(combustible - (consumo * delta),0,combustible)
		if turbina.playing == false:
			turbina.play()
	else:
		turbina.stop()
		
		
		
		#printt("Combustible: ",combustible)
	
	
	if Input.is_action_pressed("rotacion_left"):
		apply_torque(Vector3(0,0,inclinacion * delta))
		
	if Input.is_action_pressed("rotacion_right"):
		apply_torque(Vector3(0,0,-inclinacion * delta))
	
	pass


func _on_body_entered(body: Node) -> void:
	print(body.get_groups())
	if body.is_in_group("Victoria"):
		if body is landing_base:
			print(body.victoria())
			victoria.play()

	elif body.is_in_group("Crash"):
		print(crash_game_over(body.name))
		
	elif body.is_in_group("Bonus"):
		print("Bonus")
	
	
	pass # Replace with function body.
	
func crash_game_over(objeto : String = "") -> String :
		
	#set_process(false)
	set_physics_process(false)
	explosion.play()
	
	var tween = create_tween()
	tween.tween_interval(3.0)
	tween.tween_callback(get_tree().reload_current_scene)
	
	var mensaje = "Chocaste con: " + objeto + " - Game Over"
	#get_tree().call_deferred("reload_current_scene")
	return mensaje
	
