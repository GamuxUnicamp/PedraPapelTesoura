extends Node2D

onready var botao_pedra = $BotaoPedra
onready var botao_papel = $BotaoPapel
onready var botao_tesoura = $BotaoTesoura
#onready var label_1 = $Label1
onready var label_2 = $Label2

func _ready():
	botao_pedra.connect("button_down", self, "jogar",[0])
	botao_papel.connect("button_down", self, "jogar",[1])
	botao_tesoura.connect("button_down", self, "jogar",[2])


func jogar(escolha_jogador):
	randomize()
	var escolha_cpu = randi()%3 #valor aleatório de 0 a 2
	match escolha_jogador:
		0: #jogador escolheu pedra
			match escolha_cpu:
				0: #cpu escolheu pedra
					label_2.text = "Você jogou pedra contra pedra e empatou."
				1: #cpu escolheu papel
					label_2.text = "Você jogou pedra contra papel e perdeu."
				2: #cpu escolheu tesoura
					label_2.text = "Você jogou pedra contra tesoura e ganhou."
		1: #jogador escolheu papel
			match escolha_cpu:
				0: #cpu escolheu pedra
					label_2.text = "Você jogou papel contra pedra e ganhou."
				1: #cpu escolheu papel
					label_2.text = "Você jogou papel contra papel e empatou."
				2: #cpu escolheu tesoura
					label_2.text = "Você jogou papel contra tesoura e perdeu."
		2: #jogador escolheu tesoura
			match escolha_cpu:
				0: #cpu escolheu pedra
					label_2.text = "Você jogou tesoura contra pedra perdeu."
				1: #cpu escolheu papel
					label_2.text = "Você jogou tesoura contra papel e venceu."
				2: #cpu escolheu tesoura
					label_2.text = "Você jogou tesoura contra tesoura e empatou."
