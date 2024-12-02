using Godot;
using System;

public partial class Menu : Control
{
	private FileDialog _fileDialog;

	public override void _Ready()
	{
		// Initialize and configure the FileDialog node
		_fileDialog = GetNode<FileDialog>("FileDialog");

		// Set up filters for scene files
		_fileDialog.AddFilter("*.tscn ; Godot Scenes");
		
		// Connect the "file_selected" signal to handle file selection
		_fileDialog.Connect("file_selected", new Callable(this, nameof(OnFileSelected)));
	}

	// Triggered when "New Game" is pressed
	public void OnNewGameButtonPressed()
	{
		GD.Print("New Game button pressed");
		// Show the file dialog to choose a scene
		_fileDialog.PopupCentered();
	}

	// Triggered when a file is selected from the FileDialog
	private void OnFileSelected(string path)
	{
		GD.Print($"Selected scene: {path}");
		// Load the selected scene
		GetTree().ChangeSceneToFile(path);
	}

	// Triggered when "Continue" is pressed
	public void OnContinueButtonPressed()
	{
		GD.Print("Continue button pressed");
		// Load a predefined scene
		GetTree().ChangeSceneToFile("res://Scenes/control.tscn");
	}

	// Triggered when "Quit" is pressed
	public void OnQuitButtonPressed()
	{
		GD.Print("Quit button pressed");
		// Exit the game application
		GetTree().Quit();
	}
}
