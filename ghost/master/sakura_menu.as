function OnMouseDoubleClick
{
	if (Shiori.Reference[5] == 0)
	{
		return OnSakuraMenu("initial");
	}
}

function SakuraMenuGreetings
{
	local output = "";
	output += Random.Select([
		"\s[11]",
		"\s[111]",
		"\s[113]",
		"\s[211]",
		"\s[213]",
		"\s[30]",
		"\s[31]",
		"\s[130]",
		"\s[131]",
		"\s[230]",
		"\s[231]"
	]);
	
	local greetings = [
		"Mm?",
		"What?",
		"Human?",
		"Mortal?",
		"Be quick.",
		"Speak, mortal.",
		"Mm? What is it?",
		"What is it now?",
		"What do you want?",
		"You want something?",
		"Is there a problem?",
		"You have something to say to me?",
		"You have my attention, for a moment.",
		"If you're looking for good luck, I don't give handouts."
	];
	
	if (Save.Data.AskedGods == 1)
	{
		greetings.Add("Can't a deity from aeons past smoke in peace?");
	}
	
	output += Random.Select(greetings);
	
	return output;
}

function OnSakuraMenu(initial)
{
	output = "";
	
	//Workaround for not having YAYA's eventid stuff
	local isinitial = 0;
	if (initial == "initial")
	{
		isinitial = 1;
	}
	
	if (!isinitial)
	{
		output += "\C\![lock,balloonrepaint]\c";
	}
	output += "\0\![set,autoscroll,disable]";
	
	local greet = "";
	if (isinitial)
	{
		greet = SakuraMenuGreetings();
	}
	else
	{
		greet = Shiori.Reference[0];
	}
	
	output += "\n\n\n\![quicksection,true]\![no-autopause]";
	
	output += "\![*]\q[Talk to me,OnAiTalk]";
	if (!LastTalk == "")
	{
		output += "  \![*]\q[Say that again,OnLastTalk]";
	}
	
	output += "\n";
	
	output += "\![*]{StoryQuestion()}";
	
	output += "\n\n";
	
	output += "\![*]Talkrate: ";
	local times = ["Off,0","1m,60","3m,180","5m,300","10m,600","15m,900"];
	
	for (i = 0; i < times.length; i++)
	{
		local time = times[i];
		
		if (time.Split(",")[1] == Save.Data.TalkInterval)
		{
			output += `\_a[OnChangeTalkrate,{time.Split(',')[1]},"{greet}"]{time.Split(',')[0]}\_a `;
		}
		else
		{
			output += `\__q[OnChangeTalkrate,{time.Split(',')[1]},"{greet}"]{time.Split(',')[0]}\__q `;
		}
	}
	
	output += "\n\n";
	
	output += "\![*]\q[Nevermind,OnMenuClose]";
	
	output += "\_l[0,0]";
	
	if (isinitial)
	{
		greet = AutoPause(greet);
		output += "\![quicksection,false]";
	}
	output += greet;
	
	
	return output;
	
}

function OnLastTalk
{
	return LastTalk;
}

function StoryQuestion
{
	if (Save.Data.AskedGods == 1)
	{
		if (Save.Data.StoryIndex == 1)
		{
			if (Save.Data.KnowDueyar)
			{
				return "\__q[OnStory,UpsetDueyar]What did you do to upset Dueyar?\__q";
			}
			else
			{
				return "\__q[OnAskGods,Dueyar]Who's Dueyar?\__q";
			}
		}
		else if (Save.Data.StoryIndex == 2)
		{
			if (Save.Data.KnowAion)
			{
				return "\__q[OnStory,ProblemWithFate]Why do you have such a problem with fate?\__q";
			}
			else
			{
				return "\f[color,disable]What did you do to upset Dueyar?\f[color,default]";
			}
		}
		else if (Save.Data.StoryIndex == 3)
		{
			if (Save.Data.KnowSajun || Save.Data.KnowMalous)
			{
				return "\__q[OnStory,SajunAndMalous]What happened with Sajun and Malous?\__q";
			}
			else
			{
				return "\f[color,disable]Why do you have such a problem with fate?\f[color,default]";
			}
		}
		else //0
		{
			return "\__q[OnStory,HidingInACave]Why is an immortal god hiding in a cave?\__q";
		}
	}
	else
	{
		return "\__q[OnStory,Locked]Why are you hiding in a cave?\__q";
	}
}

function OnChangeTalkrate
{
	local interval = Shiori.Reference[0];
	SetTalkInterval(interval);
	//I mostly copied this from the existing talk rate change function...
	return `\C\![no-autopause]\![raise,OnSakuraMenu,"{Shiori.Reference[1]}"]`;
}

function OnMenuClose
{
	return "\_w[{Random.GetIndex(1,4) * 1000}]{OnSurfaceRestore}\_w[3000]"; //The pause at the end here is superfluous, but it matches the YAYA version...
}