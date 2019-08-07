require 'byebug'

class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups = Array.new(14) { Array.new }
    stone = :stone
    cups.each_with_index do |cup, idx|
      4.times do
        cup << stone if !(idx == 6 || idx == 13)
      end
    end
  end

  def valid_move?(start_pos)
    if !(start_pos.between?(0, 5) || start_pos.between?(7, 12))
      raise "Invalid starting cup"
    elsif @cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name) #player1 strore=idx6, player2 = 13
    cup_dup = self.cups[start_pos].dup
    self.cups[start_pos].clear
    start_pos 
    until cup_dup.empty? 
      next_cup = ((start_pos += 1) % 14)
      case current_player_name == self.name1
      when true
        self.cups[next_cup] << cup_dup.shift if next_cup != 13
      when false
        self.cups[next_cup] << cup_dup.shift if next_cup != 6
      end
    end
    self.render
    self.next_turn(next_cup, current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ((current_player_name == name1) && (ending_cup_idx == 6)) || ((current_player_name == name2) && (ending_cup_idx == 13))
      return :prompt
    elsif (self.cups[ending_cup_idx].length) == 1
      return :switch
    end
    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side_one = (0..5).all? { |idx| self.cups[idx].empty? }
    side_two = (7..12).all? { |idx| self.cups[idx].empty? }

    return true if side_one || side_two
    false
  end

  def winner
    return :draw if self.cups[6].length == self.cups[13].length
    if self.cups[6].length < self.cups[13].length
      return name2
    end
    name1
  end
end

board = Board.new("jasim", "noalle")