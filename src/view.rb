module View
  class << self
    def welcome
      puts "Welcome to Tic Tac Toe!"
    end
    def try_again
      puts "Invalid selection, please try again"
    end
    def get_move
      gets.chomp
    end
    def get_game_type
      loop do
        puts "Please select game type:"
        puts "\t1. Human v Human"
        puts "\t2. Human v Computer"
        puts "\t3. Computer v Computer"
        game_type = gets.chomp
        case game_type
        when "1"
          return [true, true]
        when "2" 
          return [true, false]
        when "3"
          return [false, false]
        else
          try_again
        end
      end
    end
    def choose_marker markers
      loop do
        puts "Please make marker choice"
        choices = markers.each_with_index.with_object({}) do |(marker, i), chs|
          puts "\t#{i+1}. #{marker}"
          chs["#{i+1}"] = marker
        end
        marker_choice = gets.chomp
        if choices[marker_choice]
          return markers.delete(choices[marker_choice])
        else
          try_again
        end
      end
    end
  end
end
