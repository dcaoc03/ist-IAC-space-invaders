; *********************************************************************
; * IST-UL
; * Projeto de Introdução à Arquitetura de Computadores
; * Diogo Costa, 103179
; * José Corte, 103210
; * Mikhail Shueb, 104014
; *
; * Grupo 22
; *********************************************************************

; **********************************************************************
; * Constantes
; **********************************************************************

; ENDEREÇOS

MC_COM  EQU 06000H					; endereço dos comandos do media center
MC_MEM  EQU 08000H					; endereço da memória do media center
DISPLAYS EQU 0A000H					; endereço do display de hexadecimais
TEC_LIN EQU 0C000H					; endereço de entrada das linhas do teclado
TEC_COL EQU 0E000H					; endereço de saída das colunas do teclado
LINHA4  EQU 08H						; endereço para começar a testar a linha 4 do teclado
MASCARA EQU 0FH						; mascara para isolar os 4 bits mais à direita

; TECLAS

ESQUERDA   EQU  00H					; tecla para mover a nave para a esquerda
DISPARO    EQU  01H					; tecla para disparar
DIREITA    EQU  02H					; tecla para mover a nave para a direita
METEORO    EQU  03h					; tecla para o spawn e movimento de um meteoro
INCREMENTA EQU  06H					; tecla para incrementar o valor do display
DECREMENTA EQU  07H					; tecla para decrementar o valor do display	
COMECA	   EQU  0CH					; tecla para iniciar o jogo
PAUSA      EQU  0DH					; tecla para pausar o jogo	
TERMINA    EQU  0EH					; tecla para terminar um jogo

; CONSTANTES MEDIA CENTER

SELECIONA_ECRA			EQU 06004H		; seleciona o ecrã onde se vai atuar
DEFINE_LINHA    		EQU 0600AH      ; endereço do comando para definir a linha
DEFINE_COLUNA   		EQU 0600CH      ; endereço do comando para definir a coluna
DEFINE_PIXEL    		EQU 06012H      ; endereço do comando para escrever um pixel
INDICA_COR_PIXEL        EQU 06010H      ; endereço do comando para indicar a cor de um pixel
APAGA_AVISO     		EQU 06040H      ; endereço do comando para apagar o aviso de nenhum cenário selecionado
APAGA_ECRA	 		    EQU 06002H      ; endereço do comando para apagar todos os pixels já desenhados
SELECIONA_CENARIO_FUNDO EQU 06042H      ; endereço do comando para selecionar uma imagem de fundo
INDICA_CENARIO_FUNDO    EQU 06042H		; endereço do comando para indicar o número do cenário de fundo

SELECIONA_SOM           EQU 06048H		; endereço do comando para selecionar o som a reproduzir
PLAY_SOM                EQU 0605AH		; endereço do comando para reproduzir o som selecionado
N_REPRODUCOES           EQU 06058H		; endereço do comando para indicar o numero de reproduções do som selecionado
TERMINA_SOM             EQU 06066H		; endereço do comando para parar a reprodução do som selecionado
PAUSA_SOM 				EQU 0605EH		; endereço do comando para pausar a reprodução do som selecionado
RETOMA_SOM				EQU 06060H		; endereço do comando para retomar o som selecionado
TERMINA_TODOS_SONS 		EQU 06068H		; endereço do comando para terminar todos os sons a reproduzir


; CONSTANTES NAVE

LINHA      EQU  28			; linha onde se começa a desenhar a nave
COLUNA     EQU  29			; coluna onde se começa a desenhar a nave

MIN_COLUNA		EQU  0		; número da coluna mais à esquerda que o objeto pode ocupar
MAX_COLUNA		EQU  63        ; número da coluna mais à direita que o objeto pode ocupar
ATRASO			EQU	050H		; atraso para limitar a velocidade de movimento do boneco

ALTURA     EQU  4			; altura da nave
LARGURA    EQU  5			; largura da nave
COR_NAVE   EQU  0FFF0H		; cor da nave (amarelo)

MAX_ENERGIA  EQU  100		; valor máximo da energia	
MIN_ENERGIA  EQU  0			; valor mínimo da energia
INCREMENTO   EQU  5

; CONSTANTES METEORO

LINHA_MIN  EQU   0			; linha onde começam os meteoros	
MAX_LINHA  EQU   31			; linha limite dos meteoros

ALTURA_INDEF_1  EQU  1		; altura da forma 1 do meteoro indefinido
LARGURA_INDEF_1 EQU  1		; largura da forma 1 do meteoro indefinido	

ALTURA_INDEF_2  EQU  2		; altura da forma 2 do meteoro indefinido
LARGURA_INDEF_2 EQU  2		; largura da forma 2 do meteoro indefinido	
COR_INDEF       EQU  08888H		; cor do meteoro indefinido (cinzento)

ALTURA_MET_1   EQU  3			; altura de um meteoro na forma 1
LARGURA_MET_1  EQU  3			; largura de um meteoro na forma 1

ALTURA_MET_2   EQU  4			; altura de um meteoro na forma 2
LARGURA_MET_2  EQU  4			; largura de um meteoro na forma 2

ALTURA_MET_3   EQU  5			; altura de um meteoro na forma 3
LARGURA_MET_3  EQU  5			; largura de um meteoro na forma 3

COR_MET_BOM  EQU 0F0F0H		; cor de um meteoro bom (verde)
COR_MET_MAU  EQU 0FF00H		; cor de um meteoro mau (vermelho)

COR_EXPLOSAO  EQU   0FFFFH		; cor de uma explosão

N_METEOROS    EQU 	3			; número de meteoros (3 para ajudar no incremento de endereços)

; CORES: cores utilizadas para desenhar objetos

VERMELHO	EQU		0FF00H
VERMELHO2	EQU		0FF88H
LARANJA		EQU		0FFA0H
AZUL		EQU		0F07FH
CIANO		EQU		0F0FFH
CINZENTO	EQU 	0F666H
CINZENTO2	EQU		0F999H

; CONSTANTES DISPARO

COR_DISPARO  EQU  VERMELHO2			; cor do disparo (magenta)
POSICAO_DEFAULT EQU -1				; a coluna do disparo está a -1 quando este não está ativo

; LINHAS CRÍTICAS

LINHA_0      EQU  2					; linha em que o meteoro muda da forma indefinida 1 para a froma indefinda 2
LINHA_1      EQU  5					; linha em que o meteoro muda da forma indefinda 2 para a forma 1
LINHA_2      EQU  9					; linha em que o meteoro muda da forma 1 para a forma 2
LINHA_3      EQU  14				; linha em que o meteoro muda da forma 2 para a forma 3

LINHA_LIM_DISPARO  EQU 15			; linha de alcance máximo do disparo

; CONSTANTES FUNDOS

ECRA_INICAL       EQU  0			; número indicador do ecrã de começo do jogo
ECRA_JOGO         EQU  1			; número indicador do ecrã do jogo
ECRA_PAUSA        EQU  2			; número indicador do ecrã de pausa do jogo
ECRA_GAME_OVER    EQU  3 			; número indicador do ecrã de fim de jogo do jogo
ECRA_FIM_DE_JOGO  EQU  4			; número indicador do ecrã de quando o jogo acaba por vontade do jogador
ECRA_SEM_ENERGIA  EQU  5			; número indicador do ecrã de quando a nave fica sem energia

; CONSTANTES SONS

MUSICA_INICIO		EQU  0			; número indicador da música do jogo
SOM_START			EQU  1			; número indicador do som de início de jogo
SOM_DISPARO			EQU  2			; número indicador do som de disparo
EXPLOSAO_MET		EQU  3			; número indicador do som de explosão
POWER_UP			EQU  4			; número indicador do som de power up
MUSICA_GAME_OVER	EQU  5			; número indicador da música de quando se perde o jogo
EXPLOSAO_NAVE		EQU  6			; número indicador do som de quando a nave é destruída
MUSICA_YOU_LOSE		EQU  7			; número indicador da música de quando o jogo é terminado voluntariamente

; #######################################################################
; * ZONA DE DADOS 
; #######################################################################
PLACE		0850H				

DEF_NAVE:					; tabela das informações da nave (altura, largura e cor dos pixeis)
	WORD		ALTURA, LARGURA
	WORD		0, 0, LARANJA, 0, 0
	WORD		CINZENTO2, 0, LARANJA, 0, CINZENTO2
	WORD		CINZENTO2, CINZENTO, LARANJA, CINZENTO, CINZENTO2
	WORD		0, CINZENTO, 0, CINZENTO, 0

METEORO_INDEF_1:			; tabela das informações de um meteoro indefinido na forma 1 (altura, largura e cor de pixeis)
	WORD        ALTURA_INDEF_1, LARGURA_INDEF_1
	WORD		COR_INDEF

METEORO_INDEF_2:			; tabela das informações de um meteoro indefinido na forma 2 (altura, largura e cor de pixeis)
	WORD        ALTURA_INDEF_2, LARGURA_INDEF_2
	WORD		COR_INDEF, COR_INDEF
	WORD        COR_INDEF, COR_INDEF

DEF_METEORO_BOM_1:			; tabela das informações de um meteoro bom na forma 1 (altura, largura e cor de pixeis)
	WORD		ALTURA_MET_1, LARGURA_MET_1
	WORD 		0, AZUL, 0
	WORD 		AZUL, AZUL, AZUL
	WORD 		0, AZUL, 0

DEF_METEORO_MAU_1:			; tabela das informações de um meteoro mau na forma 1 (altura, largura e cor de pixeis)
	WORD		ALTURA_MET_1, LARGURA_MET_1
	WORD 		VERMELHO, 0, VERMELHO
	WORD 		0, CINZENTO, 0
	WORD 		VERMELHO, 0, VERMELHO

DEF_METEORO_BOM_2:			; tabela das informações de um meteoro bom na forma 2 (altura, largura e cor de pixeis)
	WORD		ALTURA_MET_2, LARGURA_MET_2
	WORD 		0, AZUL, AZUL, 0
	WORD 		CIANO, AZUL, CIANO, CIANO
	WORD 		AZUL, AZUL, AZUL, CIANO
	WORD 		0, CIANO, AZUL, 0

DEF_METEORO_MAU_2:			; tabela das informações de um meteoro mau na forma 2 (altura, largura e cor de pixeis)
	WORD		ALTURA_MET_2, LARGURA_MET_2
	WORD 		VERMELHO, 0, 0, VERMELHO
	WORD 		VERMELHO, 0, 0, VERMELHO
	WORD 		0, CINZENTO, CINZENTO, 0
	WORD 		VERMELHO, 0, 0, VERMELHO

DEF_METEORO_BOM_3:			; tabela das informações de um meteoro bom na forma 3 (altura, largura e cor de pixeis)
	WORD		ALTURA_MET_3, LARGURA_MET_3
	WORD 		0, AZUL, CIANO, CIANO, 0
	WORD 		CIANO, AZUL, CIANO, AZUL, AZUL
	WORD 		CIANO, CIANO, AZUL, AZUL, CIANO
	WORD 		AZUL, AZUL, CIANO, CIANO, CIANO
	WORD 		0, AZUL, AZUL, CIANO, 0

DEF_METEORO_MAU_3:			; tabela das informações de um meteoro mau na forma 3 (altura, largura e cor de pixeis)
	WORD		ALTURA_MET_3, LARGURA_MET_3
	WORD 		VERMELHO, 0, 0, 0, VERMELHO
	WORD 		VERMELHO, 0, CINZENTO, 0, VERMELHO
	WORD 		0, CINZENTO, CINZENTO2, CINZENTO, 0
	WORD 		VERMELHO, 0, CINZENTO, 0, VERMELHO
	WORD 		VERMELHO, 0, 0, 0, VERMELHO

DEF_EXPLOSAO:				; tabela de informações de uma explosão (altura, largura e cor de pixeis)
	WORD 		ALTURA_MET_3, LARGURA_MET_3
	WORD		0, COR_EXPLOSAO, 0, COR_EXPLOSAO, 0
	WORD		COR_EXPLOSAO, 0, COR_EXPLOSAO, 0, COR_EXPLOSAO
	WORD		0, COR_EXPLOSAO, 0, COR_EXPLOSAO, 0
	WORD		COR_EXPLOSAO, 0, COR_EXPLOSAO, 0, COR_EXPLOSAO
	WORD		0, COR_EXPLOSAO, 0, COR_EXPLOSAO, 0

PLACE       1000H			; tabela de dados importantes para o decorrer do jogo

ENERGIA:     	WORD  MAX_ENERGIA			; guarda a energia da nave
COLUNA_NAVE: 	WORD  COLUNA				; guarda a coluna da nave
LINHA_MET: 		WORD  LINHA_MIN, LINHA_MIN, LINHA_MIN, LINHA_MIN			; guarda a linha do meteoro
COLUNA_MET:		WORD  MIN_COLUNA, MIN_COLUNA, MIN_COLUNA, MIN_COLUNA			; guarda a coluna do meteoro
TIPO_MET:		WORD  0, 0, 0, 0						; guarda o tipo do meteoro (0 se é bom, 1 se é mau)

LINHA_DISPARO:  WORD  -1					; guarda a linha do disparo (começa desativado)
COLUNA_DISPARO: WORD  -1					; guarda a linha do disparo (começa desativado)

MODO_JOGO:		WORD  ECRA_INICAL			; indica que modo de jogo em que se encontra
TECLA_PREMIDA:  WORD  -1					; indica a última tecla premda no teclado (ou que não houve
											; tecla premida se for -1)
HA_TECLA_PREMIDA: WORD 0					; indica se se está a carregar continuamente numa tecla
RECOMECA:		WORD  0						; fica a 1 se o jogo é suposto recomeçar
EXCECAO:        WORD  -1					; indica o número da última interrupção ocorrente (ou -1 se
											; não ocorreu nenhuma)

contador_atraso_nave:  WORD ATRASO			; contador usado para gerar o atraso

PLACE 		1050H			; tabela de exceções
tab: WORD  rot_int_0		; interrupção do meteoro
	 WORD  rot_int_1		; interrupção do disparo
	 WORD  rot_int_2		; interrupção da energia


PLACE       01100H
	pilha:
		STACK  0100H			; pilha com espaço para 100H words
	SP_inicial:					; endereço onde começa o SP
	

; **********************************************************************
; * Código
; **********************************************************************
PLACE      0
inicio:	

apaga_avisos:		; procedimento que trata de limpar o ecrã de avisos, coloca o ecrã de início e inicializa variáveis
	MOV   [APAGA_AVISO], R1
	MOV   [APAGA_ECRA], R1
	MOV   R1, 0
	MOV   R2, 1
	MOV   [SELECIONA_CENARIO_FUNDO], R1
	MOV   [SELECIONA_SOM], R1
	MOV   [N_REPRODUCOES], R2
	MOV   [PLAY_SOM], R1
	MOV   R1, ENERGIA
	MOV   R2, MAX_ENERGIA
	MOV   [R1], R2
	ADD   R1, 2
	MOV   R2, COLUNA
	MOV   [R1], R2
	ADD   R1, 2
	MOV   R4, N_METEOROS
	ADD   R4, 1
	MOV   R2, LINHA_MIN
	MOV R1, LINHA_MET
	linhas_met_inicia:
	MOV   [R1], R2
	ADD   R1, 2
	SUB   R4, 1
	JNZ   linhas_met_inicia
	MOV   R1, LINHA_DISPARO
	MOV   R2, POSICAO_DEFAULT
	MOV   [R1], R2
	ADD   R1, 2
	MOV   [R1], R2
	MOV   R1, TECLA_PREMIDA
	MOV   [R1], R2
	MOV   R1, RECOMECA
	MOV   R2, 0
	MOV   [R1], R2
	MOV   R1, contador_atraso_nave
	MOV   R2, ATRASO
	MOV   [R1], R2


inicializacoes:
	MOV  SP, SP_inicial ; inicialização da stack
	MOV  BTE, tab		; inicialização da tabela de exceções
    MOV  R4, DISPLAYS   ; endereço do periférico dos displays
	MOV  R5, ENERGIA	; endereço da energia da nave
	MOV  R10, [R5]		; obtém a energia da nave
	CALL hexa_para_decimal	; converte o número em algo similar a um decimal em binário
	MOV  [R4], R10		; escreve no display a energia inicial na forma similar a um decimal
	EI0					; permite interrupções 0
	EI1					; permite interrupções 1
	EI2					; permite interrupções 2
	EI3					; permite interrupções 3
	EI					; permite interrupções (geral)


; ******************************* CICLO JOGO **************************************************

; CICLO_JOGO: único loop do programa, executa todos os procedimentos necessários.
; Assim, o programa é executado segundo o procedimento de rotinas cooperativas.

ciclo_jogo:
	CALL  modos_de_jogo				; decide qual é o modo de jogo em que se encontra
	MOV   R0, [RECOMECA]
	CMP   R0, 0						; se foi dada a instrução para recomeçar,
	JNZ   inicio					; o jogo recomeça
	CALL  trata_excecoes			; trata das interrupções do programa (meteoros, disparo, energia)
	CALL  espera_tecla;_1			; lê do teclado e executa os procedimentos do teclado
	JMP   ciclo_jogo				; repete




; ******************************* CONTROLO DO JOGO *********************************************

; CONTROLAR OS MODOS DE JOGO

; MODO_DE_JOGO: procedimento que escolhe o estado em que se encontra o jogo.
; R6: endereço da instrução de ler o cenário de fundo
; R7: variável indicadora do modo de jogo
; R8: endereço da variável de modo de jogo

modos_de_jogo:							; procedimento para controlar os diversos modos de jogo (start, game, pause e game over)
	PUSH R6								; guarda o valor dos registos
	PUSH R7
	PUSH R8
	MOV R8, MODO_JOGO					; endereço que indica o modo em que se encontra o jogo
	MOV R6, INDICA_CENARIO_FUNDO			
	MOV R7, [R6]						; verifica qual é a imagem de fundo
	MOV [R8], R7						; coloca na variável o modo em que se encontra o jogo 
	CALL  trata_modos_jogo				; procedimentos para cada modo
	POP R8								; restaura o valor dos registos
	POP R7
	POP R6
	RET

; TRATA_MODOS_JOGO: determina o procedimento que vai correr consoante o modo de jogo
; R0: última tecla premida no teclado
; R7: variável indicadora do modo de jogo

trata_modos_jogo:
	PUSH R0								; guarda o valor do registo
	MOV R0, TECLA_PREMIDA
	MOV R0, [R0]						; obtem a última tecla premida no teclado
	inicio_jogo:
	CMP R7, ECRA_INICAL					; se o jogo não está no ecrã de início,
	JNZ jogo_acao						; passa à próxima comparação
	CALL comeca_jogo					; caso contrário passa à rotina de começar o jogo
	JMP sai_trata_modos_jogo			; sai da rotina
	jogo_acao:
	CMP R7, ECRA_JOGO					; se o jogo não está a decorrer,
	JNZ jogo_pausa						; passa à próxima comparação
	JMP sai_trata_modos_jogo			; sai da rotina (cabe ao teclado de escolher os procedimentos neste caso)
	jogo_pausa:
	CMP R7, ECRA_PAUSA					; se o jogo não estiver em pausa,
	JNZ jogo_over						; passa à próxima comparação
	CALL pausa							; caso contrário passa à rotina de tirar o modo de pausa
	JMP sai_trata_modos_jogo			; sai da rotina
	jogo_over:
	CALL game_over						; se todas as comparações anteriores falharem, o jogo acabou
	sai_trata_modos_jogo:
	POP R0								; restaura o valor do registo
	RET
	
; COMECA_JOGO: rotina para quando o jogo ainda não começou
; R7: guarda a letra C para verificar se essa tecla foi premida e os números para
; tocar sons no Media CENTER
; R0: indica a tecla que foi pressionada

comeca_jogo:							; procedimento para começar o jogo (só é executado até a tecla C ser pressionada uma vez)
	PUSH R7								; guarda o valor do registo
	MOV R7, COMECA
	CMP R0, R7							; verifica se a tecla C foi pressionada		
	JNZ sai_comeca_jogo					; se não, sai da rotina e volta a esperar
	MOV R7, 1							; caso contrário o jogo começa
	MOV [SELECIONA_SOM], R7				; escolhe o som 1
	MOV [N_REPRODUCOES], R7				; o som 1 vai ser reproduzido 1 vez
	MOV [PLAY_SOM], R7					; toca-se o som 1
	MOV [SELECIONA_CENARIO_FUNDO], R7  	; o fundo muda para a imagem de game
	CALL desenha_nave					; desenha a nave
	sai_comeca_jogo:
	POP R7								; restuara o valor do registo
	RET

; PAUSA: rotina para quando o jogo está parado, ou seja, carregou-se uma vez no botão D
; R7: guarda a letra D para verificar se a tecla D voltou a ser premida, assim comos os endereços
; necessários para certas comparações
; R0: indica a tecla que foi pressionada

pausa:									; procedimento para quando o jogo está em pausa
	PUSH R7								; guarda o valor do registo
	MOV R7, TERMINA						; verifica se a tecla pressionada é a que termina o jogo
	CMP R0, R7							; se assim for,
	JZ  termina_jogo_em_pausa			; o jogo termina	
	MOV R7, PAUSA
	CMP R0, R7							; enquanto a tecla de pausa não for carregada novamente,
	JNZ sai_pausa						; o jogo mantém-se pausado, nada muda
	MOV R7, HA_TECLA_PREMIDA
	MOV R7, [R7]						; obtém a indicação de que se está a premir uma tecla
	CMP R7, 1							; se ainda se está a premir uma tecla,
	JZ  sai_pausa						; o jogo acabou de ser colocado em pausa, e assim se mantém
	MOV R7, ECRA_JOGO					; caso contrário,
	MOV [SELECIONA_CENARIO_FUNDO], R7	; volta-se a colocar o fundo de jogo
	MOV R7, MUSICA_INICIO
	MOV [SELECIONA_SOM], R7
	MOV [RETOMA_SOM], R7				; a música do jogo volta a tocar
	MOV R7, 1
	MOV [HA_TECLA_PREMIDA], R7			; indica que se está a carregar numa tecla (impedindo ciclos infinitos)
	JMP sai_pausa						; sai da rotina
	termina_jogo_em_pausa:				; para quando o jogador escolhe terminar o jogo
	MOV R7, MUSICA_GAME_OVER
	MOV [SELECIONA_SOM], R7
	MOV [PLAY_SOM], R7
	MOV R7, ECRA_FIM_DE_JOGO
	MOV [APAGA_ECRA], R7				; apaga o ecrã
	MOV [SELECIONA_CENARIO_FUNDO], R7	; coloca o ecrã de fim de jogo	
	sai_pausa:
	POP R7								; restuara o valor do registo
	RET

; GAME_OVER: rotina para quando o jogo acabou e se está à espera que recomece
; R7: guarda a letra C para verificar se é para recomeçar o jogo, assim como o endereço da variável
; que indica se se vai iniciar um novo jogo
; R0: indica a tecla que foi pressionada

game_over:								; procedimento para quando o jogo acabou
	PUSH R7								; guarda o valor do resgisto
	MOV R7, COMECA
	MOV [APAGA_ECRA], R7
	CMP R0, R7							; enquanto não for premida a tecla para recomeçar
	JNZ sai_game_over					; o jogo mantém-se no ecrã de game over
	MOV R7, 1							; caso contrário,
	MOV [RECOMECA], R7					; guarda em memória que é para recomeçar o jogo
	mov [TERMINA_TODOS_SONS], R7
	sai_game_over:
	POP R7								; restuara o valor do registo
	RET


; ******************************* PROCEDIMENTO EXCEÇÕES ****************************************

; TRATA_EXCECOES: rotina para verificar se se vai executar algum procedimento de interrupção
; R1: ao início é usado para verificar se o jogo está a decorrer, sendo usado depois para guardar
; o valor da variável EXCECAO, que indica se houve alguma exceção
; R2: serve para fazer comparações com R1, guardando valores para verificar se ocorreu alguma
; interrupção
; R10: usado para guardar o decremento antes de chamar a rotina manipula_energia, no caso de ter
; ocorrido a interrupção 2

trata_excecoes:
	PUSH R1						; guarda o valor dos registos
	PUSH R2
	PUSH R10
	MOV R1, MODO_JOGO
	MOV R1, [R1]				; obtem o estado atual do jogo
	MOV R2, ECRA_JOGO			; obtem o número correspondente ao jogo em ação
	CMP R1, R2					; se o jogo não estiver em ação
	JNZ sai_trata_excecoes		; não se trata das interrupções
	MOV R1, EXCECAO
	MOV R1, [R1]				; obtem o valor indicador do exceções
	eh_excecao_meteoro:
	MOV R2, 0
	CMP R1, R2					; se a exceção não está marcada como 0,
	JNZ eh_excecao_disparo		; passa à próxima comparação
	CALL varios_meteoros			; caso contrário mexe-se os meteoros
	JMP sai_trata_excecoes		; sai da rotina
	eh_excecao_disparo:
	MOV R2, 1
	CMP R1, R2					; se a exceção não está marcada como 1,
	JNZ eh_excecao_energia		; passa à próxima comparação
	CALL move_disparo			; caso contrário, mexe o disparo se este estiver ativo
	JMP sai_trata_excecoes		; sai da rotina
	eh_excecao_energia:
	MOV R2, 2	
	CMP R1, R2					; se a exceção não está marcada como 2,
	JNZ sai_trata_excecoes		; sai da rotina
	MOV R10, INCREMENTO
	NEG R10						; inicia o incremento necessário
	CALL manipula_energia		; diminui-se a energia do rover
	sai_trata_excecoes:
	MOV R2, -1
	MOV R1, EXCECAO
	MOV [R1], R2				; guarda o valor -1 na variável exceção, indicando que não houve
								; interrupções ou que foram todas tratadas
	POP R10						; restuara o valor dos registos
	POP R2
	POP R1
	RET

; ******************************* PROCEDIMENTO TECLADO *****************************************

; PROCEDIMENTO PARA ESPERAR POR TECLAS

; ESPERA_TECLA: tratam de varrer o teclado linha a linha, verificando
; se o utilizador premiu alguma tecla. Se foi premida, é depois guardada em memória a tecla
; carregada e são executados os procedimentos associados a essa tecla.
; R1: linha a analisar do teclado; R2: endereço de entrada do teclado (linhas); R3: endereço de saída do teclado (colunas);
; R4: endereço do display; R5: máscara para isolar os 4 bits mais à direita; R8: serve de contador

espera_tecla:
	PUSH R1					; guarda os valores dos registos
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R5
	PUSH R7
	PUSH R8
	MOV  R2, TEC_LIN    	; endereço do periférico das linhas
    MOV  R3, TEC_COL    	; endereço do periférico das colunas
    MOV  R4, DISPLAYS   	; endereço do periférico dos displays
	MOV  R5, MASCARA		; endereço da energia da nave
	MOV  R8, 0		   		; inicia o contador (R8) a 0	
espera_tecla_1:
	MOV  R1, LINHA4    		; comeca a analisar a linha 4 
	SHL  R1, 1         		; adapta a linha 4 ao loop que se segue  

espera_tecla_2:          	; neste ciclo espera-se até uma tecla ser premida
    SHR  R1, 1           	; avanca para a linha anterior 
	JZ   nao_ha_tecla		; se já analisou todas as linhas e não detetou nada, então não há teclas carregadas
    MOVB [R2], R1        	; escrever no periférico de saída (linhas)
    MOVB R0, [R3]        	; ler do periférico de entrada (colunas)
	MOV  R11, R0			; procedimento para gerar numeros aleatorios (só é importante para os meteoros)
    AND  R0, R5          	; elimina bits para além dos bits 0-3
    CMP  R0, 0           	; há tecla premida?
    JZ   espera_tecla_2  	; se nenhuma tecla premida, repete
	MOV  R7, R1          	; copia a linha da tecla carregada
	CALL traduz_tecla		; converte os valores da linha e da coluna da tecla no valor dessa tecla
	MOV  R7, [MODO_JOGO]
	CMP  R7, ECRA_JOGO		; verifica se o jogo está a decorrer
	JNZ sai_espera_tecla_2	; se não está, sai da rotina
	CALL rotinas_teclado	; trata dos processos associados a cada tecla	
	sai_espera_tecla_2:
	MOV  R7, TECLA_PREMIDA
	MOV [R7], R0			; guarda em memória a tecla que foi premida
	POP R8					; restaura o valor dos registos
	POP R7
	POP R5
	POP R4
	POP R3
	POP R2
	POP R1
	RET
nao_ha_tecla:
	MOV R7, -1
	MOV [TECLA_PREMIDA], R7		; guarda em memória o valor -1, indicando que nenhuma tecla foi carregada
	MOV R7, 0
	MOV [HA_TECLA_PREMIDA], R7	; guarda em memória que nenhuma tecla foi carregada
	POP R8						; restaura o valor dos regitos
	POP R7
	POP R5
	POP R4
	POP R3
	POP R2
	POP R1
	RET


; PROCEDIMENTOS TECLADO

; ROTINAS_TECLADO: através de comparações consecutivas, invoca a rotina associada à tecla que
; foi carregada.
; R0: guarda o valor da tecla que foi carregada; R7: serve maioritariamente para guardar valores
; e endereços necessários.

rotinas_teclado:
move_esquerda:							; procedimento para verificar se a tecla carregada é o 0
	CMP R0, ESQUERDA					; se a tecla premida não for 0,
	JNZ move_direita					; passa à próxima comaparação
	CALL  mov_esquerda					; caso contrário, move a nave para a esquerda
	MOV R7, 1
	MOV [HA_TECLA_PREMIDA], R7			; guarda em memória que uma tecla está a ser carregada
	RET	

move_direita:							; procedimento para verificar se a tecla carregada é o 2
	CMP R0, DIREITA						; se a tecla premida não for 2
	JNZ testa_avanco					; passa à próxima comparação
	CALL  mov_direita					; caso contrário, move para a direita
	MOV R7, 1
	MOV [HA_TECLA_PREMIDA], R7			; guarda em memória que uma tecla está a ser carregada
	RET

testa_avanco:							; verifica se uma tecla está a ser carregada continuamente
	MOV R7, HA_TECLA_PREMIDA
	MOV R7, [R7]
	CMP R7, 1							; se uma tecla está a ser carregada (e essa tecla não é 0 nem 2),
	JZ  sai_rotinas_teclado				; sai da rotina

dispara_nave:							; procedimento para verificar se a tecla carregada é o 1
	CMP R0, DISPARO						; se a tecla premida não for 1,
	JNZ inicia_pausa						; passa à próxima comaparação
	CALL testa_disparo					; caso contrário, inicia um disparo
	MOV R7, 1
	MOV [HA_TECLA_PREMIDA], R7			; guarda em memória que uma tecla está a ser carregada
	RET


inicia_pausa:							; procedimento para iniciar uma pausa (tecla D)
	MOV R7, PAUSA
	CMP R0, R7							; verifica se a tecla premida é a tecla D 
	JNZ termina_jogo					; se não for passa à próxima comparação
	MOV R7, ECRA_PAUSA
	MOV [SELECIONA_CENARIO_FUNDO], R7	; caso contrário inicia um perído de pausa
	MOV R7, MUSICA_INICIO
	MOV [PAUSA_SOM], R7					; coloca a música em pausa
	MOV R7, 1
	MOV [HA_TECLA_PREMIDA], R7			; guarda em memória que uma tecla está a ser carregada
	RET

termina_jogo:							; procedimento para terminar o jogo por vontade do jogador
	MOV R7, TERMINA
	CMP R0, R7							; verifica se a tecla premida é a tecla E
	JNZ sai_rotinas_teclado				; se não for, salta
	MOV R7, ECRA_FIM_DE_JOGO
	MOV [SELECIONA_CENARIO_FUNDO], R7	; caso contrário termina o jogo
	MOV [APAGA_ECRA], R7
	MOV [TERMINA_TODOS_SONS], R7		; para a reprodução da música de jogo
	MOV R7, MUSICA_GAME_OVER
	MOV [SELECIONA_SOM], R7
	MOV [PLAY_SOM], R7					; põe a tocar a música de fim de jogo
	MOV R7, 1
	MOV [HA_TECLA_PREMIDA], R7			; guarda em memória que uma tecla está a ser carregada
	RET

sai_rotinas_teclado:
	RET



; ********************************************************************************************
; ************************************ ROTINAS ***********************************************
; ********************************************************************************************

; *********************************** ROTINAS DA NAVE *****************************************

; MOVER A NAVE
; MOVE A NAVE PARA A ESQUERDA

; MOV_ESQUERDA: faz com que a nave se mova para a esquerda, desde que esta não esteja no limite do ecrã
; R7: guarda endereços necessários; R8: guarda a coluna onde está a nave e a coluna para onde ela se vai
; movimentar.
mov_esquerda:
	MOV R8, [contador_atraso_nave]	; obtem o valor atual do contador de atraso
	MOV R7, ATRASO
	CMP R8, R7						; se o atraso estiver iniciado (tiver valor diferente do inicial),	
	JNZ entra_atraso_nave_esq		; a nave espera
testa_limite_esquerdo:				; verifica se a nave se pode mover para a esquerda
	MOV	 R7, COLUNA_NAVE
	MOV  R8, [R7]					; copia a coluna onde a nave se encontra
	MOV  R7, MIN_COLUNA	
	CMP	 R8, R7						; verifica se a coluna onde e a nave está é a mais à esquerda
	JZ   sai_mov_esquerda			; se é, não se move
	MOV R10, 0
	MOV [SELECIONA_ECRA], R10		; a nave é desenhada no ecrã 0
	CALL apaga_nave					; se não, apaga a nave

coluna_seguinte_esquerda:			; muda a coluna onde começa a nave
	SUB	 R8, 1
	MOV  [COLUNA_NAVE], R8			; muda o valor da coluna da nave na memória
	CALL desenha_nave				; vai desenhar o boneco de novo na nova coluna
entra_atraso_nave_esq:				; controla o movimento da nave usando um compasso de espera
	MOV R8, contador_atraso_nave
	CALL rotina_atraso
sai_mov_esquerda:
	RET	


; MOV_DIREITA: faz com que a nave se mova para a direita, desde que esta não esteja no limite do ecrã
; R7: guarda endereços necessários; R8: guarda a coluna onde está a nave; R6: guarda a coluna para onde ela se vai
; movimentar.
; MOVE A NAVE PARA A DIREITA
mov_direita:
	MOV R8, [contador_atraso_nave]	; obtem o valor atual do contador de atraso
	MOV R7, ATRASO
	CMP R8, R7						; se o atraso estiver iniciado (tiver valor diferente do inicial),
	JNZ entra_atraso_nave_dir		; a nave espera
testa_limite_direito:				; verifica se a nave se pode mover para a direita
	MOV  R7, COLUNA_NAVE
	MOV  R8, [R7]					; obtém-se a coluna onde está a nave
	MOV	 R7, DEF_NAVE
	ADD  R7, 2
	MOV  R6, [R7]					; obtém-se a largura da nave
	ADD	 R6, R8						; soma à coluna da nave a sua largura
	SUB  R6, 1						; corrige o valor
	MOV	 R7, MAX_COLUNA				; obtém-se o valor da coluna mais à direita
	CMP	 R6, R7						; verifica se a nave está no extremo direito
	JZ   sai_mov_direita			; se for, não se move
	MOV R10, 0
	MOV [SELECIONA_ECRA], R10		; a nave é desenhada no ecrã 0
    CALL apaga_nave					; se não, apaga a nave

coluna_seguinte_direita:			; muda a coluna onde começa a nave
	ADD	 R8, 1
	MOV  [COLUNA_NAVE], R8			; muda o valor da coluna da nave na memória
	CALL desenha_nave				; vai desenhar o boneco de novo na nova coluna
entra_atraso_nave_dir:				; controla o movimento da nave usando um compasso de espera
	MOV R8, contador_atraso_nave
	CALL rotina_atraso
sai_mov_direita:
	RET
	

; DESENHAR E APAGAR A NAVE

; DESENHA_NAVE - desenha a nave consoante a sua posição atual
; R1 - guarda a linha da nave
; R2 - guarda a coluna da nave
; R3 - indica a cor de que se vai pintar o pixel
; R4 - referência do desenho do boneco
; R5 - altura da nave
; R6 - largura da nave
; R7 - linha a pintar
; R8 - coluna a pintar

desenha_nave:				; desenha a nave na sua posição atual
	PUSH R1					; guarda os valores dos registos
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R5
	MOV R1, LINHA			; linha onde começa a nave
	MOV R2, [COLUNA_NAVE]	; coluna onde comeca a nave
	MOV	R4, DEF_NAVE		; endereço da tabela que define o boneco
	MOV R5, [R4]            ; obtem a altura da nave
	ADD R4, 2
	MOV	R6, [R4]			; obtém a largura da nave
	ADD	R4, 2				; endereço da cor do 1º pixel (2 porque a largura é uma word)
	MOV R7, R1				; copia a linha da nave
	MOV R8, R2				; copia a coluna da nave
	CALL desenha_linhas
	POP R5					; restaura os valores antigos dos registos
	POP R4
	POP R3
	POP R2
	POP R1
	RET

; APAGA_NAVE - apaga a nave da posição atual
; R1 - guarda a linha da nave
; R2 - guarda a coluna da nave
; R3 - indica a cor de que se vai pintar o pixel
; R4 - referência do desenho do boneco
; R5 - altura da nave
; R6 - largura da nave
; R7 - linha a pintar
; R8 - coluna a pintar

apaga_nave:					; retira a nave da sua posição atual
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R5
	PUSH R6
	PUSH R7
	PUSH R8
	MOV R1, LINHA			; linha onde começa a nave
	MOV	R2, [COLUNA_NAVE]	; coluna onde começa a nave
	MOV	R4, DEF_NAVE		; endereço da tabela que define a nave
	MOV R5, [R4]            ; obtem a altura da nave
	ADD R4, 2               ; enderco da largura da nave
	MOV	R6, [R4]			; obtém a largura da nave
	MOV R7, R1				; copia a linha da nave
	MOV R8, R2				; copia a coluna da nave
	CALL apaga_linhas
	POP R8					; restaura os valores antigos dos registos
	POP R7
	POP R6
	POP R5
	POP R4
	POP R3
	POP R2
	POP R1
	RET
	

; ****************************** ROTINAS DO DISPARO ********************************************

; TESTA_DISPARO: verifica se já há um disparo ativo ou não. Se houver, a rotina de interrupção
; fá-lo-á mover-se. Caso contrário, inicia um novo disparo.
; R1: guarda a linha onde vai ser criado o disparo; R2: guarda endereços e elementos importantes
; para comparações
testa_disparo:
	PUSH R1						; guarda o valor dos registos
	PUSH R2
	MOV R2, LINHA_DISPARO
	MOV R1, [R2]				; obtém a linha do disparo
	MOV R2, -1
	CMP R1, R2					; se o valor da linha não for -1,
	JNZ sai_testa_disparo 		; há um disparo ativo e nada acontece
	CALL inicia_disparo			; caso contrário inicia um disparo
	sai_testa_disparo:
	POP R2						; restaura o valor dos registos
	POP R1
	RET

; INICIA_DISPARO: cria um novo disparo
; R1: guarda a linha onde vai ser criado o disparo; R2: guarda a coluna onde vai ser criado o disparo;
; R3: guarda endereços e elementos importantes para comparações; R10: valor para alterar o valor da
; energia na rotina manipula_energia
inicia_disparo:
	PUSH R3						; guarda o valor do registo
	MOV R3, 0
	MOV [SELECIONA_ECRA], R3
	MOV R10, INCREMENTO
	NEG R10						; inicialização para a rotina de manipula_energia
	CALL manipula_energia		; retira 5% da energia da nave
	MOV R1, SOM_DISPARO
	MOV [SELECIONA_SOM], R1
	MOV [PLAY_SOM], R1			; toca o som de disparo da nave
	MOV R1, LINHA				; obtém a linha da nave
	MOV R2, COLUNA_NAVE
	MOV R2, [R2]				; obtém a coluna da nave
	SUB R1, 1					; a linha do disparo será a anterior à nave
	ADD R2, 2					; a coluna da nave será a do centro da nave
	MOV R3, LINHA_DISPARO
	MOV [R3], R1				; guarda em memória a linha do disparo
	MOV R3, COLUNA_DISPARO
	MOV [R3], R2				; guarda em memória a coluna do disparo
	MOV R3, COR_DISPARO			; inicialização para desenhar o disparo
	CALL desenha_disparo		; desenha o disparo
	POP R3						; restuara o valor dos registos
	RET

; DESENHA_DISPARO: deseha o disparo na posição designada
; R1: linha do disparo; R2: coluna do disparo; R3: cor do disparo
desenha_disparo:
	MOV [DEFINE_LINHA], R1
	MOV [DEFINE_COLUNA], R2
	MOV [DEFINE_PIXEL], R3
	RET

; MOVE_DISPARO: trata de mover o disparo previamente criado
; R1: linha do disparo; R2: guarda endereços, valores importantes para comparações
; e a coluna do disparo; R3: guarda valores de cores de pixeis importantes e valores
; para comparações; R4:auxiliar para comparações
move_disparo:
	PUSH R1							; guarda o valor dos registos
	PUSH R2
	PUSH R3
	PUSH R4
	MOV R3, 0
	MOV [SELECIONA_ECRA], R3		; o disparo é desenhado no ecrã 0	
	MOV R2, LINHA_DISPARO
	MOV R1, [R2]					; obtém a linha do disparo
	MOV R2, -1
	CMP R1, R2						; se o disparo não está ativo,
	JZ  sai_move_disparo			; não se move
	MOV R2, COLUNA_DISPARO
	MOV R2, [R2]					; obtém a coluna do disparo
	MOV R3, 0						; inicialização para apagar o disparo da sua posição
	CALL desenha_disparo			; apaga o disparo
	MOV R3, LINHA_LIM_DISPARO
	CMP R1, R3						; se essa linha for a linha limite do disparo,
	JZ  reinicia_disparo			; o disparo reinicia
	SUB R1, 1						; avança a linha do disparo
	MOV R3, COR_DISPARO				; obtém a cor do disparo
	CALL desenha_disparo			; desenha o disparo na nova posição
	MOV R2, LINHA_DISPARO
	MOV [R2], R1					; atualiza na memória o novo valor da linha do disparo
	JMP sai_move_disparo			; sai da rotina
	reinicia_disparo:
	MOV R2, -1
	MOV R3, LINHA_DISPARO
	MOV [R3], R2					; fica indicado na memória que o disparo está desativado
	sai_move_disparo:
	POP R4							; restaura o valor dos registos
	POP R3
	POP R2
	POP R1
	RET
	
	
	


; ****************************** ROTINAS DO METEORO *******************************************+

; PROCEDIMENTOS DE INÍCIO

; VARIOS_METEOROS: processo para regular o movimento dos 4 movimentos.
; R10: incremento que controla qual o meteoro a mexer em cada iteração.
varios_meteoros:
	PUSH R1								; guarda o valor dos registos
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R5	
	PUSH R10
	MOV R10, N_METEOROS					; há 4 meteoros
	SHL R10, 1							; multiplica-se por 2, começando por mexer o último
	ciclo_meteoros:
	CALL escolhe_ecra					; escolhe o ecrã onde vai ser desenhado
	CALL mexe_meteoro					; trata de mexer o meteoro
	SUB R10, 2							; passa para o meteoro anterior
	JNN ciclo_meteoros					; se o incremento for negativo, já se tratou de todos
	POP R10								; restaura os valores antigos dos registos
	POP R5
	POP R4
	POP R3
	POP R2
	POP R1
	RET

; ESCOLHE_ECRA: consoante o índice do meteoro (R10), escolhe o ecrã onde vai atuar o mexe_meteoro
; R10: indice do meteoro
escolhe_ecra:
	PUSH R10							; guarda-se o valor do índice
	SHR R10, 1							; divide-se por 2
	ADD R10, 1							; soma-se 1, obtendo um valor entre 1 e 4
	MOV [SELECIONA_ECRA], R10			; escolhe-se o ecrã correspondente
	POP R10								; retoma o valor de R10
	RET

; MEXE_METEORO: "parte 1" do procedimento do movimento de meteoros. Inicializa o valor dos registos e, no caso
; de estar a ser criado um novo meteoro, atribui-lhe uma coluna.
; R1: linha do meteoro; R4: endereços; ; R8: para obter o valor da nova coluna do meteoro

mexe_meteoro:							; procedimento de inicialização de um meteoro
	MOV R4, LINHA_MET
	MOV R1, [R4+R10]					; lê-se da memória qual é a linha onde está o meteoro	
	CMP R1, 0							; se a linha não for a primeira... (linha 0)
	JNZ  skip_escolhe_coluna			; não escolhe a coluna
	CALL escolhe_coluna
	skip_escolhe_coluna:
	JMP move_meteoro					; caso contrário move-se

; ESCOLHE_COLUNA: procedimento para meteoros que vão ser desenhados na primeira coluna, obtendo aleatoriamente a coluna
; onde vai ser desenhado usando o valor do output do teclado e o incremento do meteoro (R10)
; R11: cópia do último valor do output do teclado (para originar valores aleatórios); R10: incremento indicador do meteoro
; que se está a mexer; R7: endereços e valores para comparações
escolhe_coluna:
	PUSH R7								; guarda o valor dos registos
	PUSH R11
	SHR R11, 5							; obtem os 3 bits mais à esquerda da cópia do output do teclado (dá um número entre 0 e 7)
	ADD R11, R10						; adiciona-se a esse número o incremento indicador do meteoro que se está a manipular
										; (para evitar que meteoros se gerem na mesma coluna ao mesmo tempo)
	MOV R7, 8
	MOD R11, R7							; obtem-se o resto da divisão inteira do número obtido por 8, dando um número entre 0 e 7
	SHL R11, 3							; multilpica o valor obtido por 8, obtendo a coluna onde vai ser gerado o meteoro							
	MOV R7, COLUNA_MET
	MOV [R7+R10], R11					; guarda a coluna do meteoro na memória
	POP R11								; repõe o valor dos registos
	POP R7
	RET

; MOVE_METEORO: "parte 2" do procedimento do movimento de meteoros. Chama as rotinas necessárias para mexer o meteoro.
; R1: linha do meteoro; R2: para comparar valores e guardar a coluna do meteoro; R3: valores para comparações
move_meteoro:							; procedimento que controla as rotinas necessárias para mexer um meteoro
	MOV R1, LINHA_MET
	MOV R1, [R1+R10]					; R1 tem o valor da linha atual do meteoro
	MOV R2, MAX_LINHA					; R2 é a linha máxima onde se pode desenhar o meteoro
	CMP R1, R2							; se o meteoro for desenhado numa linha maior que a linha máxima...
	JGT volta_ao_inicio					; recomeça e volta à linha 0
	MOV R2, COLUNA_MET
	MOV R2, [R2+R10]					; R2 tem o valor da coluna atual do meteoro
	CALL escolhe_linha					; rotina que verifica qual será a forma do meteoro desenhado
	MOV R3, -1
	CMP R3, R4							; verifica se o meteoro está sob a forma de explosão (-1 fica guardado em R4
										; depois de escolhe_linhas)
	JZ  volta_ao_inicio					; se sim, apaga a explosão e o meteoro volta ao início	
	CALL apaga_meteoro					; rotina que apaga o meteoro
	CALL desenha_meteoro				; rotina que desenha o meteoro na nova posição
	RET

; VOLTA_AO_INICIO: procedimento para quando o meteoro chegou ao fundo do ecrã, recomeçando na primeira linha
; na próxima vez que a rotina é chamada.
; R1: nova linha do meteoro; R4: endereço da linha do meteoro
volta_ao_inicio:						; procedimento para quando o meteoro chega ao fundo do ecrã
	CALL apaga_meteoro
	MOV R1, 0							; define a nova linha a 0
	MOV R4, LINHA_MET					; obtém o endereço da linha do meteoro	
	MOV [R4+R10], R1						; escreve na memória o novo valor 0
	RET

; ESCOLHE_LINHA: rotina para atribuir qual será a forma do meteoro consoante a linha em que está, podendo estar
; numa das duas formas indefinidas, estar na linha onde tem de ser atribuído uma cor ou estar já definido com cor.
; No final da rotina, R4 guarda o endereço correspondente à forma correta do meteoro.
; R1: linha do meteroro; R3: valores para comparações; R4: guarda o endereço da forma correta do meteoro
escolhe_linha:							; rotina que escolhe a forma do meteoro consoante a linha para onde se vai mover
	linhas_0:							; linhas 0 a 1
	MOV R3, LINHA_0
	CMP R1, R3							; compara a linha do meteoro e a linha 2
	JGE linhas_1						; se for maior, passa à próxima verificação
	MOV R4, METEORO_INDEF_1				; se não for, o meteoro tem a forma indefinida 1
	JMP sai_escolhe_linhas				; sai da rotina
	linhas_1:							; linhas 2 a 4
	MOV R3, LINHA_1
	CMP R1, R3							; compara a linha do meteoro e a linha 5
	JGE linha_escolhe_linhas			; se for maior, passa à próxima verificação
	MOV R4, METEORO_INDEF_2				; se não for, o meteoro tem forma indefinida 2
	JMP sai_escolhe_linhas				; sai da rotina
	linha_escolhe_linhas:				; linha 5 (onde se decide a cor do meteoro)
	MOV R3, LINHA_1
	CMP R1, R3							; compara a linha do meteoro e a linha 5
	JNZ linhas_2						; se ele não estiver na linha 5, passa à próxima comparação
	CALL escolhe_cor					; se está na linha 5, define-se a cor que vai ter o meteoro
	JMP sai_escolhe_linhas				; sai da rotina
	linhas_2:							; linhas 6 ou mais
	CALL escolhe_forma					; chama a rotina que verifica se são bons ou maus e com que forma serão desenhados
	sai_escolhe_linhas:
	RET

; ESCOLHE_COR: rotina para quando o meteoro atinge a linha 5 (LINHA_!) e tem de lhe ser atribuído uma cor.
; R11: guarda uma cópia do último valor do output do teclado para atribuir a cor de forma pseudoaleatória (25%
; chances de ser bom, 75% de ser mau); R4: guarda o endereço da forma 1 do meteoro (seja este bom ou mau)
escolhe_cor:							; procedimento que escolhe uma cor para um meteoro na linha 5
	PUSH R3
	PUSH R11
	MOV R3, TIPO_MET
	SHR R11, 6							; pega no valor no input de entrada e obtém-se os 2 bits mais à esquerda, obtendo um número
										; entre 0 e 3, sendo o meteoro bom se o número obtido for 0 e mau se não for, havendo 25%
										; chances do meteoro ser bom e 75% de ser mau
	ADD R11, R10
	MOV R4, 4
	MOD R11, R4
	JZ  eh_meteoro_bom					; se se obter 0, o meteoro é bom
	MOV R4, 1
	MOV [R3+R10], R4
	MOV R4, DEF_METEORO_MAU_1			; move para R4 o valor do endereço das instruções do meteoro mau
	POP R11
	POP R3
	RET
eh_meteoro_bom:
	MOV [R3+R10], R11
	MOV R4, DEF_METEORO_BOM_1			; move para R4 o valor do endereço das instruções do meteoro mau	
	POP R11
	POP R3
	RET

; ESCOLHE_FORMA: rotina que lê da memória se o meteoro é bom ou mau e, cosoante a linha em que se encontra,
; desenha o meteoro na sua forma correta.
; R1: linha do meteoro; R3: valores para comparações; R4: endereços
escolhe_forma:							; rotina para escolher a forma que o meteoro toma consoante a linha e a sua cor
	MOV R4, TIPO_MET
	MOV R4, [R4+R10]					; obtém o tipo do meteoro
	MOV R3, -1
	CMP R3, R4							; se o meteoro tiver tipo "-1" (ou seja, está sob a forma de explosão)
	JZ  sai_eh_bom_ou_mau				; sai da rotina para que possa ser apagado e reiniciado
	CMP R4, 0							; verifica se o meteoro é bom
	JZ  eh_bom							; se for o meteoro é bom, caso contrário é mau
	
	zona_1_mau:							; meteoros maus das linhas 6 a 8
	MOV R3, LINHA_2
	CMP R1, R3							; se a linha do meteoro for maior do que 8
	JGE zona_2_mau						; passa à próxima comparação
	MOV R4, DEF_METEORO_MAU_1			; caso contrário será desenhado a forma 1 de um meteoro mau
	JMP sai_eh_bom_ou_mau				; sai da rotina
	zona_2_mau:							; meteoros maus das linhas 9 a 13
	MOV R3, LINHA_3
	CMP R1, R3							; se a linha do meteoro for maior do que 13,
	JGE zona_3_mau						; passa à próxima comparação
	MOV R4, DEF_METEORO_MAU_2			; caso contrário será desenhado a forma 2 de um meteoro mau
	JMP sai_eh_bom_ou_mau				; sai da rotina
	zona_3_mau:							; meteoros maus das linhas 14 a 31
	MOV R4, DEF_METEORO_MAU_3			; será desenhado a forma 3 de um meteoro mau
	JMP sai_eh_bom_ou_mau				; sai da rotina
	
	eh_bom:								; define endereços dos meteoros bom
	zona_1_bom:							; meteoros bons das linhas 6 a 8
	MOV R3, LINHA_2	
	CMP R1, R3							; se a linha do meteoro for maior do que 8
	JGE zona_2_bom						; passa à próxima comparação
	MOV R4, DEF_METEORO_BOM_1			; caso contrário será desenhado a forma 1 de um meteoro bom
	JMP sai_eh_bom_ou_mau				; sai da rotina
	zona_2_bom:							; meteoros bons das linhas 9 a 13
	MOV R3, LINHA_3
	CMP R1, R3							; se a linha do metroro for maior do que 13
	JGE zona_3_bom						; passa à próxima comparação,
	MOV R4, DEF_METEORO_BOM_2			; caso contrário será desenhado a forma 2 de um meteoro bom
	JMP sai_eh_bom_ou_mau				; sai da rotina
	zona_3_bom:							; meteoros bons das linhas 14 a 31	
	MOV R4, DEF_METEORO_BOM_3			; será desenhado a forma 3 de um meteoro bom
	
	sai_eh_bom_ou_mau:					; sair da rotina
	RET


; INCIALIZAÇÕES PARA ROTINAS DE DESENHAR E APAGAR

; DESENHA_METEORO: incializa o valor dos registos antes de chamar a rotina desenha_linhas.
; R1: linha do meteoro; R2: coluna do meteoro; R4: endereços; R5: altura do meteoro; R6: largura do meteoro;
; R7: cópia da linha do meteoro; R8: cópia da coluna do meteoro
desenha_meteoro:
	PUSH R1								; guarda o valor dos registos utilizados durante a rotina
	PUSH R2
	PUSH R3
	PUSH R5
	MOV R1, LINHA_MET
	MOV R1, [R1+R10]						; obtém a linha onde se vai desenhar o meteoro
	MOV R2, COLUNA_MET
	MOV R2, [R2+R10]						; obtém a coluna atual do meteoro
	MOV R5, [R4]            			; obtem a altura do meteoro
	ADD R4, 2
	MOV	R6, [R4]						; obtem a largura do meteoro
	ADD	R4, 2							; endereço da cor do 1º pixel (2 porque a largura é uma word)
	MOV R7, R1							; copia a linha do meteoro
	MOV R8, R2							; copia a coluna do meteoro
	JMP trata_colisoes					; antes de desenhar, trata das colisoes
	desenha_sem_colisoes:
	CALL desenha_linhas					; se não houver colisões, desenha o meteoro
	ADD R1, 1							; a linha avança um valor
	nao_desenha:	
	MOV R4, LINHA_MET					; endereço da linha atual da nave	
	MOV [R4+R10], R1					; copia para a memória o novo valor da linha
	POP R5								; coloca os registos com os valores anteriores à rotina
	POP R3
	POP R2
	POP R1
	RET

; TRATA_COLISOES: verifica através de comparações sucessivas se o meteoro selecionado colidiu com
; a nave ou o disparo.
; R1: linha do meteoro; R2: coluna do meteoro; R5: altura do meteoro; R6: largura do meteoro;
; R7: linha do meteoroa analisar (primeira ou última); R8: cópia da coluna do meteoro a analisar (primeira ou última)
; R3: linha do objeto de comparação; R4: coluna do objeto de comparação
trata_colisoes:
	PUSH R3								; guarda o valor dos registos
	PUSH R4
	PUSH R7
	PUSH R8
	colisao_disparo:					; verifica se o meteoro colidiu com o disparo
	MOV R3, [LINHA_DISPARO]
	CMP R3, R7
	JLT colisao_nave					; se o disparo estiver acima do meteoro, não há colisão
	ADD R7, R5							; obtem-se a linha de baixo do meteoro
	SUB R7, 1							; corrige_se o valor (para não ficar uma linha à frente)
	CMP R3, R7
	JGT colisao_nave					; se o disparo estiver em baixo do meteoro, não há colisão
	MOV R4, [COLUNA_DISPARO]
	CMP R4, R8
	JLT colisao_nave					; se o disparo estiver à esquerda do meteoro, não há colisão
	ADD R8, R6							; obtem-se a coluna da direita do meteoro
	SUB R8, 1							; corrige_se o valor (para não ficar uma coluna à frente)
	CMP R4, R8
	JGT colisao_nave					; se o disparo estiver à direita do meteoro, não há colisão
	MOV R8, 0							; se passar a todas estas comparações, o meteoro colidiu com o disparo
	MOV [SELECIONA_ECRA], R8			; seleciona-se o ecrã do disparo
	MOV [DEFINE_LINHA], R3
	MOV [DEFINE_COLUNA], R4
	MOV [DEFINE_PIXEL], R8				; apaga o disparo
	CALL colisao_met_disparo			; chama a rotina de colisão
	ADD R1, 1							; o meteoro avança uma linha (para permitir que a explosão dure um tempo no ecrã)
	JMP ha_colisao						; sai da rotina
	colisao_nave:						; verifica se o meteoro colidiu com a nave
	MOV R7, R1							; volta a colocar em R7 o valor da linha de cima do meteoro
	MOV R8, R2							; volta a colocar em R8 o valor da coluna mais à esquerda do meteoro
	MOV R3, LINHA
	ADD R7, R5							; obtem-se a linha de baixo do meteoro					
	SUB R7, 1							; corrige_se o valor (para não ficar uma linha à frente)
	CMP R3, R7
	JGT nao_ha_colisao					; se o nave estiver em baixo do meteoro, não há colisão
	MOV R4, [COLUNA_NAVE]
	ADD R8, R6							; obtem-se a coluna da direita do meteoro
	CMP R4, R8
	JGT nao_ha_colisao					; se a nave estiver à direita do meteoro, não há colisão
	SUB R8, R6							; volta-se à coluna mais à esquerda do meteoro
	ADD R4, LARGURA						; obtém a coluna mais à direita da nave
	SUB R4, 1							; corrige-se o valor
	CMP R4, R8
	JLT nao_ha_colisao					; se a nave estiver à esquerda do meteoro, não há colisão
	CALL colisao_met_nave				; se passar todas estas comparações, o meteoro colidiu com a nave
	MOV R1, 0							; o meteoro reinicia-se na linha de cima
	ha_colisao:
	POP R8								; repõe os valores nos registos
	POP R7
	POP R4
	POP R3
	JMP nao_desenha						; não se desenha o meteoro
	nao_ha_colisao:
	POP R8								; repõe o valor dos registos
	POP R7
	POP R4
	POP R3
	JMP desenha_sem_colisoes			; desenha-se o meteoro, já que não houve colisões




; APAGA_METEORO: incializa o valor dos registos antes de chamar a rotina apaga_linhas.
; R1: linha do meteoro; R2: coluna do meteoro; R4: endereços; R5: altura do meteoro; R6: largura do meteoro;
; R7: cópia da linha do meteoro; R8: cópia da coluna do meteoro
apaga_meteoro:							; rotina para apagar um meteoro		;
	PUSH R1								; guarda os valores antigos dos registos
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R5
	PUSH R6
	PUSH R7
	PUSH R8
	MOV R1, LINHA_MET
	MOV R1, [R1+R10]					; obtém a linha onde vai ser apagado o meteoro
	SUB R1, 1							; passa para a linha anterior (a primeira do meteoro)
	MOV R2, COLUNA_MET
	MOV	R2, [R2+R10]		    		; obtém a coluna do meteoro
	MOV	R4, DEF_METEORO_BOM_3			; endereço da tabela para obter o quadrado 5x5 que se vai apagar
	MOV R5, [R4]           				; obtem a altura da meteoro
	ADD R4, 2               			; enderco da largura da meteoro
	MOV	R6, [R4]						; obtém a largura da meteoro
	MOV R7, R1							; copia o valor da linha do meteoro
	MOV R8, R2							; copia o valor da coluna do meteoro
	CALL apaga_linhas
	POP R8								; restaura os valores anteriores dos registos
	POP R7
	POP R6
	POP R5
	POP R4
	POP R3
	POP R2
	POP R1
	RET


; ******************************** COLISÕES ************************************************

; COLISAO_MET_NAVE: trata das colisões entre o meteoro e a nave
; R1 - indica a linha onde se vai começar a pintar
; R2 - indica a coluna onde se vai começar a pintar
; R3 - indica a cor que vai pintar o pixel
; R4 - serve maioritariamente para endereços
; R5 - indica a altura da figura
; R6 - indica a largura da figura
; R7 - indica a linha que se está a pintar, começa igual a R1
; R8 - indica a coluna que se está a pintar, começa igual a R2
; quando se pinta uma nova linha
; R9 - indica quantas colunas faltam pintar, começa igual a R6
; quando se pinta uma nova linha
; R10 - elementos para comparações e endereços

colisao_met_nave:							; trata das colisões frontais entre os meteoros e a nave
	apaga_linha_colisao:
		PUSH R10
		MOV R4, TIPO_MET
		MOV R3, [R4+R10]					; verifica a cor do meteoro
		MOV R10, 0
		CMP R3, R10						; se a cor obtida for vermelho,
		JNZ  colisao_met_mau				; o jogo acaba.
		MOV R10, INCREMENTO				; caso contrário, o meteoro é bom
		SHL R10, 1						; multiplica o incremento por 2
		CALL manipula_energia			; incrementa a energia da nave em 10
		MOV R10, POWER_UP
		MOV [SELECIONA_SOM], R10
		MOV [PLAY_SOM], R10				; toca o som de power up
		MOV R7, R1						; copia o valor da linha onde começa o meteoro
		CALL apaga_linhas				; apaga o resto da figura
		MOV R1, 0						; a nave volta à primeira linha
		POP R10
	RET

colisao_met_mau:							; acaba com o jogo quando a nave colide com um meteoro mau
	MOV [APAGA_ECRA], R1					; apaga o ecrã
	MOV [TERMINA_TODOS_SONS], R1			; termina todos os sons
	MOV R1, EXPLOSAO_NAVE
	MOV [SELECIONA_SOM], R1
	MOV [PLAY_SOM], R1						; toca o som de explosão da nave
	MOV R1, MUSICA_YOU_LOSE
	MOV [SELECIONA_SOM], R1					
	MOV [PLAY_SOM], R1						; toca a música de game over
	MOV R1, ECRA_GAME_OVER
	MOV [SELECIONA_CENARIO_FUNDO], R1		; coloca o cenário de fundo de game over	
	POP R10
	RET

; COLISAO_MET_DISPARO: trata das colisões entre um meteoro e o disparo
; R1 - indica a linha onde se vai começar a pintar
; R2 - indica a coluna onde se vai começar a pintar
; R3 - indica a cor que vai pintar o pixel
; R4 - serve maioritariamente para endereços
; R5 - indica a altura da figura
; R6 - indica a largura da figura
; R7 - indica a linha que se está a pintar, começa igual a R1; também é usado para endereços
; R8 - indica a coluna que se está a pintar, começa igual a R2
; quando se pinta uma nova linha
; R9 - indica quantas colunas faltam pintar, começa igual a R6
; quando se pinta uma nova linha
; R10 - elementos para comparações e endereços

colisao_met_disparo:
	PUSH R10
	CALL escolhe_ecra	
	MOV R3, TIPO_MET
	MOV R3, [R3+R10]
	CMP R3, 0
	JZ  explodir_meteoro				; se for, o meteoro é bom e a energia não é incrementada
	MOV R10, INCREMENTO
	CALL manipula_energia				; incrementa a energia da nave em 5
	explodir_meteoro:
	MOV R4, DEF_EXPLOSAO				; obtem o endereço da explosão
	MOV R5, [R4]            			; obtem a altura da explosão
	ADD R4, 2
	MOV	R6, [R4]						; obtem a largura da explosão
	ADD	R4, 2							; endereço da cor do 1º pixel (2 porque a largura é uma word)
	MOV R7, R1							; copia a linha da explosão
	MOV R8, R2							; copia a coluna da explosão
	CALL desenha_linhas					; desenha a explosão
	MOV R4, EXPLOSAO_MET				; som da explosão do meteoro
	MOV [SELECIONA_SOM], R4
	MOV [PLAY_SOM], R4					; toca o som de explosão de meteoro
	MOV R4, -1
	MOV R7, LINHA_DISPARO
	MOV [R7], R4						; reinicia a linha do disparo (o disparo fica inativo)
	POP R10								; restaura o valor do incremento (indicador do meteoro a mexer)
	MOV R7, TIPO_MET
	MOV [R7+R10], R4					; o meteoro fica com tipo "-1" (ou seja, sob a forma de explosão)
	RET
	

; *********************************** ROTINAS GERAIS ***************************************************

; 1- DESCODIFICAÇÃO DE TECLAS

; TRADUZ_TECLA: usando os valores binários da linha e da coluna carregados,
; obtem o valor da tecla em que se está a carregar
; R7 - indica o número binário da linha do teclado
; R0 - indica o número binário da coluna do teclado
; R8 - contador do número da linha/coluna
; Retorna em R0 o valor da tecla em que se está a carregar
;
traduz_tecla:	
conta_zeros_1:		   ; o ciclo determina o numero da linha da tecla
	ADD R8, 1          ; adiciona uma ocorrencia ao contador
	SHR R7, 1          ; analisa o resto do numero
	JNZ conta_zeros_1  ; se o resultado nao for zero, repete
	SUB R8, 1          ; corrige o resultado do contador
	SHL R8, 2          ; multiplica o numero da linha (contador) por 4

conta_zeros_2:         ; este ciclo soma o numero da coluna da tecla ao contador
	ADD R8, 1          ; adiciona 1
	SHR R0, 1          ; analisa o resto do numero
	JNZ conta_zeros_2  ; se o resultado nao for zero, repete
	SUB R8, 1          ; corrige o resultado do contador
	MOV R0, R8         ; passa resultado para o registo R0
	MOV R8, 0          ; reboot ao contador
	RET


; 2- MANIPULAÇÃO DE ENERGIA

; MANIPULA_ENERGIA: incrementa ou decrementa o valor da energia consoante os
; dados obtidos e muda o display consoante essa mudança
; R10 - indica a variação da energia (1 ou -1); R11: valores para comparações
; Coloca na memória o novo valor da energia

manipula_energia:				; rotina para mudar o valor da energia da nave
	PUSH R1						; guarda o valor dos registos
	PUSH R11
	MOV R1, ENERGIA				; endereço da energia
	MOV R1, [R1]				; obtém o valor da energia da nave
	CMP R10, INCREMENTO			; vê se a energia vai aumentar ou decrementar
	JZ  testa_max_energia		; testa se a energia pode aumentar
	MOV R11, INCREMENTO			; obtem o incremento
	SHL R11, 1					; multiplica por 2 o incremento
	CMP R10, R11				; verifica se o incremento é 10 (caso houve colisões com meteoros bons)
	JZ testa_max_energia		; testa se a energia pode aumentar
	JMP testa_min_energia		; se não, testa se a energia pode diminuir
	muda_energia:				; muda o valor da energia e envia o novo valor para o display
	ADD R10, R1					; aumenta/decrementa o valor da energia
	MOV R1, ENERGIA				; enderço da energia
	MOV [R1], R10				; escreve na memória o novo valor da energia
	CALL hexa_para_decimal
	MOV R4, DISPLAYS			; endereço dos displays
	MOV [R4], R10				; mostra no display o valor da energia
	sai_manipula_energia:		; sai do procedimento
	CALL energia_zero
	POP R11						; restaura o valor dos registos
	POP R1
	RET

testa_max_energia:				; rotina para ver se a energia é máxima ou não
	MOV R11, MAX_ENERGIA		; obtém o valor máximo da energia
	CMP R1, R11					; se a energia tiver o valor máximo...
	JZ  sai_manipula_energia	; sai do procedimento
	ADD R1, R10					; adiciona-se o incremento à energia da nave
	CMP R1, R11					; se a energia for menor ou igual a 100...
	JLE corrige_energia			; a energia volta ao valor anterior
	MOV R10, MAX_ENERGIA		; caso contrário define-se a energia como máxima
	MOV R1, 0					; e o incremento como 0
	JMP sai_testa_energia		; sai da rotina
	corrige_energia:
	SUB R1, R10					; a energia volta ao seu valor inicial
	sai_testa_energia:
	JMP muda_energia			; muda-se o seu valor

testa_min_energia:				; rotina para ver se a energia é mínima ou não
	MOV R11, MIN_ENERGIA		; obtém o valor mínimo da energia
	CMP R1, R11					; se a energia tiver valor mínimo...
	JZ  sai_manipula_energia	; sai do procedimento
	JMP muda_energia			; caso contrário, muda-se o seu valor

energia_zero:								; rotina para quando a energia da nave atinge 0
	MOV R11, MIN_ENERGIA
	CMP R10, R11							; verifica se a energia da nave ficou a zero
	JNZ sai_energia_zero					; se não ficou, continua normal
	MOV R11, MUSICA_YOU_LOSE
	MOV [TERMINA_TODOS_SONS], R11
	MOV [SELECIONA_SOM], R11
	MOV [PLAY_SOM], R11						; caso contrário, começa a tocar a música de game over
	MOV R11, ECRA_SEM_ENERGIA
	MOV [APAGA_ECRA], R11					; apaga o ecrã
	MOV [SELECIONA_CENARIO_FUNDO], R11		; define o ecrã de fim de jogo	
	sai_energia_zero:
	RET
	
	
hexa_para_decimal:				; converte um número hexadecimal para uma forma semelhante à decimal e envia para o display
	PUSH R1						; guarda o valor dos registos
	PUSH R2
	PUSH R3
	MOV R3, 10					; R3 tem o valor 10
	MOV R1, R10					; copia o valor da energia
	MOD R1, R3					; resto da divisão inteira da energia por 10
	DIV R10, R3					; divisao inteira da energia por 10
	MOV R2, R10					; copia o valor obtido
	MOD R2, R3					; resto da divisão inteira da energia por 100
	DIV R10, R3					; divisao inteira da energia por 100
	SHL R10, 8					; coloca o dígito mais à esquerda nos 4 bits mais à esquerda
	SHL R2, 4					; coloca o dígito do meio nos 4 bits do meio
	OR  R10, R2					; junta os 4 bits mais à esquerda e os 4 bits do meio
	OR  R10, R1					; junta o valor obtido na linha anterior e junta os 4 bits mais à direita
	POP R3						; restaura os valores dos registos
	POP R2
	POP R1
	RET


; 3- MANIPULAÇÃO DE FIGURAS
; Nas seguintes procedures os registos são usados para o seguinte:
; R1 - indica a linha onde se vai começar a pintar
; R2 - indica a coluna onde se vai começar a pintar
; R3 - indica a cor que vai pintar o pixel
; R4 - serve maioritariamente para endereços
; R5 - indica a altura da figura
; R6 - indica a largura da figura
; R7 - indica a linha que se está a pintar, começa igual a R1
; R8 - indica a coluna que se está a pintar, começa igual a R2
; quando se pinta uma nova linha
; R9 - indica quantas colunas faltam pintar, começa igual a R6
; quando se pinta uma nova linha

desenha_linhas:						; desenha as linhas da figura
	PUSH R10						; se for um metoro, guarda o seu incremento de memória
	desenha_linhas_1:
		MOV R9, MAX_LINHA
		CMP R7, R9					; verifica se o meteoro está no limite do ecrã
		JGT sai_desenha_linhas		; se está, passa à frente
		MOV R8, R2					; copia o valor da coluna da figura
		MOV R9, R6					; copia o valor da largura da figura
	desenha_colunas:       			; desenha as colunas da figura
		MOV	 R3, [R4]				; obtém a cor do próximo pixel da figura
		MOV  [DEFINE_LINHA], R7		; seleciona a linha
		MOV  [DEFINE_COLUNA], R8	; seleciona a coluna
		MOV  R3, [R4]				; obtém a cor a pintar o pixel
		MOV  [DEFINE_PIXEL], R3		; altera a cor do pixel na linha e coluna selecionadas
		ADD	 R4, 2					; endereço da cor do próximo pixel (2 porque cada cor de pixel é uma word)
		ADD  R8, 1               	; próxima coluna
		SUB  R9, 1					; menos uma coluna para tratar
		JNZ  desenha_colunas      	; continua até percorrer toda a largura do objeto
		ADD  R7, 1					; proxima linha
		SUB  R5, 1					; menos uma linha para tratar
		JNZ  desenha_linhas_1		; continua até percorrer toda a altura do objeto
	sai_desenha_linhas:
	POP R10
	RET



apaga_linhas:							; apaga as linhas de uma figura
	PUSH R10							; se for um metoro, guarda o seu incremento de memória
	apaga_linhas_1:
		MOV R9, MAX_LINHA
		CMP R7, R9						; verifica se o meteoro está no limite do ecrã
		JGT sai_apaga_linhas			; se está, passa à frente
		MOV R8, R2             			; copia o valor a largura da nave
		MOV R9, R6						; copia o valor da largura da nave
	apaga_colunas:       				; desenha os pixels da figura a partir da tabela
		MOV  [DEFINE_LINHA], R7			; seleciona a linha
		MOV  [DEFINE_COLUNA], R8		; seleciona a coluna
		MOV  R3, [INDICA_COR_PIXEL]		; verifica a cor do pixel selecionado
		MOV	 R3, 0						; para apagar, a cor do pixel é sempre 0
		MOV  [DEFINE_PIXEL], R3			; altera a cor do pixel na linha e coluna selecionadas
		ADD  R8, 1               		; próxima coluna
		SUB  R9, 1						; menos uma coluna para tratar
		JNZ  apaga_colunas				; continua até percorrer toda a largura do objeto
		ADD  R7, 1              		; proxima linha
		SUB  R5, 1              		; menos uma linha
		JNZ  apaga_linhas_1       		; continua ate percorrer toda a altura de um objeto
	sai_apaga_linhas:
	POP R10
	RET


; ROTINA_ATRASO: rotina para atrasar o movimento da nave
; R1: guarda o valor do atraso; R2: guarda o valor do atraso original para reiniciar;
; R8: endereço do valor do atraso.
rotina_atraso:
	PUSH R1					; guarda o vaolor dos registos
	PUSH R2
	MOV  R1, [R8]			; obtém o valor atual do atraso	
	SUB  R1, 1				; decrementa o valor do atraso em 1
	MOV  [R8], R1			; atualiza valor do contador do atraso
	JNZ  sai_atraso			; se o atraso não for 0, sai
	MOV  R2, ATRASO			; obtém o valor orignal do atraso
	MOV  [R8], R2			; volta a colocar o valor inicial no contador do atraso
sai_atraso:
	POP  R2					; restaura o valor dos registos
	POP  R1
	RET

; ******************************** INTERRUPÇÕES ******************************

; ROT_INT_0: coloca a variável EXCECAO a 0, indicando que ocorreu a interrupção que faz os meteoros descer
; R1: endereço; R2: valor da exceção
rot_int_0:
	PUSH R1
	PUSH R2
	MOV R1, EXCECAO
	MOV R2, 0
	MOV [R1], R2
	POP R2
	POP R1
	RFE

; ROT_INT_1: coloca a variável EXCECAO a 1, indicando que ocorreu a interrupção que faz o disparo mexer
; R1: endereço; R2: valor da exceção
rot_int_1:
	PUSH R1
	PUSH R2
	MOV R1, EXCECAO
	MOV R2, 1
	MOV [R1], R2
	POP R2
	POP R1
	RFE

; ROT_INT_2: coloca a variável EXCECAO a 2, indicando que ocorreu a interrupção que faz a energia decrementar
; R1: endereço; R2: valor da exceção
rot_int_2:
	PUSH R1
	PUSH R2
	MOV R1, EXCECAO
	MOV R2, 2
	MOV [R1], R2
	POP R2
	POP R1
	RFE