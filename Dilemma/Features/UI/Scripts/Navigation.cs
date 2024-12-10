using Godot;
using System;

public partial class Navigation : Sprite2D
{
	[Export] public string PopupScenePath { get; set; } = "";  // Path to the popup scene
	[Export] public float MoveDownDistance { get; set; } = 3.0f;  // Distance to move down when pressed
	[Export] public NodePath BackgroundNodePath { get; set; } = "";  // Path to the background node
	[Export] public Color TargetColor { get; set; } = new Color(0.6f, 0.9f, 0.6f, 1.0f);  // Default is green

	private Vector2 _originalPosition;  // Store the original position to reset later
	private CanvasItem _backgroundNode;  // Resolved reference to the background node

	// Static references to track the active popup
	private static Node _activePopupInstance = null;
	private static string _activePopupScenePath = "";
	
	private bool _escapeButtonPressed = false;

	public override void _Ready()
	{
		// Save the original position of the sprite
		_originalPosition = Position;

		// Resolve the background node
		if (!string.IsNullOrEmpty(BackgroundNodePath))
		{
			_backgroundNode = GetNode<CanvasItem>(BackgroundNodePath);
		}
	}

	public override void _Input(InputEvent @event)
	{
		if (@event is InputEventMouseButton mouseEvent && mouseEvent.ButtonIndex == MouseButton.Left)
		{
			if (mouseEvent.Pressed && GetRect().HasPoint(ToLocal(mouseEvent.Position)))
			{
				MoveButtonDown();
				TogglePopupAndColor();
			}
			else if (!mouseEvent.Pressed)
			{
				ResetButtonPosition();
			}
		}
		
		else if(@event is InputEventKey EscapeKey && _escapeButtonPressed == false)
		{	
			// Check if the key is pressed and is not an echo
			if (EscapeKey.Pressed && !EscapeKey.Echo)
			{
				EscapeKey.Echo = true;
				_escapeButtonPressed = true;
				GD.Print("ESCAPE");				
			}
					
		}
	}

	private void MoveButtonDown()
	{
		// Move the button down by the defined distance
		Position += new Vector2(0, MoveDownDistance);
	}

	private void ResetButtonPosition()
	{
		// Reset the button to its original position
		Position = _originalPosition;
	}

	private void TogglePopupAndColor()
	{
		if (_activePopupInstance != null && IsInstanceValid(_activePopupInstance))
		{
			if (_activePopupScenePath == PopupScenePath)
			{
				// If the same button is clicked, close the current popup
				_activePopupInstance.CallDeferred("queue_free");
				_activePopupInstance = null;
				_activePopupScenePath = "";
			}
			else
			{
				// If a different button is clicked, close the current popup and open the new one
				_activePopupInstance.CallDeferred("queue_free");
				_activePopupInstance = null;
				_activePopupScenePath = "";
				ChangeBackgroundColor();  // Change to the new button's color
				OpenPopupScene();
			}
		}
		else
		{
			// No active popup, open the new one and change color
			ChangeBackgroundColor();
			OpenPopupScene();
		}
	}

	private void OpenPopupScene()
	{
		if (ResourceLoader.Exists(PopupScenePath))
		{
			var popupScene = ResourceLoader.Load(PopupScenePath) as PackedScene;
			if (popupScene != null)
			{
				var popupInstance = popupScene.Instantiate();
				if (popupInstance != null)
				{
					GetTree().Root.AddChild(popupInstance);  // Add popup to the root
					popupInstance.Set("z_index", 100);  // Ensure the popup is on top

					// Update the static variables
					_activePopupInstance = popupInstance;
					_activePopupScenePath = PopupScenePath;
				}
			}
		}
	}

	private void ChangeBackgroundColor()
	{
		if (_backgroundNode != null)
		{
			// Change the background node's color to the target color
			_backgroundNode.Modulate = TargetColor;
		}
	}
}
