class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    while !@game_over
      take_turn
    end
    puts game_over_message
    reset_game
  end

  def take_turn
    if !@game_over
      @sequence_length += 1
      puts round_success_message
    end

    show_sequence
    require_sequence
    
  end

  def show_sequence
    add_random_color
    p seq
  end

  def require_sequence
    "Enter a sequence"
    input = gets.chomp
    @game_over = true unless input.split == @seq
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    "Nice job"
  end

  def game_over_message
    "Game over"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
