
prompt = '> '

puts "Hello! What's your name? "
name = gets.chomp.capitalize!

puts "Great to meet you #{name}, do you feel like hanging out today? (Y or N)"
puts prompt
want_to_hang=gets.chomp.downcase!

puts "Ok great! But wait, this is a two player game, so call a friend. Hit ENTER when you are ready!"
puts prompt
ready = gets

puts "Whats your friend's name?"
puts prompt
friend_name = gets.chomp.capitalize!

puts "Ok #{name} and #{friend_name}, we are going to hang today with a game of good ol' fashioned Hangman! The instructions are simple but first #{name} needs to get some shut eye and not peek at the screen. The following instructions are for #{friend_name} eyes only!. When you are ready, press ENTER!"
puts prompt
check_one = gets

puts "No peeking #{name}!"
puts prompt
check_two = gets

puts "#{friend_name} you are going to come up with a sentence that #{name} is going to try and figure out without getting hanged. #{name} is allowed 6 mistakes to prove that he can hang! So go ahead #{friend_name} lets see if #{name} can hang with you."
puts 'Type out a sentence and hit ENTER!'
sentence = gets.chomp


def gameboard(sentence, board)
  sentence.length.times do |x|
    board << ('#')
  end

  chances = 6
  while chances > 0
    puts "You have #{chances} remaining."
    puts "Whats your guess? "
    puts board
    guess_input = gets.chomp
    user_input = guess_input
      if guess_input.length == 1 && sentence.include?(guess_input)
        match_ind = sentence.index(guess_input)
        board.sub!(board[match_ind], 'guess_input')
        puts board
      else
        count -=1
  end
end
end

gameboard(sentence,board="")
