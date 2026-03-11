extends AnimatableBody3D

#@export var destino : Vector3
@export var duracion : float = 5.0

@export var path : Array[Vector3]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween()
	tween.set_loops()
	tween.set_trans(Tween.TRANS_SPRING)
	
	for punto in path:
		tween.tween_property(self,"global_position",global_position + punto,duracion) #Arriba
	#tween.tween_property(self,"global_position",global_position + Vector3(20,20,0),duracion) #Derecha
	#tween.tween_property(self,"global_position",global_position + Vector3(20,0,0),duracion) #Abajo
	tween.tween_property(self,"global_position",global_position,duracion) #Izquierda
	
	pass # Replace with function body.

	
	
	
	
	
