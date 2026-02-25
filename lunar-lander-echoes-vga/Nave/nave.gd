class_name Nave 
extends RigidBody3D

@export var impulso : float = 2
@export var inclinacion : float = 1
@export var combustible : float = 1000
@export var escudo : int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("motor"):
		apply_central_impulse(Vector3.UP * impulso * delta)
	pass
