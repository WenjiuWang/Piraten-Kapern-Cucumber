@tag
Feature: LEVEL 2:  NETWORKED GAME TEST

	@tag125
	Scenario: game starts, each player plays a turn with scores being updated correctly 
	 						players play turns until a winner is declared
	 					
	Given A 9 round game is running with rigged dice rolls "6,6,3,3,4,4,5,5/5,2/3,3,3,4,4,4,6,2/4,4,4,5,5,1,1,2/4,4/6,2,4/3,3,3,3,5,4,4,2/2,5/3,3,4,2,2,1,1,1/6,6,4,2,2,1,1,1/6,6/0/3,6/0/2,2,2,2,2,2,2,2/6,6,6,4,4,5,5,5/5,5,5,5,5,5,5,5", fortune "3,7,1,4,7,8,5,5,2" and fortune indicator "0,0,0,2,0,2,0,0,0"
	Then Three players join the game
	
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "2,6"
	And Player 1 inspect new rolled dice
	And Player 1 has 1 skull in current dice
	And Player 1 end current round and score
	And Player 1 has scored 200
	
	And Player 2 inspect new rolled dice
	And Player 2 end current round and score
	And Player 2 has scored 1100

	And Player 3 inspect new rolled dice
	And Player 3 put dice at position "6,7,8" in the Treasure Chest
	And Player 3 inspect new rolled dice
	And Player 3 reroll dice at position "4,5"
	And Player 3 inspect new rolled dice
	And Player 3 put dice at position "1,2,3,4,5" in the Treasure Chest
	And Player 3 inspect new rolled dice
	And Player 3 take dice at position "6,7,8" out of the Treasure Chest
	And Player 3 inspect new rolled dice
	And Player 3 reroll dice at position "6,7,8"
	And Player 3 inspect new rolled dice
	And Player 3 end current round and score
	And Player 3 has scored 1100
	
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "6,7"
	And Player 1 inspect new rolled dice	
	And Player 1 end current round and score
	And Player 1 has scored 1400
	
	And Player 2 inspect new rolled dice
	And Player 2 end current round and score
	And Player 2 has scored 2300
	
	And Player 3 inspect new rolled dice
	And Player 3 reroll dice at position "6,8"
	And Player 3 inspect new rolled dice
	And Player 3 reroll dice at position "5,7"	
	And Player 3 inspect new rolled dice	
	And Player 3 end current round and score
	And Player 1 got 700 score deducted
	And Player 2 got 700 score deducted
	And Player 1 has scored 700
	And Player 2 has scored 1600
	And Player 3 has scored 1100
	
	And Player 1 inspect new rolled dice
	And Player 1 end current round and score
	And Player 1 has scored 6100
	
	## Since player 1 now reach 6000 score, other players have 1 last more turn respectively.
	And Player 2 inspect new rolled dice
	And Player 2 has scored 1600
	
	And Player 3 inspect new rolled dice
	And Player 3 end current round and score
	And Player 3 has scored 10100	
	
	And Player 1 receive winner info
	And Player 2 receive winner info
	And Player 3 receive winner info
	
	And The Winner is Player 3
	