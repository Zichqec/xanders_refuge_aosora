function OnMouseDoubleClick
{
	if (Shiori.Reference[5] == 0)
	{
		return OnSakuraMenu;
	}
}

function SakuraMenuGreetings
{
	//BIG difference here between the YAYA version and Aosora version. I couldn't just apply nonoverlap here like I would with YAYA, so I made my own implementation for this function! It means there are a couple extra variables, but they shouldn't be saved between boots, so it's fine...
	//Basically, create temporary arrays of the base values, and pop out one value to use at a time. Once they're all used up, regenerate the array.
	local baseposes = [
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
	];
	
	local basegreetings = [
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
		basegreetings.Add("Can't a deity from aeons past smoke in peace?");
	}
	
	if (MenuPoses.length == 0)
	{
		MenuPoses = baseposes;
	}
	
	if (MenuGreetings.length == 0)
	{
		MenuGreetings = basegreetings;
	}
	
	local output = "";
	
	local poseindex = Random.GetIndex(0, MenuPoses.length);
	output += MenuPoses[poseindex];
	MenuPoses.Remove(poseindex);
	
	local greetingindex = Random.GetIndex(0, MenuGreetings.length);
	output += MenuGreetings[greetingindex];
	MenuGreetings.Remove(greetingindex);
	
	return output;
}

function OnSakuraMenu
{
	output = "";
	
	local isinitial = 0;
	if (Shiori.Headers.ID == "OnMouseDoubleClick")
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
	else if (!Shiori.Reference[0].IsNull())
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
	TalkTimer.RandomTalkIntervalSeconds = interval;
	TalkTimer.RandomTalkElapsedSeconds = 0;
	Save.Data.TalkInterval = interval;
	
	return `\C\![no-autopause]\![raise,OnSakuraMenu,"{Shiori.Reference[1]}"]`;
}

function OnMenuClose
{
	return "\_w[{Random.GetIndex(1,4) * 1000}]{OnSurfaceRestore}";
}