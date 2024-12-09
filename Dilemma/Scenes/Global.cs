using Godot;

public static class Global
{
	public static int ActualTurnValue { get; set; } = 1; // Must be static
	public static int FirstTurnValue { get; } = 1;
	public static int LastTurnValue { get; } = 10;
	
	public enum GameState{
		StartState,
		IntroState,
		SelectState,
		PlayState,
		EndingState
	}
	
}
