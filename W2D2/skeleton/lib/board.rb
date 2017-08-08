class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    Array.new(14).map.with_index do |_cup, ind|
      if ind == 6 || ind == 13
        []
      else
        [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    unless start_pos.between?(1, 14)
      raise CupError.new("Invalid starting cup")
    end
  end

  def make_move(start_pos, current_player_name)
    stones_to_distribute = @cups[start_pos]
    @cups[start_pos] = []
    current_cup = start_pos
    until stones_to_distribute.empty?
      if current_cup < 14
        current_cup += 1
      else
        current_cup = 0
      end
      @cups[current_cup] << stones_to_distribute.pop
    end
    render
    next_turn(current_cup)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end

class CupError < StandardError; end
