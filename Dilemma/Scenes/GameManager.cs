using Godot;
using System;

public partial class GameManager : Node2D
{
	// Represents the current turn value in the game. This property can be modified externally.
	public int ActualTurnValue { get; set; } 

	// Stores the current game state, used to control game flow.
	public Global.GameState gameState { get; set; }	

	// Called when the node enters the scene tree for the first time.
	// Initialize game settings and check the initial state.
	public override void _Ready()
	{
		// Logging a simple message for debugging purposes.
		GD.Print("Pingas");

		// Set the initial game state to the StartState.
		gameState = Global.GameState.StartState;

		// Initialize the turn value to the first turn's value defined globally.
		ActualTurnValue = Global.FirstTurnValue;

		// Log the current value of the first turn.
		GD.Print("First Turn: " + ActualTurnValue);
		
		// Check the current game state to handle any necessary actions at the start.
		checkGameState(gameState);
	}

	// Called every frame. The delta parameter represents the time since the last frame.
	// Used to check and update game state continuously.
	public override void _Process(double delta)
	{
		// Continuously monitor and process the current game state.
		checkGameState(gameState);
	}

	// Increment the turn value by one, moving to the next turn.
	public void nextTurn()
	{
		ActualTurnValue += 1;
	}

	// This function checks the current game state and performs actions accordingly.
	public void checkGameState(Global.GameState state)
	{
		// Log the current game state for debugging purposes.
		GD.Print("Game State: " + gameState);

		// Switch statement to execute specific logic based on the current game state.
		switch (state)
		{
			case Global.GameState.StartState:
				// If the game is in the StartState, show the welcome menu.
				welcomeMenu();
				break;

			case Global.GameState.IntroState:
				// If the game is in the IntroState, play the intro sequence.
				playIntro();
				break;

			case Global.GameState.SelectState:
				// If the game is in the SelectState, allow the player to select a country.
				selectCountry();
				break;

			case Global.GameState.PlayState:
				// If the game is in the PlayState, start the main gameplay.
				gameplay();
				break;

			case Global.GameState.EndingState:
				// If the game is in the EndingState, play the ending sequence.
				playEnding();
				break;

			default:
				// If the game state is unknown, log a message for debugging.
				GD.Print("Unknown game state.");
				break;
		}
	}

	// Display the welcome menu.
	public void welcomeMenu()
	{
		GD.Print("Welcome to our SEXEH game with our SEXEH menu !");
	}

	// Play the introduction part of the game.
	public void playIntro()
	{
		GD.Print("LORE ! LORE ! LORE !");
	}

	// Allow the player to select a country.
	public void selectCountry()
	{
		GD.Print("Select da country! ");
	}

	// Main gameplay function where the primary dilemmas take place.
	public void gameplay()
	{
		GD.Print("It's dilemma time! ");
	}

	// Play the ending part of the game when the player loses.
	public void playEnding()
	{
		GD.Print("BRUH YOU DIED !");
	}

	// Start a new game by transitioning to the intro state.
	public void newGame()
	{
		gameState = Global.GameState.IntroState;
	}
}
