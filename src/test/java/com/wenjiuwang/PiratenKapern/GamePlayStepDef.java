package com.wenjiuwang.PiratenKapern;

import junit.framework.TestCase;

import java.io.IOException;
import java.net.ServerSocket;
import java.util.Arrays;
import java.util.List;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;

public class GamePlayStepDef extends TestCase {
	
	RiggedGame game;
	
	RiggedPlayerA2 player1;
	RiggedPlayerA2 player2;
	RiggedPlayerA2 player3;
	
	RiggedPlayerA2[] players = new RiggedPlayerA2[3];
	
	int port = 0;
	
	Thread serverThread;

	@Given("A {int} round game is running with rigged dice rolls {string}, fortune {string} and fortune indicator {string}")
	public void the_server_is_running(int round, String roll, String fs, String indi) {
		try {
			ServerSocket s;
			s = new ServerSocket(0);
			this.port = s.getLocalPort();
			
			//rigged dice
			List<String> rolls = Arrays.asList(roll.split("\\s*/\\s*"));			
			int[][] riggedRolls = new int[rolls.size()][];
			for(int i=0; i<rolls.size(); i++) {
				String[] integerStrings = rolls.get(i).split(",");
				int[] temp = new int[integerStrings.length];
				for (int j = 0; j < integerStrings.length; j++){ 
					temp[j] = (Integer.parseInt(integerStrings[j]));
				}
				if (temp[0] == 0) {
					temp = new int[0];
				}
				riggedRolls[i] = temp.clone();
		     }
			//rigged fortunes
			String[] fortunes = fs.split("\\s*,\\s*");			
			Fortune[] riggedFortunes = new Fortune[fortunes.length];
			for(int i=0; i<fortunes.length; i++) {
				int temp = (Integer.parseInt(fortunes[i]));
				riggedFortunes[i] = Fortune.values()[temp];
			}
			//rigged indicators
			String[] indicators = indi.split("\\s*,\\s*");			
			int[] riggedindicators = new int[indicators.length];
			for(int i=0; i<indicators.length; i++) {
				int temp = (Integer.parseInt(indicators[i]));
				riggedindicators[i] = temp;
			}
			
			game=new RiggedGame(s, round, riggedRolls, riggedFortunes, riggedindicators);
			serverThread = new Thread(game);
			serverThread.start();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	@Then("Three players join the game")
	public void three_players_join_the_game() {
		try {
			player1 = new RiggedPlayerA2(this.port, "A");
			player1.connectServer();
		
			player2 = new RiggedPlayerA2(this.port, "B");
			player2.connectServer();
			
			player3 = new RiggedPlayerA2(this.port, "C");
			player3.connectServer();

			this.players[0] = player1;
			this.players[1] = player2;
			this.players[2] = player3;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}
	
	@Then("Player {int} inspect new rolled dice")
	public void player_inspect_new_dice(int int1) {
	    try {
			this.players[int1-1].receiveData();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Then("Player {int} reroll dice at position {string}")
	public void player_reroll_dice_at_position(int int1, String string) {
		String[] integerStrings = string.split(",");
		int[] temp = new int[integerStrings.length];
		for (int j = 0; j < integerStrings.length; j++){ 
			temp[j] = (Integer.parseInt(integerStrings[j]));
		}
	    try {
			this.players[int1-1].rerollDice(temp);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Then("Player {int} is dead")
	public void player_is_dead(Integer int1) {
	}
	
	@Then("Player {int} end current round and score")
	public void player_end_current_round_and_score(Integer int1) {
	    try {
			this.players[int1-1].endTurn();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Then("Player {int} has scored {int}")
	public void player_has_scored(int int1, int int2) {
	    // Write code here that turns the phrase above into concrete actions
		assertEquals(this.players[int1-1].score, int2);
	}
	
	@Then("Player {int} has {int} skull in current dice")
	public void player_has_skull_in_current_dice(int int1, int int2) {
    	assertEquals(int2, Game.countObject(Object.SKULL, Fortune.SORCERESS, 0, this.players[int1-1].dice));
	}
	
	@Then("Player {int} put dice at position {string} in the Treasure Chest")
	public void player_put_dice_at_position_in_the_Treasure_Chest(Integer int1, String string) {
		String[] integerStrings = string.split(",");
		int[] temp = new int[integerStrings.length];
		for (int j = 0; j < integerStrings.length; j++){ 
			temp[j] = (Integer.parseInt(integerStrings[j]));
		}
	    try {
			this.players[int1-1].putChest(temp);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	@Then("Player {int} take dice at position {string} out of the Treasure Chest")
	public void player_take_dice_at_position_out_of_the_Treasure_Chest(Integer int1, String string) {
		String[] integerStrings = string.split(",");
		int[] temp = new int[integerStrings.length];
		for (int j = 0; j < integerStrings.length; j++){ 
			temp[j] = (Integer.parseInt(integerStrings[j]));
		}
	    try {
			this.players[int1-1].takeChest(temp);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	@Then("Player {int} got {int} score deducted")
	public void player_got_score_deducted(int int1, int int2) {
	    try {
			this.players[int1-1].receiveData();
			assertEquals(int2,this.players[int1-1].turnScore);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	@Then("Set Player {int} initial score to {int}")
	public void set_Player_initial_score_to(Integer int1, Integer int2) {
		this.players[int1-1].score = 100;
	}
	
	@Then("Player {int} receive winner info")
	public void player_receive_winner_info(Integer int1) {
	    try {
			this.players[int1-1].receiveData();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	@Then("The Winner is Player {int}")
	public void the_Winner_is_Player(int int1) {
		assertEquals(int1-1,this.game.getWinner());
	}


}
