package com.wenjiuwang.PiratenKapern;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;


public class RiggedGame extends Game implements Runnable {
	
	int turn;
	int rollCount = 0;
	int[][] riggedRolls;
	int[] indicatorPile;
	
	/*
	 * Constructor
	 */

	public RiggedGame(ServerSocket s, int t, int[][] r, Fortune[] fs, int[] indis) {
		this.serverSocket = s;
		this.turn = t;
		this.riggedRolls = r;
		this.fortunePile = fs;
		this.indicatorPile = indis;
	}
	
	@Override
	public void run() {
		try {
			this.startServer();
			this.play();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public int[] reroll(int[] dice, int[] rollPos) {
        for (int i = 0; i < rollPos.length; i++) { 
        	if (dice[rollPos[i]-1] - 1 != Object.SKULL.ordinal()) {
                dice[rollPos[i]-1] = this.riggedRolls[this.rollCount][i];
        	} else if (this.fortune == Fortune.SORCERESS) {
                dice[rollPos[i]-1] = this.riggedRolls[this.rollCount][i];
                this.fortune = Fortune.NONE;
        	}
        }
        this.rollCount += 1;
		return dice;
	}
	
	@Override
	public void startServer() {
	}

	/*
	 * Game Loop - Server side
	 */
	private void play() throws ClassNotFoundException {
		// connect players
		try {
			int playerCount = 0;
			while(playerCount < 3) {
				Socket clientSocket = this.serverSocket.accept();
				Client c = new Client(clientSocket);
				this.clients[playerCount] = c;
				this.players[playerCount] = new PlayerData(playerCount);
				playerCount += 1;
			}
				
			for (int i = 0; i < 3; i++) {
				Thread thread = new Thread(this.clients[i]);
				thread.start();
			}
		} catch (IOException ex) {
			System.out.println("Could not connect 3 players");
		}
		
		try {
			//play turns until maximum turn reached
			int playerNum = 0;
			int curTurn = 0;
			int[] curDice = {1};

			while(curTurn < this.turn) {
				curTurn += 1;
				this.fortune = this.fortunePile[this.fortuneCount];
				this.fortuneIndicator = this.indicatorPile[this.fortuneCount];
				this.fortuneCount += 1;
				curDice = this.firstRoll();				
				//send back fortune & dice info
				int skulls = Game.countObject(Object.SKULL, this.fortune, this.fortuneIndicator, curDice);
				
		        //send back initial info
		        if (skulls >= 4 && this.fortune != Fortune.SEABATTLE) {
			        //SKULL OF ISLAND
					this.sendRequest(playerNum, RequestCode.ISLAND_OF_SKULLS, curDice, this.turnDeductScore(curDice));
		        } else {
		        	//NORMAL TURN
					this.sendRequest(playerNum, RequestCode.NORMAL, curDice, this.turnTotalScore(curDice));
		        }
				
				//Handle client requests until turn ends
		        boolean playTurn = true;
		        while(playTurn) {
					Gamedata gd = (Gamedata) this.clients[playerNum].inStream.readObject();
					switch(gd.code) {
						case REROLL:
							//re roll
							int[] pos = gd.data;
							curDice = this.reroll(curDice, pos);
							this.sendRequest(playerNum, (skulls >= 4 && this.fortune != Fortune.SEABATTLE ? RequestCode.ISLAND_OF_SKULLS : RequestCode.NORMAL), curDice, 
									(skulls >= 4 && this.fortune != Fortune.SEABATTLE ? this.turnDeductScore(curDice) : this.turnTotalScore(curDice)));
							break;
						case PUT_IN:
							//Put dice in the chest 
							for (int i = 0; i < gd.data.length; ++i) {
								if (this.treasureChest[gd.data[i]-1]) {
									System.out.println("Skip die #" + gd.data[i] + " cause it is already in the chest.");
								} else {
									this.treasureChest[gd.data[i]-1] = true;
								}
							}
							this.sendRequest(playerNum, RequestCode.NORMAL, curDice, this.turnTotalScore(curDice));
							break;
						case TAKE_OUT:
							//Take dice out of the chest
							for (int i = 0; i < gd.data.length; ++i) {
								if (this.treasureChest[gd.data[i]-1]) {
									this.treasureChest[gd.data[i]-1] = false;
								} else {
									System.out.println("Skip die #" + gd.data[i] + " cause it not in the chest.");
								}
							}
							this.sendRequest(playerNum, RequestCode.NORMAL, curDice, this.turnTotalScore(curDice));
							break;
						default:
							playTurn = false;
							break;
					}
		        }
				//update player points:
		        if (skulls >= 4 && this.fortune != Fortune.SEABATTLE) {
		        	//island of skulls
					for (int i = 0; i < 3; ++i) {
						 int[] info = { playerNum };
						if (i != playerNum) {
							this.players[i].score -= this.turnDeductScore(curDice);
							this.sendRequest(i, RequestCode.DEDUCT, info, this.turnDeductScore(curDice));
						}
					}
		        } else {
		        	//NORMAL TURN
					this.players[playerNum].score += this.turnTotalScore(curDice);
		        }
		        
				//determine next player
				playerNum = (playerNum < 2) ? playerNum + 1 : 0;
				
				//clear treasure chest
				for (int i = 0; i < this.treasureChest.length; ++i) {
					this.treasureChest[i] = false;
				}
								
			}
			
			//determine winner
			int winner = getWinner();
			this.fortuneIndicator = winner;
			//send winner info to players, then quit.
			for (int i = 0; i < 3; ++i) {
				if (i == winner) {
					this.sendRequest(i, RequestCode.WIN, curDice, this.players[playerNum].score);
				} else {
					this.sendRequest(i, RequestCode.LOSE, curDice, this.players[playerNum].score);
				}
			}
			System.out.println("Game Over! The winner is player " + (winner + 1) + "!");
		} catch (IOException ex) {
			System.out.println("Disconnected");
		}
	}



}
