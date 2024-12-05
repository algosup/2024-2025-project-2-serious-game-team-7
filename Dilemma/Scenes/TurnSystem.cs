using Godot;
using System;

public partial class TurnSystem : Label
{
	// Private backing field for the turn value. The initial turn value is set to 1.
	private int _turnValue = 1;

	// Exported property for TurnValue, allowing it to be set in the editor.
	[Export]
	public int TurnValue
	{
		get => _turnValue; // Getter returns the current turn value.
		set
		{
			_turnValue = value; // Setter updates the turn value.
			UpdateLabelText(); // Update the label text whenever TurnValue is modified.
		}
	}

	// Exported property for the button used to trigger turn advancement.
	[Export] private Sprite2D _passButton;

	// Timer used for cooldown between button presses.
	private Timer _cooldownTimer;

	// Boolean to track whether the button can be clicked.
	private bool _isButtonClickable = true;

	// Flag to manage label visibility.
	bool isLabelVisible;

	// Called when the scene is ready. Initializes the turn system.
	public override void _Ready()
	{
		// Ensure the label text is set when the scene starts (turn value display).
		UpdateLabelText();

		// Set the label visibility to true by default.
		Visible = true;

		// Initialize and configure the cooldown timer.
		_cooldownTimer = new Timer();
		_cooldownTimer.WaitTime = 3; // Set the cooldown period to 3 seconds.
		_cooldownTimer.OneShot = true; // Ensure the timer only triggers once.
		_cooldownTimer.Connect("timeout", new Callable(this, nameof(OnCooldownTimerTimeout))); // Connect timer timeout signal to method.
		AddChild(_cooldownTimer); // Add the timer as a child node to the TurnSystem.

		// Ensure that the pass button processes input.
		if (_passButton != null)
		{
			_passButton.SetProcessInput(true); // Enable input processing for the pass button.
		}

		// Start the cooldown timer immediately after scene initialization.
		_cooldownTimer.Start();
	}

	// Updates the label's text to reflect the current turn value.
	private void UpdateLabelText()
	{
		Text = $"{TurnValue}/10"; // Set the label text to the current turn value out of 10.
	}

	// Handles input events, specifically mouse button events for the pass button.
	public override void _Input(InputEvent @event)
	{
		// Only process input if the button is clickable and the event is a mouse button press.
		if (_isButtonClickable && _passButton != null && @event is InputEventMouseButton mouseEvent)
		{
			// Check if the left mouse button is pressed.
			if (mouseEvent.ButtonIndex == MouseButton.Left && mouseEvent.Pressed)
			{
				// Convert the mouse position to local coordinates of the pass button.
				Vector2 localPosition = _passButton.ToLocal(mouseEvent.Position);

				// Check if the click is within the bounds of the pass button.
				if (_passButton.GetRect().HasPoint(localPosition))
				{
					// Trigger the button's click action.
					OnPassButtonClicked();
				}
			}
		}
	}

	// Called when the pass button is clicked. Handles button functionality.
	private void OnPassButtonClicked()
	{
		// Perform the button's action (log for debugging).
		GD.Print("Pass button clicked!");

		// Make the label visible (this seems to toggle the label on click).
		Visible = true;

		// Increment the turn value.
		IncrementTurn();

		// Disable the button while the cooldown timer is running.
		_isButtonClickable = false;

		// Start the cooldown timer to prevent multiple clicks.
		_cooldownTimer.Start();
	}

	// Increment the turn value, ensuring it doesn't exceed the maximum (10).
	private void IncrementTurn()
	{
		if (TurnValue < 10)
		{
			TurnValue++; // Increment the turn value.
		}
		else
		{
			GD.Print("Maximum turn value reached!"); // Log message if max turn value is reached.
		}
	}

	// Called when the cooldown timer finishes. Re-enables the button for the next click.
	private void OnCooldownTimerTimeout()
	{
		// Re-enable the button after the cooldown finishes.
		_isButtonClickable = true;

		// Hide the label (seems to toggle the label off).
		Visible = false;

		// Log message indicating the button can be clicked again.
		GD.Print("Button is clickable again!");
	}
}
