require_relative "./person.rb"
require_relative "./deck.rb"

def winner(player1:, player1_points:, player2:, player2_points:)
	return player1_points > player2_points ? player1 : player2
end

players = [Person.new("Sonny", "sonny@hotmail.com", "4343142"), Person.new("Jordan", "jordan@aol.com", "4954442")]

players[0].greet(players[1])
players[1].greet(players[0])

player1, player2 = players.shuffle

puts "#{player1.name} make first move."

deck = Deck.new
deck.shuffle!

round = 1

def game(player1, player2, deck)

	if deck.cards_count <= 2 
		return player1, player2 
	end

	player1_card = deck.draw
	player2_card = deck.draw

	puts "#{player1.name} puts another card #{player1_card.face_converter} #{player1_card.suit}"
	puts "#{player2.name} puts another card #{player2_card.face_converter} #{player2_card.suit}"

	if player1_card.face_converter > player2_card.face_converter
		puts "#{player1.name} takes cards."
		player1.hand.add_cards(player1_card)
		player2.hand.add_cards(player2_card)

		return player1, player2

	elsif player1_card.face_converter < player2_card.face_converter
		puts "#{player2.name} takes cards."
		player2.hand.add_cards(player1_card)
		player2.hand.add_cards(player2_card)
	
		return player1, player2
	else
		return game(player1, player2, deck)
 	end
end

while deck.cards_count > 0 do

	player1_card = deck.draw
	player2_card = deck.draw

	puts  
	puts "Round #{round}:"
	puts "#{player1.name}: #{player1_card.face_converter} #{player1_card.suit}"
	puts "#{player2.name}: #{player2_card.face_converter} #{player2_card.suit}"

	if player1_card.face_converter < player2_card.face_converter
		puts "#{player2.name} takes cards."
		player2.hand.add_cards(player1_card)
		player2.hand.add_cards(player2_card)

	elsif player1_card.face_converter > player2_card.face_converter
		puts "#{player1.name} takes cards."
		player1.hand.add_cards(player1_card)
		player1.hand.add_cards(player2_card)

	else
		player1, player2 = game(player1, player2, deck) 
	end
	round = round + 1	
end

round_winner = winner(
		player1: player1,
		player1_points: player1_card.face_converter,
		player2: player2,
		player2_points: player2_card.face_converter)
	
if round_winner
	round_winner.hand.add_cards(player1_card,player2_card)
	puts "#{round_winner.name} takes cards!"
end

game_winner = winner(
		player1: player1,
		player1_points: player1.hand.get_points,
		player2: player2,
		player2_points: player2.hand.get_points)

if game_winner
	puts "#{game_winner.name} wins the game with #{game_winner.hand.get_points} points"
end


