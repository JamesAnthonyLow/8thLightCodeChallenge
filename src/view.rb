module View
  class << self
    def welcome
      puts "Welcome to Tic Tac Toe!"
    end
    def get_game_type
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
      end
    end
  end
end
