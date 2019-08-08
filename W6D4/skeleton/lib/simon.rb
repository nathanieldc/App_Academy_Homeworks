class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
    take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
      show_sequence
      require_sequence
      round_success_message
      self.sequence_length += 1
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    user_guess = gets.chomp
    user_guess
  end

  def add_random_color
    rand_color = COLORS.sample
    seq << rand_color
  end

  def round_success_message
    "Successful.. on to next round!"
  end

  def game_over_message
    "Game Over"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end
