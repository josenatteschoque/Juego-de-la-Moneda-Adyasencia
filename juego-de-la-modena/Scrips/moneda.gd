extends Area2D


# ============================================================
# SEÑALES
# ============================================================

# Esta señal avisa al Board que esta moneda fue presionada.
#
# "self" significa:
# "La moneda que está enviando la señal soy yo".
signal moneda_presionada(moneda)


# ============================================================
# VARIABLES
# ============================================================

# Número que identifica a esta moneda.
#
# Por ejemplo:
# moneda 0
# moneda 1
# moneda 2
# ...
# moneda 11
var indice: int


# Guarda si esta moneda está actualmente seleccionada.
#
# false = no seleccionada
# true  = seleccionada
var seleccionada := false


# ============================================================
# DETECTAR CLIC
# ============================================================

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:

	# Comprobamos si el evento fue producido por el mouse.
	if event is InputEventMouseButton:

		# Comprobamos que sea el botón izquierdo
		# y que se haya presionado.
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:

			# Avisamos al Board que esta moneda fue presionada.
			moneda_presionada.emit(self)


# ============================================================
# SELECCIONAR / DESELECCIONAR
# ============================================================

func cambiar_seleccion():

	# Invertimos el estado actual.
	#
	# Si estaba:
	# false → pasa a true
	#
	# Si estaba:
	# true → pasa a false
	seleccionada = !seleccionada


	# Si ahora está seleccionada...
	if seleccionada:

		# Cambiamos ligeramente el color de la moneda
		# para que el jugador sepa que está seleccionada.
		modulate = Color(1.0, 0.8, 0.3)

	else:

		# Si se deseleccionó, volvemos al color normal.
		modulate = Color.WHITE
