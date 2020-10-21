@tag
Feature: Monkey Business

	@tag75
	Scenario: first roll gets 3 monkeys 3 parrots  1 skull 1 coin  SC = 1100  (i.e., sequence of of 6 + coin)
	Given A 1 turn game is running with rigged dice rolls "3,3,3,4,4,4,6,2", fortune "7" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 1100
	
	@tag76
	Scenario: over several rolls: 2 monkeys, 1 parrot, 2 coins, 1 diamond, 2 swords         SC 400
	Given A 1 turn game is running with rigged dice rolls "3,3,3,4,4,4,5,2/2,1/3,5/3,1", fortune "7" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "1,2"
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "4,5"
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "2,4"
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 400
	
	@tag77
	Scenario: over several rolls get 3 monkeys, 4 parrots, 1 sword    SC 2000 (ie seq of 7)
	Given A 1 turn game is running with rigged dice rolls "3,2,3,4,4,4,5,2/4,3/3,5", fortune "7" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "3,7"
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "2,8"
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 2000
	
	