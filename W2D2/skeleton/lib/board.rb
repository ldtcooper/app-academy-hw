require "byebug"
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
      if @name1 == current_player_name && current_cup == 12
        current_cup = (current_cup + 1) % 14
        next
      elsif @name2 == current_player_name && current_cup == 5
        current_cup = (current_cup + 1) % 14
        next
      end
      current_cup = (current_cup + 1) % 14
      @cups[current_cup] << stones_to_distribute.pop
    end
    render
    next_turn(current_cup)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if (0..5).all? { |el| @cups[el].empty? } || (7..12).all? { |el| @cups[el].empty? }
      true
    else
      false
    end
  end

  def winner
    if @cups[6].length == @cups[13].length
      :draw
    elsif @cups[6].length > @cups[13].length
      @name1
    else
      @name2
    end
  end
end

class CupError < StandardError; end
