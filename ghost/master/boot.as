talk OnFirstBoot
{
	\1\s[-1]\0\s[0]\t\*\s[11]Hm? \w8\s[0]Oh, a human. 
	
	{smoke}\s[213]\w8\w8\w8\s[200]Is there a reason you're bothering me? 
	
	\s[211]... \w8\w8\w8\s[220]Nah, forget it. The look on your face says enough. 
	
	\s[111]Well, listen. I'm feeling generous. \s[100]You can hang out with the great Xaeyar on one condition: \w8\s[230]not a word to anyone that I'm here. 
	
	\s[0]I won't tell anyone you're hiding, you{br}won't tell anyone I'm hiding. \s[111]Fair?

	\_q\![*]\q[Fair.,OnFirstBootEnd,Fair]  \![*]\q[Who's Xaeyar?,OnFirstBootEnd,Who]
}

function OnFirstBootEnd
{
	if (Shiori.Reference[0] == "Fair")
	{
		return "\0\s[0]Thought so. {smoke(2)}\s[200]Call me Xander. \s[111]I'm trying to lay low, and all that.";
	}
	else
	{
		Save.Data.AskedGods = 2;
		return FirstBootEndDontKnow;
	}
}

talk FirstBootEndDontKnow
{
	\0\s[130]You don't know Xaeyar, master of all things chance? \s[220]Praised at unlikely victories, and cursed at every misfortune? \s[211]God of luck since aeons past? 
	
	... \w8\w8\w8\s[231]What rock have you been living under?\w8\w8\w8
	
	{smoke(2)}\s[213]Well. \w8\w8\s[200]You're standing in his presence, for what that's worth. \w8\w8
	
	\s[113]Anyways, as I said, I'm trying to lay low. \s[11]So just call me Xander.
}


//—————————————————————————————— Booting ——————————————————————————————
talk BootTalk
{
	\0\s[11]Hm? Oh, \s[0]it's just you again. 
	
	{smoke}\s[30]What's up?
}

talk BootTalk
{
	\0\s[11]The human appears. Greetings.
}

talk BootTalk
{
	\0\s[22]... \w8\w8\w8
	
	\s[11]Ah- \w8\s[30]when did you get here? \w8\w8\s[222]Well, I suppose I could do worse for company.
}

talk BootTalk
{
	\0\s[0]Hey. \w8\w8{smoke}\s[200]
}

talk BootTalk
{
	\0\s[11]There you are. \s[0]I knew you'd be coming.
}

talk BootTalk
{
	\0\s[11]Hey. \s[211]You didn't see @Dueyar out there looking for me, did you? 
	
	\s[220]I suppose not, you don't look terrified enough for that. {smoke(2)}\s[200]
}

talk BootTalk
{
	\0\s[11]Mm? \s[111]Oh, hey. \s[22]I was just thinking I might head out. 
	
	{smoke}\s[13]Ah, what the hell, a few more hours won't{br}kill 'em.
}

talk BootTalk
{
	\0\s[11]You've decided to join me today, have you?
}

talk BootTalk
{
	\0\s[11]It's the human again. \s[0]Still hiding, are we?
}

talk BootTalk
{
	\0\s[11]Ah, I am graced with the presence of the mortal. \s[0]What can this deity do for you on such a dreary day.
}

talk BootTalk if(Save.Data.TotalBoots > 3)
{
	\0\s[11]I was wondering if you'd show up today. \s[0]We seem to end up here together a lot.
}

talk BootTalk if(Save.Data.TotalBoots > 3)
{
	\0\s[11]I wasn't expecting to see you today. \s[0]Not that I particularly mind your presence.
}


//—————————————————————————————— Closing ——————————————————————————————
talk CloseTalk
{
	\0\s[111]Leaving? \s[11]I was just thinking I should head out too. 
	
	\s[213]Can't dodge my duties forever. \s[211]See you around.
}

talk CloseTalk
{
	\0\s[111]Done running from your problems? 
	
	\s[13]I'm not, I'll be here a while yet if you decide you want to come back.
}

talk CloseTalk
{
	\0\s[11]I'll be here if you decide to come by again.
}

talk CloseTalk
{
	\0\s[222]Leaving me by myself, eh? 
	
	\s[211]Fair enough, off you go.
}

talk CloseTalk
{
	\0\s[200]I should get going before I'm missed. \s[211]I'm sure I'll be back this way again.
}

talk CloseTalk
{
	\0\s[11]Mm? On your way out? \s[0]So long, then.
}

talk CloseTalk
{
	\0\s[0]Don't get lost on the way home.
}

talk CloseTalk
{
	\0\s[0]Best hurry if you're heading out, there's rain on the way. \s[111]Someone else in town is in need of a good drenching, \s[11]but you don't{br}have to be caught up in it if you're quick.
}

talk CloseTalk
{
	\0\s[11]Until next time, then. \s[0]I'll be around this area for the foreseeable future.
}

talk CloseTalk
{
	\0\s[11]Tired of my company at last? \s[0]Or perhaps you have other places to be. \s[30]Off you go, then.
}

talk CloseTalk if(Save.Data.TotalBoots > 3)
{
	\s[11]Good luck out there.
}

talk CloseTalk if(Save.Data.TotalBoots > 3)
{
	\0\s[11]Best of luck to you.
}

talk CloseTalk if(Save.Data.TotalBoots > 3)
{
	\0\s[30]Oh, you're heading out? \w8\w8\s[0]Take care, then. Don't go and get eaten by a monster. \s[11]I'd hate to lose my responsibility-avoiding buddy.
}