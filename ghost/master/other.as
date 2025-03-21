function OnTranslate
{
	local talkstr = Shiori.Reference[0];
	
	//NOTE TO SELF: "talk" is a reserved word
	talkstr = talkstr.Replace("@Zichqec","\_a[https://ukagaka.zichqec.com/]Zichqec\_a");
	talkstr = talkstr.Replace("—","\f[name,calibri]—\f[name,default]");
	
	//IMPORTANT NOTE FOR THIS PORT: Aosora uses @ in place of . in function names because it uses dot notation and can't have . in function names.
	//THEREFORE - making a system like this introduces *the possibility of accidental replacements when you're calling functions with tags like raise or menu choices. be careful.*
	talkstr = talkstr.Replace("@Aion","\_a[OnAskGods,Aion]Aion\_a");
	talkstr = talkstr.Replace("@Dueyar","\_a[OnAskGods,Dueyar]Dueyar\_a");
	talkstr = talkstr.Replace("@Xaeyar","\_a[OnAskGods,Xaeyar]Xaeyar\_a");
	talkstr = talkstr.Replace("@Iella","\_a[OnAskGods,Iella]Iella\_a");
	talkstr = talkstr.Replace("@Enva","\_a[OnAskGods,Enva]Enva\_a");
	talkstr = talkstr.Replace("@Kasarae","\_a[OnAskGods,Kasarae]Kasarae\_a");
	talkstr = talkstr.Replace("@Nyphine","\_a[OnAskGods,Nyphine]Nyphine\_a");
	talkstr = talkstr.Replace("@Tysus","\_a[OnAskGods,Tysus]Tysus\_a");
	talkstr = talkstr.Replace("@Gabin","\_a[OnAskGods,Gabin]Gabin\_a");
	talkstr = talkstr.Replace("@Meiyr","\_a[OnAskGods,Meiyr]Meiyr\_a");
	talkstr = talkstr.Replace("@Tohmjir","\_a[OnAskGods,Tohmjir]Tohmjir\_a");
	talkstr = talkstr.Replace("@Nemara","\_a[OnAskGods,Nemara]Nemara\_a");
	talkstr = talkstr.Replace("@Thaelia","\_a[OnAskGods,Thaelia]Thaelia\_a");
	talkstr = talkstr.Replace("@Vismir","\_a[OnAskGods,Vismir]Vismir\_a");
	talkstr = talkstr.Replace("@Sajun","\_a[OnAskGods,Sajun]Sajun\_a");
	talkstr = talkstr.Replace("@Malous","\_a[OnAskGods,Malous]Malous\_a");
	talkstr = talkstr.Replace("@Nevris","\_a[OnAskGods,Nevris]Nevris\_a");
	
	talkstr = AutoPause(talkstr);
	
	return talkstr;
}

function AutoPause(talkstr)
{
	if (talkstr.IndexOf("\![no-autopause]").IsNull() && talkstr.IndexOf("■Aosora reload completed").IsNull())
	{
		talkstr = talkstr.Replace(", ",",\w4 ");
		talkstr = talkstr.Replace(". ",".\w8\w8 ");
		talkstr = talkstr.Replace("? ","?\w8\w8 ");
		talkstr = talkstr.Replace("! ","!\w8\w8 ");
		talkstr = talkstr.Replace("; ",";\w8 ");
		talkstr = talkstr.Replace(": ",":\w8 ");
		talkstr = talkstr.Replace("\n\n ","\n\n\w8\w8");
	}
	return talkstr;
}

function OnAiTalk
{
	//NOTE - no chain setup here just because Xander doesn't use them. I'm thinking I'll write one though... eventually
	//IIRC for the randomtalk in particular, it got weird if I called it without Reflection.Get? I need to look into this more, the specifics here keep sliding off my brain. But I remember if I had the commented out line here, it would do randomtalk via the hotkey but not on its own
	//LastTalk = RandomTalk;
	LastTalk = Reflection.Get("RandomTalk")();
	return LastTalk;
}

function OnAnchorSelect
{
	if (Shiori.Reference[0].StartsWith("http://") || Shiori.Reference[0].StartsWith("https://"))
	{
		return "\j[{Shiori.Reference[0]}]";
	}
}

function OnKeyPress
{
	if (Shiori.Reference[0] == "f1")
	{
		return "\![open,readme]";
	}
	else if (Shiori.Reference[0] == "t")
	{
		return OnAiTalk();
	}
	else if (Shiori.Reference[0] == "r")
	{
		return OnLastTalk();
	}
}

function OnSurfaceRestore
{
	local output = "";
	
	output += "\1\s[-1]\0";
	
	if (Random.GetIndex(0,4) == 0)
	{
		local surface = Random.Select([0,2]);
		
		output += smoke(surface);
		
		output += "\s[{surface}13]";
	}
	else
	{
		output += Random.Select([
		"\s[0]",
		"\s[13]",
		"\s[20]",
		"\s[22]",
		"\s[200]",
		"\s[213]",
		"\s[220]",
		"\s[222]"
		]);
	}
	
	return output;
}

function OnSecondChange
{
	//Attempting to recreate YAYA's TalkEndTime... it doesn't quite work because YAYA does this on the request function, and here I can only do it in OnSecondChange, so it's not completely the same but I'm hoping it's close enough
	
	if (CanTalkFlag != CanTalk())
	{
		CanTalkFlag = CanTalk();
	}
	if (!CanTalk())
	{
		TalkEndTime = Time.GetNowUnixEpoch();
	}
	
	
	local since = Time.GetNowUnixEpoch() - TalkEndTime;
	
	if (since % 15 == 0 && !BalloonIsOpen())
	{
		if (Random.GetIndex(0,4) == 0)
		{
			return OnSurfaceRestore;
		}
	}
}

function BalloonIsOpen
{
	local shioristatus = Shiori.Headers.Status.ToString();
	local found = !shioristatus.IndexOf("balloon").IsNull();
	if (found)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

function OnWindowStateRestore
{
	return OnSurfaceRestore;
}

function homeurl
{
	return "https://raw.githubusercontent.com/Zichqec/xanders_refuge_aosora/main/";
}

function ghostver
{
	//Equivalent version in YAYA plus incrementer for the port
	//It means "aosora" not "alpha"...
	return "1.0.2-a01";
}

//—————————————————————————————— Right click menu links ——————————————————————————————
function FormatLinks(links)
{
	local output = "";
	for (i = 0; i < links.length; i++)
	{
		output += links[i];
		//Alternate between adding  or 
		if (i % 2 == 1)
		{
			output += (2).ToAscii();
		}
		else
		{
			output += (1).ToAscii();
		}
	}
	return output;
}

function OnTestLinks
{
	return FormatLinks(recommendsites_sakura());
}

function sakura@recommendsites
{
	return FormatLinks(recommendsites_sakura());
}

function recommendsites_sakura
{
	return
	[
		"Zi's Ukagaka Space", "https://ukagaka.zichqec.com/"
	];
}


function username
{
	return Save.Data.UserName;
}

function br
{
	if (CurrentBalloonName == "Flip of a Coin")
	{
		return "\n";
	}
	else
	{
		return " ";
	}
}

//This is simplified compared to the YAYA version of this ghost. I didn't bother trying to replicate it since I won't be able to get the count of the items in the word groups and this is just a debug feature anyways
function getaistate
{
	local byte1 = (1).ToAscii;
	return "{RandomTalk.length},0,0{byte1}RandomTalk,Dummy,Dummy";
}