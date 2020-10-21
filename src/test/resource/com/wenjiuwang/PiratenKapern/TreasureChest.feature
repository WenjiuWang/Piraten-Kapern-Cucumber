@tag
Feature: Treasure Chest

	@tag80
	Scenario: roll 3 parrots, 2 swords, 2 diamonds, 1 coin     
							put 2 diamonds and 1 coin in chest
						  then reroll 2 swords and get 2 parrots 
						  put 5 parrots in chest 
						  and take out 2 diamonds & coin
						  then reroll the 3 dice and get 1 skull, 1 coin and a parrot
						  score 6 parrots + 1 coin for 1100 points	
	Given A 1 turn game is running with rigged dice rolls "4,4,4,5,5,1,1,2/4,4/6,2,4", fortune "1" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 put dice at position "6,7,8" in the Treasure Chest
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "4,5"
	And Player 1 inspect new rolled dice
	And Player 1 put dice at position "1,2,3,4,5" in the Treasure Chest
	And Player 1 inspect new rolled dice
	And Player 1 take dice at position "6,7,8" out of the Treasure Chest
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "6,7,8"
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 1100
	
	@tag85
	Scenario: roll 2 skulls, 3 parrots, 3 coins   
							put 3 coins in chest 
							then rerolls 3 parrots and get 2 diamonds 1 coin    
							put coin in chest (now 4)
			   			then reroll 2 diamonds and get 1 skull 1 coin     
			   			SC for chest only = 400 + 200 = 600
			   			also interface reports death & end of turn		
	Given A 1 turn game is running with rigged dice rolls "6,6,4,4,4,2,2,2/1,1,2/6,2", fortune "1" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 put dice at position "6,7,8" in the Treasure Chest
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "3,4,5"
	And Player 1 inspect new rolled dice
	And Player 1 put dice at position "5" in the Treasure Chest
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "3,4"
	And Player 1 inspect new rolled dice
	And Player 1 has scored 600
	
	