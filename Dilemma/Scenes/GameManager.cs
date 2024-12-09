using Godot;
using System;

public partial class GameManager : Node2D
{
	public int ActualTurnValue { get; set; } 
	public Global.GameState gameState { get; set; }	
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		GD.Print("Pingas");
		
		// Initialize the properties
		gameState = Global.GameState.StartState;
		GD.Print("Game State: " + gameState);
		
		ActualTurnValue = Global.FirstTurnValue;
		GD.Print("First Turn: " + ActualTurnValue);
		
		// Example of calling nextTurn
		nextTurn();
		GD.Print("Second Turn: " + ActualTurnValue);
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
	
	public void nextTurn()
	{
		ActualTurnValue  += 1;
	}
}
