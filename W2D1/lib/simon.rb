class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play

  end

  def take_turn

  end

  def show_sequence
    self.add_random_color
    @seq.each { |color| puts color }
    # sleep(@sequence_length * 2)
    # system "clear"
  end

  def require_sequence

  end

  def add_random_color
    @seq << random_color
    @sequence_length = @seq.length
  end

  def round_success_message

  end

  def game_over_message

  end

  def reset_game

  end

  private

  def random_color
    COLORS[rand(4)]
  end
end
