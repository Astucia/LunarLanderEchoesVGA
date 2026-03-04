extends StaticBody3D
class_name landing_base

@export_enum("Llegada", "Recarga", "Bonus") var tipo_plataforma = "Llegada"
@export_file_path("*.tscn") var ruta_nivel = ""



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if ruta_nivel == "" and tipo_plataforma == "Llegada":
		assert(false, "Falta la ruta de nivel")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func victoria() -> String:
	if tipo_plataforma == "Bonus":
		#Haz algo
		return "Bonus"
		
	get_tree().call_deferred("change_scene_to_file",ruta_nivel)
	#get_tree().change_scene_to_file(ruta_nivel)
	return "Victoria"
	
