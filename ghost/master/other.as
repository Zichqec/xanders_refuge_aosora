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
	//TODO ask about if IndexOf outputs nothing instead of -1 if it finds no matches
	//if (talkstr.IndexOf("\![no-autopause]") < 0)
	if (talkstr.IndexOf("\![no-autopause]").IsNull())
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
		//TODO ask about \a not calling randomtalk...
		return OnAiTalk(); //TODO this isn't how i want to do it but it will work
	}
	else if (Shiori.Reference[0] == "r")
	{
		return OnLastTalk();
		//TODO i have no idea here...
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

// function OnSecondChange
// {
	// //TODO i want to try to add in an equivalent of TalkEndTime here so that he only does this 15 seconds after a dialogue ends...
	// //Um.......... damn idk how to get EPOCH either :joy:
// }

//TODO THIS IS TEMPORARY i just wanna see my boy move around a little
function OnSecondChange
{
	if (Random.GetIndex(0,60) == 0)
	{
		return OnSurfaceRestore;
	}
}

//TODO BalloonIsOpen
//I am unsure how to work this without documentation...
// function BalloonIsOpen
// {
	// if (Shiori["balloon"])
	// {
		// return 1;
	// }
	// else
	// {
		// return 0;
	// }
// }

function OnWindowStateRestore
{
	return OnSurfaceRestore;
}

function homeurl
{
	//just "aosora" or "aosora port"...
	return "https://raw.githubusercontent.com/Zichqec/xanders_refuge_aosora/main/";
}

function ghostver
{
	//Equivalent version in YAYA plus incrementer for the port...? idk mannn
	return "1.0.2_p01";
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
			output += "";
		}
		else
		{
			output += "";
		}
	}
	return output;
}

//TODO can't get this to show up no matter what I do. possible bug? Also find out if there's a better way to type these characters
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

//TODO On_getaistateex
//Hahaaaa this MAY be possible for randomtalk depending on what nanachi says, but the word groups absolutely not

//Moved needle and spectre responses to commu.as since they're gonna be a bit long