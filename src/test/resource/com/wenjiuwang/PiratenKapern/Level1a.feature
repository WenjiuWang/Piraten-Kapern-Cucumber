@tag
Feature: LEVEL 1a: BASIC DYING and SCORING

	@tag38
	Scenario: die with 3 skulls on first roll  -> interface reports death & end of turn    
	Given A 1 turn game is running with rigged dice rolls "6,6,6,4,4,5,5,5", fortune "5" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 has scored 0

	@tag39
	Scenario: roll 1 skull, 4 parrots, 3 swords, hold parrots, reroll swords, get 2 skulls 1 sword  die    
	Given A 1 turn game is running with rigged dice rolls "6,4,4,4,4,5,5,5/6,6,5", fortune "5" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "6,7,8"
	And Player 1 inspect new rolled dice	
	And Player 1 has scored 0
		
	@tag40
	Scenario: roll 2 skulls, 4 parrots, 2 swords, hold parrots, reroll swords, get 1 skull 1 sword  die
	Given A 1 turn game is running with rigged dice rolls "6,6,4,4,4,4,5,5/6,5", fortune "5" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "7,8"
	And Player 1 inspect new rolled dice	
	And Player 1 has scored 0

	@tag41
	Scenario: roll 1 skull, 4 parrots, 3 swords, hold parrots, reroll swords, get 1 skull 2 monkeys. 
		      reroll 2 monkeys, get 1 skull 1 monkey and die  
	Given A 1 turn game is running with rigged dice rolls "6,4,4,4,4,5,5,5/6,3,3/6,3", fortune "5" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "6,7,8"
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "7,8"	
	And Player 1 inspect new rolled dice
	And Player 1 has scored 0
		
	@tag43
	Scenario: score first roll with nothing but 2 diamonds and 2 coins and FC is captain (SC 800)
	Given A 1 turn game is running with rigged dice rolls "6,3,3,4,1,1,2,2", fortune "2" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 800

	@tag44
	Scenario: get set of 2 monkeys on first roll, get 3rd monkey on 2nd roll (SC 200 since FC is coin)
	Given A 1 turn game is running with rigged dice rolls "6,3,3,4,4,5,5,6/3,4", fortune "5" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "4,5"
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 200
		
	@tag45
	Scenario: score 2 sets of 3 (monkey, swords) in RTS on first roll   (SC 300)
	Given A 1 turn game is running with rigged dice rolls "3,3,3,4,5,5,5,6", fortune "5" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 300
		
	@tag46
	Scenario: score 2 sets of 3 (monkey, parrots) in RTS using 2 rolls   (SC 300)
	Given A 1 turn game is running with rigged dice rolls "3,3,5,4,4,4,5,6/3,4", fortune "5" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "3,4"
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 300	
		
	@tag47
	Scenario: score a set of 3 diamonds correctly (i.e., 400 points)   (SC 500)
	Given A 1 turn game is running with rigged dice rolls "1,1,1,4,4,3,3,6", fortune "5" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 500
		
	@tag48
	Scenario: score a set of 4 coins correctly (i.e., 200 + 400 points) with FC is a diamond (SC 700)
	Given A 1 turn game is running with rigged dice rolls "2,2,2,2,4,3,3,6", fortune "6" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 700
		
	@tag49
	Scenario: score set of 3 swords and set of 4 parrots correctly on first roll (SC 400 because of FC)
	Given A 1 turn game is running with rigged dice rolls "5,5,5,4,4,4,4,6", fortune "5" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 400
		
	@tag50
	Scenario: score set of 3 coins+ FC and set of 4 swords correctly over several rolls (SC = 200+400+200 = 800)
	Given A 1 turn game is running with rigged dice rolls "2,2,2,5,5,5,5,6", fortune "5" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 800
		
	@tag51
	Scenario: same as previous row but with captain fortune card  (SC = (100 + + 300 + 200)*2 = 1200)
	Given A 1 turn game is running with rigged dice rolls "2,2,2,5,5,5,5,6", fortune "2" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 1200
		
	@tag52
	Scenario: score set of 5 swords over 3 rolls (SC 600)
	Given A 1 turn game is running with rigged dice rolls "3,2,3,3,5,5,5,6/5,4/5,6", fortune "5" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "3,4"
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "1,2"
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 600
		
	@tag53
	Scenario: score set of 6 monkeys on first roll (SC 1100)
	Given A 1 turn game is running with rigged dice rolls "3,3,3,3,5,3,3,6", fortune "5" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 1100
		
	@tag54
	Scenario: score set of 7 parrots on first roll (SC 2100)
	Given A 1 turn game is running with rigged dice rolls "4,4,4,4,4,4,4,6", fortune "5" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 2100
		
	@tag55
	Scenario: score set of 8 coins on first roll (SC 5400)  seq of 8 + 9 coins +  full chest (if you have it)
	Given A 1 turn game is running with rigged dice rolls "2,2,2,2,2,2,2,2", fortune "5" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 5400
		
	@tag56
	Scenario: score set of 8 coins on first roll and FC is diamond (SC 5400)  
	Given A 1 turn game is running with rigged dice rolls "2,2,2,2,2,2,2,2", fortune "6" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 5400
			
	@tag57
	Scenario: score set of 8 swords on first roll and FC is captain (SC 4500x2 = 9000) if you have full chest
	Given A 1 turn game is running with rigged dice rolls "5,5,5,5,5,5,5,5", fortune "2" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 9000		
		
	@tag58
	Scenario: score set of 8 monkeys over several rolls (SC 4600 because of FC is coin and full chest)
	Given A 1 turn game is running with rigged dice rolls "3,3,3,3,3,3,3,3", fortune "5" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 4600
		
	@tag59
	Scenario: score a set of 2 diamonds over 2 rolls with FC is diamond (SC 400)
	Given A 1 turn game is running with rigged dice rolls "3,4,5,3,4,5,6,1/6,1", fortune "6" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "1,2"
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 400
		
	@tag60
	Scenario: score a set of 3 diamonds over 2 rolls (SC 500)
	Given A 1 turn game is running with rigged dice rolls "3,4,5,3,4,5,6,1/1,1", fortune "5" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "1,2"
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 500
		
	@tag61
	Scenario: score a set of 3 coins over 2 rolls  (SC 600)
	Given A 1 turn game is running with rigged dice rolls "3,4,5,3,4,5,6,2/2,2", fortune "5" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "1,2"
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 600
		
	@tag62
	Scenario: score a set of 3 coins over 2 rolls  with FC is diamond (SC 500)
	Given A 1 turn game is running with rigged dice rolls "3,4,5,3,4,5,6,2/2,2", fortune "6" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "1,2"
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 500
		
	@tag63
	Scenario: score a set of 4 monkeys and a set of 3 coins (including the COIN fortune card) (SC 600)
	Given A 1 turn game is running with rigged dice rolls "3,3,3,3,2,5,6,2", fortune "5" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 600
		
	@tag65
	Scenario: get 7 swords on first roll, try to roll the 8 die by itself -> interface reports not allowed
	Given A 1 turn game is running with rigged dice rolls "5,5,5,5,5,5,5,2", fortune "5" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "8"
	And Player 1 end current round and score
	And Player 1 has scored 2700
