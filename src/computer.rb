module Computer
  class << self
    def choose_marker markers
      markers.sample
    end
    def get_move spaces
      spaces.select(&:nil?).sample
    end
  end
end
