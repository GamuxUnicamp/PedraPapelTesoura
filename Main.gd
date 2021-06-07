extends Control

var escolha_jogador_1 = 0 # 0 é pedra, 1 é papel, 2 é tesoura
var escolha_jogador_2 = 0

func _ready(): #Chamado no inicio do programa
	# Conectando botões a funções
	$BotaoPedra1.connect("button_down", self, "botao_pedra_1_down")
	$BotaoPapel1.connect("button_down", self, "botao_papel_1_down")
	$BotaoTesoura1.connect("button_down", self, "botao_tesoura_1_down")
	$BotaoPedra2.connect("button_down", self, "botao_pedra_2_down")
	$BotaoPapel2.connect("button_down", self, "botao_papel_2_down")
	$BotaoTesoura2.connect("button_down", self, "botao_tesoura_2_down")

func botao_pedra_1_down():
	escolha_jogador_1 = 0

func botao_papel_1_down():
	escolha_jogador_1 = 1

func botao_tesoura_1_down():
	escolha_jogador_1 = 2

func botao_pedra_2_down():
	escolha_jogador_2 = 0

func botao_papel_2_down():
	escolha_jogador_2 = 1

func botao_tesoura_2_down():
	escolha_jogador_2 = 2


func _process(delta): #Chamado a cada frame
	#Atualizar o texto do jogador 1
	if escolha_jogador_1 == 0:
		$LabelJogador1.text = "Jogador 1: Pedra"
	elif escolha_jogador_1 == 1:
		$LabelJogador1.text = "Jogador 1: Papel"
	else:
		$LabelJogador1.text = "Jogador 1: Tesoura"
	#Atualizar o texto do jogador 2
	match escolha_jogador_2:
		0:
			$LabelJogador2.text = "Jogador 2: Pedra"
		1:
			$LabelJogador2.text = "Jogador 2: Papel"
		2:
			$LabelJogador2.text = "Jogador 2: Tesoura"
	#Atualizar texto do vencedor
	match escolha_jogador_1:
		0: #jogador 1 escolheu pedra
			match escolha_jogador_2:
				0: #jogador 2 escolheu pedra
					$LabelVencedor.text = "Empate."
				1: #cpu escolheu papel
					$LabelVencedor.text = "Vencedor: Jogador 1."
				2: #cpu escolheu tesoura
					$LabelVencedor.text = "Vencedor: Jogador 2."
		1: #jogador 1 escolheu papel
			match escolha_jogador_2:
				0: #cpu escolheu pedra
					$LabelVencedor.text = "Vencedor: Jogador 1."
				1: #cpu escolheu papel
					$LabelVencedor.text = "Empate."
				2: #cpu escolheu tesoura
					$LabelVencedor.text = "Vencedor: Jogador 2."
		2: #jogador 1 escolheu tesoura
			match escolha_jogador_2:
				0: #cpu escolheu pedra
					$LabelVencedor.text = "Vencedor: Jogador 2."
				1: #cpu escolheu papel
					$LabelVencedor.text = "Vencedor: Jogador 1."
				2: #cpu escolheu tesoura
					$LabelVencedor.text = "Empate."

