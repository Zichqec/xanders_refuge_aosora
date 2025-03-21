talk OnNeedlePoke
{
	\s[11].\w8.\w8.\w8\w8\w8\w8\w8\s[0]
}

talk OnNeedlePoke
{
	\s[211].\w8.\w8.\w8\w8\w8\w8\w8\s[200]
}

talk OnNeedlePoke
{
	\s[13].\w8.\w8.
}

talk OnNeedlePoke
{
	\s[213].\w8.\w8.
}

talk OnNeedlePoke
{
	\s[111]You do realize that I'm a god and your mortal weapons will have no effect on me,\w4{br}correct?
}

talk OnNeedlePoke
{
	\s[11]Is that supposed to hurt?
}

talk OnNeedlePoke
{
	\s[0]Cute.
}

talk OnNeedlePoke
{
	\s[213]You understand that this is futile, right?
}

talk OnNeedlePoke
{
	\s[13]What do you hope to achieve with this...?
}

talk OnNeedlePoke
{
	\s[21]If that's supposed to hurt, it doesn't.
}

talk OnNeedlePoke
{
	\s[221]The foolishness of mortals truly knows no bounds...
}

talk OnNeedlePoke
{
	\s[0]If you hope to become a god slayer, you'll need a stronger weapon than that.
}

talk OnNeedlePoke
{
	\s[31]Can I help you?
}

talk OnNeedlePoke
{
	\s[131]Is that supposed to be a weapon? It{br}doesn't look particularly deadly.
}

talk OnNeedlePoke
{
	\s[231]You've succeeded in putting a tiny hole in my shirt, congratulations.
}

talk OnNeedlePoke
{
	\s[200]Mortals.
}

talk OnNeedlePoke
{
	\s[0]Oh my, such a vicious attack. \s[11]I'm shaking in my boots.
}

talk OnNeedlePoke
{
	\s[0]Taking out some frustration, are we?
}

talk OnNeedlePoke
{
	\s[11]That puny "weapon" of yours is only barely perceptible to me, for your information.
}


function OnSpectrePlugin@ConfirmCalibration
{
	return "\![raiseplugin,Spectre,OnCustomCalibrationConfirm,embarrassed,smile,relieved,sweat,indignant]";
}

function OnSpectrePlugin@Surface
{
	if (Shiori.Reference[0] == "normal")
	{
		return "\s[11]";
	}
	else if (Shiori.Reference[0] == "surprised")
	{
		return "\s[30]";
	}
	else if (Shiori.Reference[0] == "anxious")
	{
		return "\s[22]";
	}
	else if (Shiori.Reference[0] == "discouraged")
	{
		return "\s[13]";
	}
	else if (Shiori.Reference[0] == "angry")
	{
		return "\s[21]";
	}
	else if (Shiori.Reference[0] == "thinking")
	{
		return "\s[222]";
	}
	else if (Shiori.Reference[0] == "unamused")
	{
		return "\s[220]";
	}
}

function OnSpectrePlugin@Possession
{
	if (Random.GetIndex(0,4) == 0)
	{
		return SpectreReaction;
	}
}

talk SpectreReaction
{
	\s[0]Interesting...
}

talk SpectreReaction
{
	\s[11]There appears to be spiritual activity in this area. \s[0]You should take care.
}

talk SpectreReaction
{
	\s[220]Hmm.
}

talk SpectreReaction
{
	\s[20]Borrowing, are we...?
}

talk SpectreReaction
{
	\s[13]Evidently this cave is haunted... {smoke(2)}\s[213]Pity.
}

talk SpectreReaction
{
	\s[20]Intriguing that you would choose me and not the far weaker human beside me... \s[213]I'll allow it, for now.
}

talk SpectreReaction
{
	\s[220]It's a bit arrogant to take the body of a god, isn't it?
}

talk SpectreReaction
{
	\s[222]I'm honestly a little impressed you've managed this...
}

talk SpectreReaction
{
	\s[20]A strange feeling... \s[220]Interesting.
}