require_relative "computer"
class View
  @@space_selectors = ("a".."i").to_a
  class << self
    def display_board spaces
      nw, nn, ne, ww, ce, ee, sw, ss, se = spaces.map.with_index {|space, i| space ? space : space_selectors[i]} 
      puts
      puts "    |     |    "
      puts "  #{nw} |  #{nn}  | #{ne} "
      puts "____|_____|____"
      puts "  #{ww} |  #{ce}  | #{ee} "
      puts "____|_____|____"
      puts "  #{sw} |  #{ss}  | #{se} "
      puts "    |     |    "
    end
    def welcome
      puts "Welcome to Tic Tac Toe!"
    end
    def try_again
      puts "Invalid selection, please try again"
    end
    def prompt_player marker
      puts
      puts "Player #{marker} please select your space"
    end
    def get_move player, spaces
      if player.human?
        space_selectors.index(gets.chomp)
      else
        Computer.get_move(player.marker, spaces)
      end
    end
    def end_game win_status, spaces
      puts
      puts win_status
      display_board spaces
    end
    def user_select_game_type 
      puts "Please select game type:"
      puts "\t1. Human v Human"
      puts "\t2. Human v Computer (Human goes first)"
      puts "\t3. Computer v Human (computer goes first)"
      puts "\t4. Computer v Computer"
      Hash["1", [true, true], 
           "2", [true, false], 
           "3", [false, true],
           "4", [false, false]][gets.chomp]
    end
    def choose_marker human, markers
      puts "Please make marker choice"
      choices = markers.each_with_index.with_object({}) do |(marker, i), chs|
        puts "\t#{i+1}. #{marker}"
        chs["#{i+1}"] = marker
      end
      puts
      markers.delete(choices[human ? gets.chomp : Computer.choose_marker(choices)])
    end
    private
    def space_selectors
      @@space_selectors
    end
  end
end

