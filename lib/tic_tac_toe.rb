WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, char="X")
  board[index] = char
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if (position_taken?(board, index) == false || position_taken?(board, index) == nil) && index.between?(0, 8)
    return true
  else
    return false
  end
end

def turn_count(board)
  turns = 0
  board.each do | turn |
    if turn == 'X' or turn == 'O'
      turns += 1
    end
  end
  turns
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else 
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win|
    if board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X"
      return win
    elsif
      board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] == "O"
      return win
    end
  end
    return false
end

def full?(board)
  return true unless board.include?(" ")
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif (!won?(board) && !full?(board)) || won?(board)
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  if won?(board) && board[won?(board)[0]]  == "X"
    return "X"
  elsif won?(board) && board[won?(board)[0]] == "O"
    return "O"
  end
  return nil
end

def play