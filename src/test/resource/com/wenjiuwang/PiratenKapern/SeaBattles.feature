@tag
Feature: Sea Battles
	
	@tag109
	Scenario: FC 2 swords, die on first roll   => lose 300 points
	Given A 1 turn game is running with rigged dice rolls "6,6,6,3,3,4,4,5", fortune "4" and fortune indicator "2"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 has scored 0
	
	@tag110
	Scenario: FC 3 swords, die on first roll   => lose 500 points
	Given A 1 turn game is running with rigged dice rolls "6,6,6,3,3,4,4,5", fortune "4" and fortune indicator "3"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 has scored 0
	
	@tag111
	Scenario: FC 4 swords, die on first roll   => lose 1000 points
	Given A 1 turn game is running with rigged dice rolls "6,6,6,3,3,4,4,5", fortune "4" and fortune indicator "4"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 has scored 0
	
	@tag112
	Scenario: show deduction received cannot make your score negative
	Given A 1 turn game is running with rigged dice rolls "6,6,6,3,3,4,4,5", fortune "4" and fortune indicator "4"
	Then Three players join the game
	And Set Player 1 initial score to 100
	And Player 1 inspect new rolled dice
	And Player 1 has scored 0
	
	@tag113
	Scenario: FC 2 swords, roll 3 monkeys 2 swords, 1 coin, 2 parrots  SC = 100 + 100 + 300 = 500
	Given A 1 turn game is running with rigged dice rolls "3,3,3,5,5,4,4,2", fortune "4" and fortune indicator "2"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score 
	And Player 1 has scored 500
	
	@tag114
	Scenario: FC 2 swords, roll 4 monkeys 1 sword, 1 skull  2 parrots
	  					then reroll 2 parrots and get 1 sword and 1 skull   SC = 200 +  300 = 500
	Given A 1 turn game is running with rigged dice rolls "3,3,3,3,5,6,4,4/5,6", fortune "4" and fortune indicator "2"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "7,8"		
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score 
	And Player 1 has scored 500
	
	@tag116
	Scenario: FC 3 swords, roll 3 monkeys 4 swords  SC = 100 + 200 + 500 = 800
	Given A 1 turn game is running with rigged dice rolls "3,3,3,5,5,5,5,4", fortune "4" and fortune indicator "3"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score 
	And Player 1 has scored 800
	
	@tag117
	Scenario: FC 3 swords, roll 4 monkeys 2 swords 2 skulls 
	  					         then reroll 4 monkeys and get  2 skulls and 2 swords   -> DIE
	Given A 1 turn game is running with rigged dice rolls "3,3,3,3,5,5,6,6/6,6,5,5", fortune "4" and fortune indicator "3"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "1,2,3,4"		
	And Player 1 inspect new rolled dice
	And Player 1 has scored 0
	
	@tag119
	Scenario: FC 4 swords, roll 3 monkeys 4 swords 1 skull  SC = 100 +200 + 1000 = 1300
	Given A 1 turn game is running with rigged dice rolls "3,3,3,5,5,5,5,6", fortune "4" and fortune indicator "4"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score 
	And Player 1 has scored 1300
	
	@tag120
	Scenario: FC 4 swords, roll 3 monkeys, 1 sword, 1 skull, 1 diamond, 2 parrots  
	  					then reroll 2 parrots and get 2 swords thus you have 3 monkeys, 3 swords, 1 diamond, 1 skull
  						then reroll 3 monkeys and get  1 sword and 2 parrots  SC = 200 + 100 + 1000 = 1300
	Given A 1 turn game is running with rigged dice rolls "3,3,3,5,6,1,4,4/5,5/5,4,4", fortune "4" and fortune indicator "4"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "7,8"		
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "1,2,3"		
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score 
	And Player 1 has scored 1300
	
	