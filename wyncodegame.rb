

puts 'Type out a sentence and hit ENTER!'
sentence = gets.chomp
board = ""
def gameboard(sentence, board)
  sentence.length.times do |x|
    board << ('#')
  end
  puts board
end
gameboard(sentence,board)
# gameboard(sentence, board = '')
# def sent_hash(sentence)
#   sent = sentence.delete(" ").split('')
#   for x in sent
#     sentence_hash = {
#       x => x
#     }
#   end
# end



#
# guesses = 6
# all_guess = []
# while guesses > 0
#   chances_remaining = "Chances remaining #{guesses}"
#   guess = "Guess a letter: "
#   guess_input = gets.chomp
#   puts chances_remaining
#   puts guess
#   if sentence.include?(guess_input) && guess_input.length == 1
#     if all_guess.include?(guess_input)
#       puts "You've already guessed that, try again!"
#     else
#       gameboard(sentence,board)
#     end
#   else
#     guesses -= 1
#     puts "Tough luck, hang in there and try again!"
#     puts board
#   end
#
# end
