package com.wenjiuwang.PiratenKapern;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Arrays;

public class RiggedPlayerA2 extends Player {
	
	int port;
	RequestCode curCode = RequestCode.NORMAL;
	boolean playing = true;

	/*
	 * Constructor
	 */
	public RiggedPlayerA2(int p, String s) throws ClassNotFoundException {
		super(s);
		this.port = p;
	}
	
	
	@Override
	public void connectServer() {
		try {
			this.socket = new Socket("localhost", this.port);
			this.inStream = new ObjectInputStream(this.socket.getInputStream());
			this.outStream = new ObjectOutputStream(this.socket.getOutputStream());
		} catch (IOException ex) {
			System.out.println("Fails to connect.");
		}
	}
	
	public void rerollDice(int[] pos) throws ClassNotFoundException {
		System.out.println("Please select which die(dice) to be rerolled: (1, 2, 5, ..)");
		System.out.println(Arrays.toString(pos));
		if (pos.length < 2) {
			System.out.println("*** At least 2 dice are required to reroll ***");				
			System.out.println("Please select which die(dice) to be rerolled: (1, 2, 5, ..)");
			return;
		}
		//skull check for reroll pos
		ArrayList<Integer> newDice = new ArrayList<Integer>();    	
		for (int i = 0; i < pos.length; ++i) {
    		newDice.add(this.dice[pos[i]-1]);	
    	}
   		int [] cleanDice = newDice.stream().mapToInt(i -> i).toArray();
		int skullCount = Game.countObject(Object.SKULL, Fortune.NONE, 0, cleanDice);
	    if (skullCount == 0 || (skullCount == 1 && this.fortune == Fortune.SORCERESS)) {
		    this.sendRequest(RequestCode.REROLL, pos);
		    if (this.curCode == RequestCode.ISLAND_OF_SKULLS) {
		    	//Check if NON-SKULL is rolled
				try {
					int rolledSkull = 0;
					Gamedata gd = (Gamedata) this.inStream.readObject();
					for (int i = 0; i < pos.length; ++i) {
						this.dice[pos[i]-1] = gd.data[pos[i]-1];
			    		if (gd.data[pos[i]-1] == 6) {
			   				rolledSkull += 1;
			   			}
			   		}
				    if (rolledSkull >= 1) {
				   		int [] empty = {};
			    		this.sendRequest(RequestCode.REROLL, empty);
			   		} else {
						this.sendRequest(RequestCode.END, this.dice);
						this.printInfo();
						this.printDice();
						System.out.println("******* You didn't get a single skull! Your turn is terminated *******");
						System.out.println("Waiting for your turn.");
			   		}
				} catch (IOException ex) {
					System.out.println("Lost server connection.");
					ex.printStackTrace();
				}
		    }
		        
	     } else {
			System.out.println("*** Based on your fortune card, you can not reroll these many skulls. ***");
			System.out.println("Please select which die(dice) to be rerolled: (1, 2, 5, ..)");
	     }
	}
	
	public void receiveData() throws ClassNotFoundException {
			try {
				Gamedata gd = (Gamedata) this.inStream.readObject();
				this.dice = gd.data.clone();
				this.fortune = gd.fortune;
				this.turnScore = gd.score;
				this.fortuneIndicator = gd.fortuneIndicator;
	    	    this.curCode = gd.code;
				switch(this.curCode) {
					case LOSE:
						System.out.println("You Lose! The winner is player " + (gd.fortuneIndicator + 1) + "!");
						playing = false;
						break;
					case WIN:
						System.out.println("You Win!");
						playing = false;
						break;
					case DEDUCT:
						System.out.println("****** You got " + this.turnScore + " points deducted by player " + (this.dice[0]+1) +  " from the Island of Skulls! ******");
						this.score = (this.score - this.turnScore) < 0 ? 0 : this.score - this.turnScore;
						this.printInfo();
						System.out.println("Waiting for your turn.");
						break;
					case ISLAND_OF_SKULLS:
						//Island of Skulls
						this.printInfo();
						this.printDice();
						System.out.println("****** You are on the Island of Skulls! ******");
						System.out.println("Please enter your selection: ");
						System.out.println("1. Keep Rerolling");
						System.out.println("2. End this turn and deduct points to your opponents");
						break;
					case NORMAL: //normal turn
						//play this turn until end by 3 skull, or by player.
						this.printInfo();
						this.printDice();
						//check if there are more than 3 skulls.
						int skulls = Game.countObject(Object.SKULL, this.fortune, this.fortuneIndicator, this.dice);
				        
				        if (skulls >= 3) {
					        this.sendRequest(RequestCode.END, this.dice);
							this.score = (this.score + this.turnScore) < 0 ? 0 : this.score + this.turnScore;
							//clear treasure chest
							for (int i = 0; i < this.treasureChest.length; ++i) {
								this.treasureChest[i] = false;
							}
							System.out.println("******* You got 3 skulls! Your turn is terminated. *******");
							System.out.println("Waiting for your turn.");
					      	break;
				        }
						
						System.out.println("Please enter your selection: ");
						System.out.println("1. Keep Rerolling");
						System.out.println("2. End this turn and score");
						if (this.fortune == Fortune.TREASURECHEST) {
							System.out.println("3. Put dice in the Treasure chest");
							System.out.println("4. Take dice out of the Treasure chest");
						}
						break;
					default:
						break;
				}
			} catch (IOException ex) {
				System.out.println("Lost server connection.");
				ex.printStackTrace();
			}
	}
	
	public void endTurn() throws ClassNotFoundException {
		this.sendRequest(RequestCode.END, this.dice);
		System.out.println("Waiting for your turn.");
		if (this.curCode == RequestCode.NORMAL) {
			this.score = (this.score + this.turnScore) < 0 ? 0 : this.score + this.turnScore;
		}
		//clear treasure chest
		for (int i = 0; i < this.treasureChest.length; ++i) {
			this.treasureChest[i] = false;
		}
	}
	
	public void putChest(int[] pos) throws ClassNotFoundException {
		//Put dice in the chest 
		System.out.println("Please select which die(dice) to be put in the chest: (1, 2, 5, ..)");

		for (int i = 0; i < pos.length; ++i) {
			if (this.treasureChest[pos[i]-1]) {
				System.out.println("Skip die #" + pos[i] + " cause it is already in the chest.");
			} else {
				this.treasureChest[pos[i]-1] = true;
			}
		}
		this.sendRequest(RequestCode.PUT_IN, pos);

	}
	
	public void takeChest(int[] pos) throws ClassNotFoundException {
		//Take dice out of the chest
		System.out.println("Please select which die(dice) to be taken out of the chest: (1, 2, 5, ..)");
		for (int i = 0; i < pos.length; ++i) {
			if (this.treasureChest[pos[i]-1]) {
				this.treasureChest[pos[i]-1] = false;
			} else {
				System.out.println("Skip die #" + (pos[i]) + " cause it not in the chest.");
			}
		}
		this.sendRequest(RequestCode.TAKE_OUT, pos);
	}

}
