@tag
Feature: Sorceress

	@tag70
	Scenario: roll 2 skulls, reroll one of them due to sorceress, then go to next round of turn
	Given A 1 turn game is running with rigged dice rolls "6,6,3,3,4,4,5,5/5,2", fortune "3" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "2,6"
	And Player 1 inspect new rolled dice
	And Player 1 has 1 skull in current dice
	And Player 1 end current round and score
	And Player 1 has scored 200
	
	@tag71
	Scenario: roll no skulls, then next round roll 1 skull and reroll for it, then score 
	Given A 1 turn game is running with rigged dice rolls "1,1,3,3,4,4,5,5/5,6/3,4", fortune "3" and fortune indicator "0"
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
	Given A 1 turn game is running with rigged dice rolls "1,1,3,3,4,4,5,5/5,6/3,4", fortune "3" and fortune indicator "0"
	Then Three players join the game
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "2,6"
	And Player 1 inspect new rolled dice
	And Player 1 reroll dice at position "5,6"
	And Player 1 inspect new rolled dice
	And Player 1 has 0 skull in current dice
	And Player 1 end current round and score
	And Player 1 has scored 300

	