class_name Nave 
extends RigidBody3D

@export var impulso : float = 10
@export var inclinacion : float = 100
@export var combustible : float = 1000
@export var consumo : float = 10
@export var escudo : int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("motor") and combustible > 0:
		apply_central_impulse(basis.y * impulso * delta)
		combustible = clamp(combustible - (consumo * delta),0,combustible)
		
		#printt("Combustible: ",combustible)
	
	
	if Input.is_action_pressed("rotacion_left"):
		apply_torque(Vector3(0,0,inclinacion * delta))
		
	if Input.is_action_pressed("rotacion_right"):
		apply_torque(Vector3(0,0,-inclinacion * delta))
	
	pass


func _on_body_entered(body: Node) -> void:
	print(body.get_groups())
	if body.is_in_group("Victoria"):
		print("Victoria")
	elif body.is_in_group("Crash"):
		print("Game Over")
		get_tree().reload_current_scene()
	elif body.is_in_group("Bonus"):
		print("Bonus")
	
	
	pass # Replace with function body.
