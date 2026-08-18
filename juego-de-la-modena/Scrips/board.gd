extends Node2D

@export var cantidad_monedas :=12

#Esto determina que tan grande va a ser el circulo
@export var radio := 220.0

var jugador_actual: = 1
var monedas = []
var moneda_scene = preload("res://Scene/Moneda.tscn")

@onready var label_turno = $"../UI/LabelTurno"
@onready var label_monedas = $"../UI/LabelMonedas"


func _ready():
	crear_monedas()
	actualizar_interfaz()
	
func crear_monedas():

#El codigo se va a repetir 12 veces 
	for i in range(cantidad_monedas):
		
		#Crea una moneda
		var moneda = moneda_scene.instantiate()
		
		#Asignamos un indice ala moneda
		moneda.indice = i
		
		moneda.moneda_presionada.connect(_on_moneda_presionada)
		
		#Coloca las monedas en circulo
		var angulo = TAU * i / cantidad_monedas
	
		#Calcula las coordenadas de x e y
		moneda.position = Vector2(
			cos(angulo),
			sin(angulo)
		) * radio
		
		#Agrega una moneda 
		add_child(moneda)
		monedas.append(moneda)

func _on_moneda_presionada(moneda):
	moneda.queue_free()
	cantidad_monedas -= 1
	
	cambiar_turno()
	
	actualizar_interfaz()
	print("Jugador ", jugador_actual, " presionó la moneda ", moneda.indice)

func cambiar_turno():
	if jugador_actual == 1:
		jugador_actual = 2
	else:
		jugador_actual = 1

func actualizar_interfaz():

	label_turno.text = "Turno: Jugador " + str(jugador_actual)

	label_monedas.text = "Monedas: " + str(cantidad_monedas)
