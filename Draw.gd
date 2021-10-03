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
			
			# El suscriptor Bast Hernández tuvo la iniciativa de solucionar los avisos que genera Godot al momento de crear un nuevo punto en pantalla, me gustaría que tomasen ejemplo. Para ello fue a la documentación de add_child https://docs.godotengine.org/en/stable/classes/class_node.html hasta la parte donde dice: void add_child ( Node node, bool legible_unique_name=false ) y de ahí tomamos este condicional.
			if draw_line.get_parent():
				draw_line.get_parent().remove_child(draw_line)
			# La explicación técnica es que cuando se crea un nuevo punto, también crea un nuevo elemento primario y recordemos que en Godot solo puede haber un elemento primario por lo que antes de crear el nuevo punto eliminamos su elemento primario para mantener una correcta estructura.
			
			add_child(draw_line) # Y con add_child añadimos el nodo a la escena.
		else:
			if get_tree().get_nodes_in_group("Draw"):
				for line in get_tree().get_nodes_in_group("Draw"):
					line.queue_free()
