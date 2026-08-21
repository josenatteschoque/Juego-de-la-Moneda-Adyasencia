extends Control


# ============================================================
# BOTONES DEL MENÚ PRINCIPAL
# ============================================================

# Referencia al botón Jugar.
@onready var button_jugar = $VBoxContainer/ButtonJugar

# Referencia al botón Información.
@onready var button_info = $VBoxContainer/ButtonInfo

# Referencia al botón Salir.
@onready var button_salir = $VBoxContainer/ButtonSalir


# ============================================================
# PANEL DE INFORMACIÓN
# ============================================================

# Referencia al panel que contiene las reglas del juego.
@onready var panel_info = $PanelInfo

# Referencia al botón Volver.
@onready var button_volver = $PanelInfo/ButtonVolver


# ============================================================
# INICIO DEL MENÚ
# ============================================================

func _ready():

	# Conectamos el botón Jugar.
	button_jugar.pressed.connect(_on_button_jugar_pressed)

	# Conectamos el botón Información.
	button_info.pressed.connect(_on_button_info_pressed)

	# Conectamos el botón Salir.
	button_salir.pressed.connect(_on_button_salir_pressed)

	# Conectamos el botón Volver.
	button_volver.pressed.connect(_on_button_volver_pressed)


# ============================================================
# BOTÓN JUGAR
# ============================================================

func _on_button_jugar_pressed():

	# Cambiamos del menú a la escena principal del juego.
	get_tree().change_scene_to_file("res://Scene/Nivel1.tscn")


# ============================================================
# BOTÓN INFORMACIÓN
# ============================================================

func _on_button_info_pressed():

	# Mostramos el panel de información.
	panel_info.visible = true

	# Ocultamos los botones del menú principal.
	$VBoxContainer.visible = false


# ============================================================
# BOTÓN VOLVER
# ============================================================

func _on_button_volver_pressed():

	# Ocultamos el panel de información.
	panel_info.visible = false

	# Volvemos a mostrar los botones principales.
	$VBoxContainer.visible = true

# ============================================================
# BOTÓN SALIR
# ============================================================
func _on_button_salir_pressed():
	# Cerramos el juego.
	get_tree().quit()
