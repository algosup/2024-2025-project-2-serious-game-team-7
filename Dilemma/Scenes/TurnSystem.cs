using Godot;
using System;

public partial class TurnSystem : Label
{
	// Exported property for the turn value
	private int _turnValue = 1;

	[Export]
	public int TurnValue
	{
		get => _turnValue;
		set
		{
			_turnValue = value;
			UpdateLabelText(); // Update the label text whenever TurnValue changes
		}
	}

	[Export] private Sprite2D _passButton; 
	private Timer _cooldownTimer;
	private bool _isButtonClickable = true;
	bool isLabelVisible;

	public override void _Ready()
	{
		
		// Ensure the label text is set when the scene starts
		UpdateLabelText();
		
		Visible = true;

		// Set up the cooldown timer
		_cooldownTimer = new Timer();
		_cooldownTimer.WaitTime = 3; // 3 seconds cooldown
		_cooldownTimer.OneShot = true;
		_cooldownTimer.Connect("timeout", new Callable(this, nameof(OnCooldownTimerTimeout)));
		AddChild(_cooldownTimer);

		// Ensure input processing for the button
		if (_passButton != null)
		{
			_passButton.SetProcessInput(true);
		}
		_cooldownTimer.Start();
	}

	private void UpdateLabelText()
	{
		Text = $"{TurnValue}/10"; // Update the text of the label
	}

	public override void _Input(InputEvent @event)
	{
		if (_isButtonClickable && _passButton != null && @event is InputEventMouseButton mouseEvent)
		{
			// Check if the left mouse button is pressed
			if (mouseEvent.ButtonIndex == MouseButton.Left && mouseEvent.Pressed)
			{
				// Convert the mouse position to local coordinates of the pass button
				Vector2 localPosition = _passButton.ToLocal(mouseEvent.Position);

				// Check if the click is within the pass button's texture rect
				if (_passButton.GetRect().HasPoint(localPosition))
				{
					OnPassButtonClicked();
				}
			}
		}
	}

	private void OnPassButtonClicked()
	{
		// Perform the button's action
		GD.Print("Pass button clicked!");
		Visible = true;
		IncrementTurn();

		// Start the cooldown timer and disable button clicks
		_isButtonClickable = false;
		_cooldownTimer.Start();
	}

	private void IncrementTurn()
	{
		if (TurnValue < 10)
		{
			TurnValue++;
		}
		else
		{
			GD.Print("Maximum turn value reached!");
		}
	}

	private void OnCooldownTimerTimeout()
	{
		// Re-enable the button click after the timer finishes
		_isButtonClickable = true;
		Visible = false;
		GD.Print("Button is clickable again!");
	}
}
