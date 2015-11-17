class View
  @@space_selectors = ("a".."i").to_a
  class << self
    def welcome
      puts "Welcome to Tic Tac Toe!"
    end
    def try_again
      puts "Invalid selection, please try again"
    end
    def get_move
      puts "Please select your space"
      move = gets.chomp
      space_selectors.index(move)
    end
    def end_game win_status
      puts win_status 
    end
    def display_board spaces
      nw, nn, ne, ww, ce, ee, sw, ss, se = spaces.map.with_index {|space, i| space ? space : space_selectors[i]} 
      puts "  #{nw} |  #{nn}  | #{ne} "
      puts "____|_____|____"
      puts "  #{ww} |  #{ce}  | #{ee} "
      puts "____|_____|____"
      puts "  #{sw} |  #{ss}  | #{se} "
      puts "    |     |    "
    end
    def user_select_game_type 
      puts "Please select game type:"
      puts "\t1. Human v Human"
      puts "\t2. Human v Computer"
      puts "\t3. Computer v Computer"
      Hash["1", [true, true], 
           "2", [true, false], 
           "3", [false, false]][gets.chomp]
    end
    def choose_marker markers
        puts "Please make marker choice"
        choices = markers.each_with_index.with_object({}) do |(marker, i), chs|
          puts "\t#{i+1}. #{marker}"
          chs["#{i+1}"] = marker
      end
        return markers.delete(choices[gets.chomp])
    end
    private
    def space_selectors
      @@space_selectors
    end
    def game_choices
      @@game_choices
    end
  end
end

