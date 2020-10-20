@tag
Feature: LEVEL 1b: ADVANCED SCORING

	# Sorceress
	@tag70
	Scenario: roll 2 skulls, reroll one of them due to sorceress, then go to next round of turn
	Given A 1 round game is running with rigged dice rolls "6,6,3,3,4,4,5,5/5,2", fortune "3" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "2,6"
	And Player 1 inspect new rolled dice
	And Player 1 has 1 skull in current dice
	And Player 1 end current round and score
	And Player 1 has scored 200
	
	@tag71
	Scenario: roll no skulls, then next round roll 1 skull and reroll for it, then score 
	Given A 1 round game is running with rigged dice rolls "1,1,3,3,4,4,5,5/5,6/3,4", fortune "3" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "2,6"
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "5,6"
	And Player 1 inspect new rolled dice
	And Player 1 has 0 skull in current dice
	And Player 1 end current round and score
	And Player 1 has scored 300
	
	@tag72
	Scenario: roll no skulls, then next round roll 1 skull and reroll for it, then go to next round 
	Given A 1 round game is running with rigged dice rolls "1,1,3,3,4,4,5,5/5,6/3,4", fortune "3" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "2,6"
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "5,6"
	And Player 1 inspect new rolled dice
	And Player 1 has 0 skull in current dice
	And Player 1 end current round and score
	And Player 1 has scored 300

	# Monkey Business
	@tag75
	Scenario: first roll gets 3 monkeys 3 parrots  1 skull 1 coin  SC = 1100  (i.e., sequence of of 6 + coin)
	Given A 1 round game is running with rigged dice rolls "3,3,3,4,4,4,6,2", fortune "7" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 1100
	
	@tag76
	Scenario: over several rolls: 2 monkeys, 1 parrot, 2 coins, 1 diamond, 2 swords         SC 400
	Given A 1 round game is running with rigged dice rolls "3,3,3,4,4,4,5,2/2,1/3,5/3,1", fortune "7" and fortune indicator "0"
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
	Given A 1 round game is running with rigged dice rolls "3,2,3,4,4,4,5,2/4,3/3,5", fortune "7" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "3,7"
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "2,8"
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 2000
	
	# Treasure Chest
	@tag80
	Scenario: roll 3 parrots, 2 swords, 2 diamonds, 1 coin     
							put 2 diamonds and 1 coin in chest
						  then reroll 2 swords and get 2 parrots 
						  put 5 parrots in chest 
						  and take out 2 diamonds & coin
						  then reroll the 3 dice and get 1 skull, 1 coin and a parrot
						  score 6 parrots + 1 coin for 1100 points	
	Given A 1 round game is running with rigged dice rolls "4,4,4,5,5,1,1,2/4,4/6,2,4", fortune "1" and fortune indicator "0"
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
	Given A 1 round game is running with rigged dice rolls "6,6,4,4,4,2,2,2/1,1,2/6,2", fortune "1" and fortune indicator "0"
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
	
	# Full Chest
	@tag91
	Scenario: 3 monkeys, 3 swords, 1 diamond, 1 parrot FC: coin   => SC 400  (ie no bonus)
	Given A 1 round game is running with rigged dice rolls "3,3,3,5,5,5,1,4", fortune "5" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 400
	
	@tag92
	Scenario: 3 monkeys, 3 swords, 2 coins FC: captain   => SC (100+100+200+500)*2 =  1800
	Given A 1 round game is running with rigged dice rolls "3,3,3,5,5,5,2,2", fortune "2" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 1800
	
	@tag93
	Scenario: 3 monkeys, 4 swords, 1 diamond, FC: coin   => SC 1000  (ie 100++200+100+100+bonus)
	Given A 1 round game is running with rigged dice rolls "3,3,3,5,5,5,1,5", fortune "5" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 1000
	
	@tag94
	Scenario: FC: 2 sword sea battle, first  roll:  4 monkeys, 1 sword, 2 parrots and a coin
					     then reroll 2 parrots and get coin and 2nd sword  
						   score is: 200 (coins) + 200 (monkeys) + 300 (swords of battle) + 500 (full chest) = 1200
	Given A 1 round game is running with rigged dice rolls "3,3,3,3,5,4,4,2/2,5", fortune "4" and fortune indicator "2"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "6,7"
	And Player 1 inspect new rolled dice	
	And Player 1 end current round and score
	And Player 1 has scored 1200
	
	@tag97
	Scenario: FC: monkey business and RTS: 2 monkeys, 1 parrot, 2 coins, 3 diamonds   SC 1200 (bonus)
	Given A 1 round game is running with rigged dice rolls "3,3,4,2,2,1,1,1", fortune "7" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 1200
	
	# Skulls Island adn Skull Fortune Cards
	@tag100
	Scenario: die by rolling one skull and having a FC with two skulls
	Given A 1 round game is running with rigged dice rolls "6,3,4,2,2,1,1,1", fortune "8" and fortune indicator "2"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 has scored 0
	
	@tag101
	Scenario: die by rolling one skull and having a FC with two skulls
	Given A 1 round game is running with rigged dice rolls "6,6,4,2,2,1,1,1", fortune "8" and fortune indicator "1"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 has scored 0
	
	@tag102
	Scenario: roll 5 skulls with FC: Captain => -1000 for all other players  (Captain doubles the penalty)
	Given A 1 round game is running with rigged dice rolls "6,6,6,2,1,1,6,6", fortune "2" and fortune indicator "0"
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
	Given A 1 round game is running with rigged dice rolls "6,6,4,2,2,1,1,1/6,6/0/3,6", fortune "8" and fortune indicator "2"
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
	Given A 1 round game is running with rigged dice rolls "6,6,6,2,2,1,1,1/4,5", fortune "8" and fortune indicator "2"
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
	Given A 1 round game is running with rigged dice rolls "6,6,6,2,2,1,1,1/6,5/0/3,3", fortune "8" and fortune indicator "1"
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
	Given A 1 round game is running with rigged dice rolls "6,6,6,2,2,1,1,1/6,5/0/3,3", fortune "8" and fortune indicator "1"
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
	
	# Sea Battles
	@tag109
	Scenario: FC 2 swords, die on first roll   => lose 300 points
	Given A 1 round game is running with rigged dice rolls "6,6,6,3,3,4,4,5", fortune "4" and fortune indicator "2"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 has scored 0
	
	@tag110
	Scenario: FC 3 swords, die on first roll   => lose 500 points
	Given A 1 round game is running with rigged dice rolls "6,6,6,3,3,4,4,5", fortune "4" and fortune indicator "3"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 has scored 0
	
	@tag111
	Scenario: FC 4 swords, die on first roll   => lose 1000 points
	Given A 1 round game is running with rigged dice rolls "6,6,6,3,3,4,4,5", fortune "4" and fortune indicator "4"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 has scored 0
	
	@tag112
	Scenario: show deduction received cannot make your score negative
	Given A 1 round game is running with rigged dice rolls "6,6,6,3,3,4,4,5", fortune "4" and fortune indicator "4"
	Then Three players join the game
	And Set Player 1 initial score to 100
	And Player 1 inspect new rolled dice
	And Player 1 has scored 0
	
	@tag113
	Scenario: FC 2 swords, roll 3 monkeys 2 swords, 1 coin, 2 parrots  SC = 100 + 100 + 300 = 500
	Given A 1 round game is running with rigged dice rolls "3,3,3,5,5,4,4,2", fortune "4" and fortune indicator "2"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score 
	And Player 1 has scored 500
	
	@tag114
	Scenario: FC 2 swords, roll 4 monkeys 1 sword, 1 skull  2 parrots
	  					then reroll 2 parrots and get 1 sword and 1 skull   SC = 200 +  300 = 500
	Given A 1 round game is running with rigged dice rolls "3,3,3,3,5,6,4,4/5,6", fortune "4" and fortune indicator "2"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "7,8"		
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score 
	And Player 1 has scored 500
	
	@tag116
	Scenario: FC 3 swords, roll 3 monkeys 4 swords  SC = 100 + 200 + 500 = 800
	Given A 1 round game is running with rigged dice rolls "3,3,3,5,5,5,5,4", fortune "4" and fortune indicator "3"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score 
	And Player 1 has scored 800
	
	@tag117
	Scenario: FC 3 swords, roll 4 monkeys 2 swords 2 skulls 
	  					         then reroll 4 monkeys and get  2 skulls and 2 swords   -> DIE
	Given A 1 round game is running with rigged dice rolls "3,3,3,3,5,5,6,6/6,6,5,5", fortune "4" and fortune indicator "3"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "1,2,3,4"		
	And Player 1 inspect new rolled dice
	And Player 1 has scored 0
	
	@tag119
	Scenario: FC 4 swords, roll 3 monkeys 4 swords 1 skull  SC = 100 +200 + 1000 = 1300
	Given A 1 round game is running with rigged dice rolls "3,3,3,5,5,5,5,6", fortune "4" and fortune indicator "4"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score 
	And Player 1 has scored 1300
	
	@tag120
	Scenario: FC 4 swords, roll 3 monkeys, 1 sword, 1 skull, 1 diamond, 2 parrots  
	  					then reroll 2 parrots and get 2 swords thus you have 3 monkeys, 3 swords, 1 diamond, 1 skull
  						then reroll 3 monkeys and get  1 sword and 2 parrots  SC = 200 + 100 + 1000 = 1300
	Given A 1 round game is running with rigged dice rolls "3,3,3,5,6,1,4,4/5,5/5,4,4", fortune "4" and fortune indicator "4"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "7,8"		
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "1,2,3"		
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score 
	And Player 1 has scored 1300
	
	