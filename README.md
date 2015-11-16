#TicTacToe Game for Command Line Games, Inc.

##USER STORIES:
1. Welcome to TicTacToe
2. Human vs Human, Human vs Computer, Computer vs Computer
3. LOOP 
    -Player 1 turn
    -Player 2 turn
4. Player 1 WIN or Player 2 WIN or TIE

##CLASSES:
#####View
  -```#welcome``` (STDOUT: introduction statement)
  -```#get_game_type``` (STDIN: retrieve game type from user OUTPUT: an array of booleans representative of player types)
  -```#choose_marker``` (INPUT: array of marker choices STDIN: retrieve marker choice from user OUTPUT: marker choice)
  -```#try_again``` (STDOUT: try again message)
  -```#get_move``` (STDIN: player move choice OUTPUT: char representative of player move choice)
  -```#display_board``` (INPUT: string representation of board STDOUT: printout of board)
 
#####Computer
  -```#choose_marker``` (INPUT: array of marker choices OUTPUT: marker choice)
  -```#get_move``` (INPUT: board state OUTPUT: char representative of computer move choice)

#####Player
  Attributes:
  -```@human?``` (boolean)  
  -```@marker``` (char)

  Methods:
  -```#set_marker``` (INPUT: array of marker choices, decision_proc SIDE-EFFECT: set @maker for player object)
  -```#choose_move``` (INPUT: decision_proc OUTPUT: Key Value pair of player move choice and marker)

#####Board
  Attributes:
  -```@spaces``` (Array(9)) w/ attr_reader
  -```@win_status``` (String representing win status) w/ attr_reader
  
  Methods:
  -```#game_over?``` (OUTPUT: boolean)
  -```#until_valid_move?``` (INPUT: try again action, player turn, SIDE-EFFECT: runs player turn until valid move OUTPUT: valid move hash)
  [private]
  -```#tie?``` (OUTPUT: boolean SIDE-EFFECT: change @win_status)
  -```#winner?``` (INPUT: marker OUTPUT: boolean SIDE-EFFECT: change @win_status)

#####TicTacToe (controller)
  Attributes:
  -```@board``` (Board)
  -```@players``` (Array of players)
  Methods:
  -```#start_game``` (initializes board and gets input to initialize players)

