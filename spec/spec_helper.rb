%w[view computer player board tictactoe].each do |filename|
  require_relative "../src/#{filename}"
end
