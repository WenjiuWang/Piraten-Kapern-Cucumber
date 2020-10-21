@tag
Feature: Full Chest

	@tag91
	Scenario: 3 monkeys, 3 swords, 1 diamond, 1 parrot FC: coin   => SC 400  (ie no bonus)
	Given A 1 turn game is running with rigged dice rolls "3,3,3,5,5,5,1,4", fortune "5" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 400
	
	@tag92
	Scenario: 3 monkeys, 3 swords, 2 coins FC: captain   => SC (100+100+200+500)*2 =  1800
	Given A 1 turn game is running with rigged dice rolls "3,3,3,5,5,5,2,2", fortune "2" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 1800
	
	@tag93
	Scenario: 3 monkeys, 4 swords, 1 diamond, FC: coin   => SC 1000  (ie 100++200+100+100+bonus)
	Given A 1 turn game is running with rigged dice rolls "3,3,3,5,5,5,1,5", fortune "5" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 1000
	
	@tag94
	Scenario: FC: 2 sword sea battle, first  roll:  4 monkeys, 1 sword, 2 parrots and a coin
					     then reroll 2 parrots and get coin and 2nd sword  
						   score is: 200 (coins) + 200 (monkeys) + 300 (swords of battle) + 500 (full chest) = 1200
	Given A 1 turn game is running with rigged dice rolls "3,3,3,3,5,4,4,2/2,5", fortune "4" and fortune indicator "2"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "6,7"
	And Player 1 inspect new rolled dice	
	And Player 1 end current round and score
	And Player 1 has scored 1200
	
	@tag97
	Scenario: FC: monkey business and RTS: 2 monkeys, 1 parrot, 2 coins, 3 diamonds   SC 1200 (bonus)
	Given A 1 turn game is running with rigged dice rolls "3,3,4,2,2,1,1,1", fortune "7" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 1200
	