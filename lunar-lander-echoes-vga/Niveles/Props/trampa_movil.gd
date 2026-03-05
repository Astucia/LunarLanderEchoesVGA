extends AnimatableBody3D

@export var destino : Vector3
@export var duracion : float = 5.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween()
	tween.set_loops()
	tween.set_trans(Tween.TRANS_SPRING)
	tween.tween_property(self,"global_position",global_position + destino,duracion)
	tween.tween_property(self,"global_position",global_position,duracion)
	
	pass # Replace with function body.

	
	
	
	
	
