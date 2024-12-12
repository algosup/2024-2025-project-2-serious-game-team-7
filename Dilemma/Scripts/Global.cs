using Godot;

public static class Global
{
	// Static property for tracking the current turn. Ensures it is globally accessible.
	public static int ActualTurnValue { get; set; } = 1; // Must be static

	// Static property for the value of the first turn, set to 1 by default.
	public static int FirstTurnValue { get; } = 1;

	// Static property for the last turn value, indicating the game end or limit.
	public static int LastTurnValue { get; } = 10;
	
	// Enum representing the different states of the game, used to manage game flow.
	public enum GameState
	{
		StartState,  // The game is in the startup state, displaying the menu.
		IntroState,  // The game is in the introduction state, showing lore or story.
		SelectState, // The player selects a country.
		PlayState,   // The game is in the active gameplay phase.
		EndingState  // The game is in the ending phase (e.g., game over or conclusion).
	}
}
