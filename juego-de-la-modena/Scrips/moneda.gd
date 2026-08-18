extends Area2D

signal moneda_presionada(moneda)

var indice: int

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:

	if event is InputEventMouseButton:

		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:

			moneda_presionada.emit(self)
