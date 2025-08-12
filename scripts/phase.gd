extends Node2D


@export var quantity_step := 5
@export var actual_step := 1
@export var name_phase := "Rookgaard 1/5"

func _ready():
	update_phase_name()
# Progredir para o próximo monstro
func next_step():
	if actual_step < quantity_step:
		actual_step += 1
	else:
		end_phase()
	update_phase_name()

# Reiniciar a fase
func end_phase():
	actual_step = 1
	update_phase_name()

# Atualizar o texto da fase
func update_phase_name():
	$PhaseLabel.text = "Rookgaard %d/%d" % [actual_step, quantity_step]
	name_phase = "Rookgaard %d/%d" % [actual_step, quantity_step]
	print(name_phase) # opcional, para depuração
