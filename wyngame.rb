ascii = <<heredoc
888
888
888
88888b.  8888b. 88888b.  .d88b. 88888b.d88b.  8888b. 88888b.
888 "88b    "88b888 "88bd88P"88b888 "888 "88b    "88b888 "88b
888  888.d888888888  888888  888888  888  888.d888888888  888
888  888888  888888  888Y88b 888888  888  888888  888888  888
888  888"Y888888888  888 "Y88888888  888  888"Y888888888  888
                             888
                        Y8b d88P
                         "Y88P"
heredoc

chance_6 = <<heredoc
 +---+
  |   |
      |
      |
      |
      |
=========
heredoc

chance_5 = <<heredoc
  +---+
  |   |
  O   |
      |
      |
      |
=========
heredoc

chance_4 = <<heredoc
  +---+
  |   |
  O   |
  |   |
      |
      |
=========
heredoc

chance_3 = <<heredoc
  +---+
  |   |
  O   |
 /|   |
      |
      |
=========
heredoc

chance_2 = <<heredoc
  +---+
  |   |
  O   |
 /|\  |
      |
      |
=========
heredoc

chance_1 = <<heredoc
  +---+
  |   |
  O   |
 /|\  |
 /    |
      |
=========
heredoc
chance_0 = <<heredoc
  +---+
  |   |
  O   |
 /|\  |
 / \  |
      |
=========
heredoc

thumbs_up = <<heredoc
         _
           /(|
          (  :
         __\  \  _____
       (____)  `|
      (____)|   |
       (____).__|
        (___)__.|_____
heredoc

thumbs_down = <<heredoc
███████▄▄███████████▄
▓▓▓▓▓▓█░░░░░░░░░░░░░░█
▓▓▓▓▓▓█░░░░░░░░░░░░░░█
▓▓▓▓▓▓█░░░░░░░░░░░░░░█
▓▓▓▓▓▓█░░░░░░░░░░░░░░█
▓▓▓▓▓▓█░░░░░░░░░░░░░░█
▓▓▓▓▓▓███░░░░░░░░░░░░█
██████▀░░█░░░░██████▀
░░░░░░░░░█░░░░█
░░░░░░░░░░█░░░█
░░░░░░░░░░░█░░█
░░░░░░░░░░░█░░█
░░░░░░░░░░░░▀▀
heredoc

print ascii
puts "Hello! What's your name? "
name = gets.chomp.downcase.capitalize!

puts "Great to meet you #{name}, do you feel like hanging out today? (Y or N)"
ready = gets.chomp.downcase
if ready.include?('y')
  puts "Ok great! But wait, this is a two player game, so call a friend. Hit ENTER when you are ready!"
  gets
else
  puts "To bad you're going to play anyway."
  puts thumbs_up
end

puts "Whats your friend's name?"
friend_name = gets.chomp.downcase.capitalize!

puts "Ok #{name} and #{friend_name}, we are going to hang today with a game of good ol' fashioned Hangman! The instructions are simple but first #{name} needs to get some shut eye and not peek at the screen. The following instructions are for #{friend_name} eyes only!. When you are ready, press ENTER!"
check_one = gets

puts "No peeking #{name}!"
check_two = gets

puts "#{friend_name} you are going to come up with a sentence that #{name} is going to try and figure out without getting hanged. #{name} is allowed 6 mistakes to prove that he can hang! So go ahead #{friend_name} lets see if #{name} can hang with you!"
puts "Enter a word: "
words = gets.chomp.downcase
system "clear"
letters = words.split("")
hr = "==========================="
chances = 6
all_guess = []
puts "Ok #{name} the challenge is set and you're up to bat! Try to figure out the phrase or word in the least amount of tries. Once you have an idea of what the whole phrase or word is then you can type it out and submit!"
while chances >= 0

#ask for input
case chances
when 6 then puts chance_6
when 5 then puts chance_5
when 4 then puts chance_4
when 3 then puts chance_3
when 2 then puts chance_2
when 1 then puts chance_1
else puts chance_0
end
answer = ""
letters.each do |x|
  if all_guess.include?(x)
    answer = x
  else
    answer = "_"
  end
end
puts "\\/\\/ \\/\\/ \\/\\/ \\/\\/ \\/\\/ \\/\\/"
puts "Don't forget to type the entire phrase once you are sure of what it is and submit!"
puts "\\/\\/ \\/\\/ \\/\\/ \\/\\/ \\/\\/ \\/\\/"
puts answer
if chances > 0
puts "You have #{chances} chances remaining."
puts "Guess: "
end

player_guess = gets.chomp.downcase

#check that user only entered 1 character and whether that character is in letters array
answer = ""
if player_guess.length == 1 && letters.include?(player_guess)
  all_guess.push(player_guess)
    system 'clear'
    puts "Good one!"
    puts "You have #{chances} chances remaining."
  elsif player_guess == 'hint'
    system 'clear'
    puts "Spaces are freebies!"
elsif player_guess.length > 1 && words == player_guess
  system 'clear'
  puts "Oh you can most definitely hang! Way to guess the whole phrase with #{chances} chances remaining!!"
  puts thumbs_up
  break
elsif chances > 0
  system 'clear'
  chances -= 1
  puts "Tough luck, hang in there and try again!"
  puts "You have #{chances} chances remaining."
else
   "Sorry you can't hang I guess, try again!"
  break
  end

letters.each do |x|
  if all_guess.include?(x)
    answer = x
  else
    answer = "_"
  end
  print answer
end
if chances == 0
  system 'clear'
  puts "Hanged!"
  puts chance_0
  puts thumbs_down
  break
end
end
