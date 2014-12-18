require_relative 'board.rb'

class Chess

  attr_accessor :board, :player1, :player2, :players

  def initialize
    @board = Board.new
    @player1 = HumanPlayer.new(:white)
    @player2 = HumanPlayer.new(:black)
    @players = [@player1, @player2]
  end

  def play
    loop do
      players.each do |player|
        system "clear"
        board.render
        player1.play_turn
      end
    end
  end

  def game_over?

  end

end

class HumanPlayer

    def self.column
    columns = Hash.new(0)
    [*"a".."h"].each_with_index do |letter, index|
      columns[letter.intern] = letter.ord - 97
    end
    columns
  end

  def self.row
    [nil, 7,6,5,4,3,2,1,0]
  end

  attr_accessor :board, :color

  def initialize(color)
    @board = board
    @color = color
  end

  def play_turn(board)
    puts "Enter coordinates of your next move (format: e2 e4)"
    user_input = gets.chomp.downcase
    start, end_pos = user_input.scan(/\w{2}/)
    start = parse_user_input(start)
    end_pos = parse_user_input(end_pos)
    board.move(start, end_pos)
  end

  def parse_user_input(input)
    Vector[ self.class.row[input[1].to_i], self.class.column[input[0].intern] ]
  end


end

game = Chess.new.play
# a = HumanPlayer.new(Board.new, :white)
# p a.parse_user_input("a4")
# p HumanPlayer.row[4]
# a.move(Vector[1,2], Vector[3,2])
# a.move(Vector[0,3], Vector[3,0])
# # a.move(Vector[6,3], Vector[5,3])

# a.render
# p Board.deep_dup(a)[Vector[6,2]].moves
