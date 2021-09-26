extends Node2D

var draw_line # Lo usaremos para dibujar una línea.

func _input(event): # Usando la función nativa Input vamos a comprobar cuál es el evento.
	if event is InputEventMouseButton: # Si el evento es que presionamos un botón del Mouse.
		if event.pressed: # Y solo si lo mantenemos presionado.
			GLOBAL.pressed = true
			draw_line = Line2D.new() # Creamos una nueva línea.
			draw_line.default_color = Color("#ffffff") # Definimos el color.
			draw_line.width = 6 # Y el grosor.
		else:
			GLOBAL.pressed = false
		
	if event is InputEventMouseMotion: # Si el evento es un movimiento del Mouse.
		if GLOBAL.pressed: # Y mantenemos un botón presionado.
			draw_line.add_to_group("Draw") # Añadimos la línea al grupo Draw
			draw_line.add_point(event.position) # Añadimos un punto a nuestra línea en la posición del evento, ósea donde se encuentre el mouse.
			add_child(draw_line) # Y con add_child añadimos el nodo a la escena.
		else:
			if get_tree().get_nodes_in_group("Draw"):
				for line in get_tree().get_nodes_in_group("Draw"):
					line.queue_free()
