class Simon

  def self.game
    simon = Simon.new
    simon.play
  end

  COLORS = %w(red blue green yellow).freeze

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      self.take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if over?
      @game_over = true
    else
      @sequence_length += 1
      round_success_message
    end
  end

  def show_sequence
    system "clear"
    add_random_color
    @seq.each_with_index do |color, ind|
      puts "#{ind + 1}: #{color}"
      sleep(1)
      system "clear"
    end
  end

  def require_sequence
    @guess = []
    until @guess.length == @sequence_length
      el = prompt
      case el
      when "red"
        @guess << "red"
      when "blue"
        @guess << "blue"
      when "green"
        @guess << "green"
      when "yellow"
        @guess << "yellow"
      else
        puts "Sorry, what?"
      end
    end
  end

  def add_random_color
    @seq << random_color
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  private

  def random_color
    COLORS[rand(4)]
  end

  def prompt
    puts "What is the next color in the sequence?"
    puts "(Red Blue Yellow Green)"
    gets.chomp
  end

  def over?
    @guess != @seq
  end

  def round_success_message
    puts "Congradulations! You got it!"
    puts "Press ENTER to move to the next round"
    gets.chomp
  end

  def game_over_message
    puts "RIP you!"
    puts "Press ENTER to play again"
    gets.chomp
  end
end

Simon::game
