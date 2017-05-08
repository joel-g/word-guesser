# word guesser class

# take input word

# guess = word length

# print _ _ _ _ _ _ to represent word and indicate length

# update _ _ _ _ _ _ to show correctly guess letters


class Guess
		def initialize(word)
		@word = word.upcase
		@guesses_allowed = (word.length * 2) - 1
		@letters_already_tried = []
		@placeholder = ""
			until @placeholder.length == word.length
				@placeholder << "_"
			end
	end
	def try_letter(letter)
		x = 0
		@correct_letter = nil
		@word.length.times do
			if letter == @word[x]
				then @placeholder[x] = letter
				@correct_letter = true
			end
			x += 1
		end
#This solution seems cleaner but doesn't work if there's multiples of one letter		
				# @word.each_char do |x|
		# 	if letter == x
		# 		then @correct_letter = true    
		# 			@placeholder[word.index(x)] = letter
		# 	end
		@placeholder
	end
	attr_reader(:word, :placeholder, :correct_letter, :guesses_allowed)
	attr_accessor(:letters_already_tried)
end


puts "Player 1: What is your name?"
player1 = gets.chomp
puts "Player 2: What is your name?"
player2 = gets.chomp

puts "
#{player1}, enter a single word for #{player2} to try to guess!
(you will not be able to see what you're typing so that #{player2} can't peek)"

require 'io/console' 
#If I'm not allowed to require libraries I would have just printed a bunch of blank space so that Player 1's word wasn't still visible.

while
	guess = Guess.new(STDIN.noecho(&:gets).chomp)
	if guess.word.include?(" ")
		puts "Woah there #{player1}. This is only supposed to be one word. No spaces! Try again."
	else break
	end
end
puts "

#{player1}'s word is #{guess.word.length} letters long."

turns_left = guess.guesses_allowed
until turns_left == 0
	puts "
	#{player2}, you have #{turns_left} guesses left. What letter should we try?" 
	guessed_letter = gets.chomp.upcase
	guess.try_letter(guessed_letter)
	if guessed_letter.length != 1
			puts "You must try one letter at time!"
			turns_left += 1
		elsif guess.letters_already_tried.include?(guessed_letter)
			puts "#{player2} you already tried that letter silly!"
			turns_left += 1
		elsif guess.correct_letter
			puts "'#{guessed_letter}' is in the word! #{player1}'s word looks like this: #{guess.placeholder}"
		else
			puts "Sorry, '#{guessed_letter}' is not in #{player1}'s word."
	end
turns_left -= 1
	break if guess.placeholder.include?("_") == false
guess.letters_already_tried << guessed_letter
end

if guess.placeholder.include?("_")
	puts "#{player2} has run out of guesses. Better luck next time, LOSER!"
else 
	puts "#{player2} figured out #{player1}'s word. GREAT JOB!"
end	 
puts "

Thank you for playing 'Word Guesser' by GuerraCo Softworks."
