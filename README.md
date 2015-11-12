#TicTacToe Game for Command Line Games, Inc.

##USER STORIES:
1. Welcome to TicTacToe
2. Human vs Human, Human vs Computer, Computer vs Computer
3. LOOP 
    -Player 1 turn
    -Player 2 turn
4. Player 1 WIN, Player 2 WIN, TIE

##CLASSES:
#####View
  -```#welcome``` (STDOUT: introduction statement)
  -```#map_setup_players``` (INPUT: array of marker symbols STDIN: retrieve game type from user OUTPUT: an enumerable with an array of booleans representative of player types)
  -```#choose_marker``` (INPUT: array of marker choices STDIN: retrieve marker choice from user OUTPUT: marker choice)

#####Computer
  -```#choose_marker``` (INPUT: array of marker choices OUTPUT: marker choice)

#####Player
  Attributes:
  -```@human?``` (boolean)  
  -```@marker``` (char)

#####Board
  Attributes:
  -```@spaces``` (Array(9)) w/ attr_accessor
  -```@win_status``` (String representing win status) w/ attr_reader
  
  Methods:
  -```#game_over?``` (OUTPUT: boolean)
  [private]
  -```#tie?``` (OUTPUT: boolean SIDE-EFFECT: change @win_status)
  -```#win?``` (OUTPUT: boolean SIDE-EFFECT: change @win_status)

#####TicTacToe (controller)
  Attributes:
  -```@board``` (Board)
  -```@players``` (Array of players)
  Methods:
  -```#start_game``` (initializes board and gets input to initialize players)

