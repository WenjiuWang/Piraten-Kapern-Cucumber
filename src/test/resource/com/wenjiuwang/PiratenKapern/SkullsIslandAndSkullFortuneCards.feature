@tag
Feature: Skulls Island and Skull Fortune Cards
	
	@tag100
	Scenario: die by rolling one skull and having a FC with two skulls
	Given A 1 turn game is running with rigged dice rolls "6,3,4,2,2,1,1,1", fortune "8" and fortune indicator "2"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 has scored 0
	
	@tag101
	Scenario: die by rolling one skull and having a FC with two skulls
	Given A 1 turn game is running with rigged dice rolls "6,6,4,2,2,1,1,1", fortune "8" and fortune indicator "1"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 has scored 0
	
	@tag102
	Scenario: roll 5 skulls with FC: Captain => -1000 for all other players  (Captain doubles the penalty)
	Given A 1 turn game is running with rigged dice rolls "6,6,6,2,1,1,6,6", fortune "2" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 2 got 1000 score deducted
	And Player 3 got 1000 score deducted
	And Player 1 has scored 0
	And Player 2 has scored 0
	And Player 3 has scored 0
	
	@tag103
	Scenario: roll 2 skulls AND have a FC with two skulls: roll 2 skulls next roll, then 1 skull => -700 
	Given A 1 turn game is running with rigged dice rolls "6,6,4,2,2,1,1,1/6,6/0/3,6", fortune "8" and fortune indicator "2"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "6,8"
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "5,7"
	And Player 1 inspect new rolled dice		
	And Player 1 end current round and score
	And Player 2 got 700 score deducted
	And Player 3 got 700 score deducted
	And Player 1 has scored 0
	And Player 2 has scored 0
	And Player 3 has scored 0
	
	@tag104
	Scenario: roll 3 skulls AND have a FC with two skulls: roll no skulls next roll  => -500
	Given A 1 turn game is running with rigged dice rolls "6,6,6,2,2,1,1,1/4,5", fortune "8" and fortune indicator "2"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "6,8"
	And Player 1 inspect new rolled dice		
	And Player 1 end current round and score
	And Player 2 got 500 score deducted
	And Player 3 got 500 score deducted
	And Player 1 has scored 0
	And Player 2 has scored 0
	And Player 3 has scored 0
	
	@tag105
	Scenario: roll 3 skulls AND have a FC with 1 skull: roll 1 skull next roll then none => -500
	Given A 1 turn game is running with rigged dice rolls "6,6,6,2,2,1,1,1/6,5/0/3,3", fortune "8" and fortune indicator "1"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "6,8"
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "4,5"	
	And Player 1 inspect new rolled dice	
	And Player 1 end current round and score
	And Player 2 got 500 score deducted
	And Player 3 got 500 score deducted
	And Player 1 has scored 0
	And Player 2 has scored 0
	And Player 3 has scored 0
	
	@tag106
	Scenario: show deduction received cannot make your score negative
	Given A 1 turn game is running with rigged dice rolls "6,6,6,2,2,1,1,1/6,5/0/3,3", fortune "8" and fortune indicator "1"
	Then Three players join the game
	And Set Player 2 initial score to 100
	And Set Player 3 initial score to 100
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "6,8"
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "4,5"	
	And Player 1 inspect new rolled dice	
	And Player 1 end current round and score
	And Player 2 got 500 score deducted
	And Player 3 got 500 score deducted
	And Player 1 has scored 0
	And Player 2 has scored 0
	And Player 3 has scored 0
	
	