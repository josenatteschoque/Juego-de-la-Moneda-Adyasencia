extends Area2D

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	# Detecta clic izquierdo del ratón o toque en pantalla táctil
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		desaparecer()
	elif event is InputEventScreenTouch and event.pressed:
		desaparecer()

func desaparecer() -> void:
	# Elimina el nodo de la escena
	queue_free()
