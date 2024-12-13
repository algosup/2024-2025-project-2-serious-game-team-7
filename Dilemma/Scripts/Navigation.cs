using Godot;
using System;

public partial class Navigation : Sprite2D
{
	[Export] public string PopupScenePath { get; set; } = "";  // Path to the popup scene
	[Export] public float MoveDownDistance { get; set; } = 3.0f;  // Distance to move down when pressed
	[Export] public NodePath BackgroundNodePath { get; set; } = "";  // Path to the background node
	[Export] public Color TargetColor { get; set; } = new Color(0.6f, 0.9f, 0.6f, 1.0f);  // Default is green
	[Export] public Color HaloColor { get; set; } = new Color(0.93f, 0.855f, 0.3f, 1.0f);  

	private Vector2 _originalPosition;  // Store the original position to reset later
	private CanvasItem _backgroundNode;  // Resolved reference to the background node

	// Static references to track the active popup
	private static Node _activePopupInstance = null;
	private static string _activePopupScenePath = "";
	
	private Timer lightTimer;
	private PointLight2D _buttonLight;
	private PointLight2D _passButtonLight;
	private int _actualTurn;
	
	public override void _Ready()
	{
		// Access the node with the .gd script
		
		// Save the original position of the sprite
		_originalPosition = Position;
		
		_buttonLight = GetNode<PointLight2D>("ButtonLight");
		_buttonLight.Hide();
		
		_passButtonLight = GetNode<PointLight2D>("../../PassButton/PassButtonLight");
		_passButtonLight.Hide();
		
		//_resumePanel = GetNode<Control>("Resume");
		//_resumePanel.Hide();

		// Resolve the background node
		if (!string.IsNullOrEmpty(BackgroundNodePath))
		{
			_backgroundNode = GetNode<CanvasItem>(BackgroundNodePath);
		}
		
		// Create a new Timer node
		lightTimer = new Timer();
		// Set the timer's wait time to 1 second
		lightTimer.WaitTime = 1.0f;
		// Connect the timeout signal to a custom method
		lightTimer.Timeout += OnTimerTimeout;
		// Add the Timer as a child of the current node
		AddChild(lightTimer);
		// Start the timer
		lightTimer.Start();
		
		_actualTurn = (int)GetTree().Root.GetNode("GlobalVariables").Get("currentTurn");
		
		
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
		
	}
	
	public override void _Process(double delta)
	{
		_actualTurn = (int)GetTree().Root.GetNode("GlobalVariables").Get("currentTurn");
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
	
	private void OnTimerTimeout()
	{	if (_actualTurn < 1)
		{
			_buttonLight.Visible = !_buttonLight.Visible;
			_passButtonLight.Visible = !_passButtonLight.Visible;
		}
		else
		{
			_buttonLight.Visible = false;
			_passButtonLight.Visible = false;
		}
	}
	
	
}
