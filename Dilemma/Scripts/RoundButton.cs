using Godot;
using System;

public partial class RoundButton : Button
{
	public override void _Pressed()
	{
		GD.Print("Round button clicked!");
	}
}
