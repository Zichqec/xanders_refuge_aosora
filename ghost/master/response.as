function OnAskGods
{
	if (Shiori.Reference[0] == "Aion")
	{
		Save.Data.KnowAion = 1;
	}
	else if (Shiori.Reference[0] == "Dueyar")
	{
		Save.Data.KnowDueyar = 1;
	}
	else if (Shiori.Reference[0] == "Sajun")
	{
		Save.Data.KnowSajun = 1;
	}
	else if (Shiori.Reference[0] == "Malous")
	{
		Save.Data.KnowMalous = 1;
	}
	
	local output = "";
	
	if (Save.Data.AskedGods == 1)
	{
		//TODO this is... very brittle. I'm trying to add \x after it and no matter how i do it it breaks. Don't want to do it script by script...
		return Reflection.Get("OnAskGods_" + Shiori.Reference[0]);
	}
	else //first time asking
	{
		if (Shiori.Reference[0] == "Xaeyar") //Asking about him
		{
			if (Save.Data.AskedGods == 2) //If you asked in the firstboot
			{
				Save.Data.AskedGods = 1;
				return OnAskGods_FirstTime_Xaeyar_A;
			}
			else //If you didn't ask
			{
				Save.Data.AskedGods = 1;
				return OnAskGods_FirstTime_Xaeyar_B;
			}
		}
		else //Asking about a different god first
		{
			Save.Data.AskedGods = 1;
			return OnAskGods_FirstTime_Other;
		}
	}
}

talk OnAskGods_Aion
{
	\0\s[222]Aion is the god of fate. They're the ultimate authority on everything, even the gods. \s[213]Absolutely nothing escapes their grasp. 
	
	\s[0]Despite that, they tend to stay out of our quibbles. \s[111]After all, why bother to fight when things will go your way regardless? 
	
	{smoke(2)}\s[200]Unfortunately for them, I exist, and I think their plans are dull. \s[111] So I spice things up a little. \s[211]I can't \f[italic,1]change\f[italic,default] fate, but my domain is such that I can add some obstacles. 
	
	\s[0]We haven't really seen eye to eye in a long time. Not many of the others share my grievances, though.
}

talk OnAskGods_Dueyar
{
	\0\s[220]Dueyar is the god of justice and order, and I suppose you could call her my sister. \s[221]It's a little more complicated than that, but I wouldn't expect a mortal to understand. 
	
	{smoke(2)}\s[211]We have... \s[200]some disagreements. \s[220]She rather likes for fate's plans to go exactly as prescribed, \s[121]and I do not. 
	
	\s[13]You really don't want to deal with her if you can avoid it. \s[11]You'll never meet someone more stubborn.
}

talk OnAskGods_Xaeyar
{
	\0\s[11]That's me. \s[111]God of luck, if you've forgotten.\w8\w8{br}{XaeyarDescript}
}

talk OnAskGods_Iella
{
	\0\s[0]Iella is the god of jealousy and greed. She wants pretty much anything she can get her hands on. \s[130]Especially if someone else has it. \s[11]If you can believe it, this causes strife between her and the other gods quite frequently. 
	
	\s[0]To hear her tell it, the world would be boring if nobody ever desired anything. \s[11]Which I suppose is true, but I think she's really just making excuses for herself.
}

talk OnAskGods_Enva
{
	\0\s[0]Enva is the god of strategy. \s[11]You'd think she'd get on well with the god of war, but not really. \s[220]She's the manipulative sort, always carefully pulling the strings to align things in her favor. \s[221]She's not really a fan of mine. 
	
	{smoke}\s[213]Still, she has an admirable ability to make solid plans and execute them well, provided she accounts for my little setbacks.
}

talk OnAskGods_Kasarae
{
	\0\s[200]Kasarae is the god of war and strength. \s[211]Might makes everything right, according to her. \s[130]I would suggest staying out of her way if you see her, \s[230]she's known for brutal murders whenever the mood strikes. 
	
	\s[200]There's not much more to say, really. \s[211]She is bloodlust incarnate.
}

talk OnAskGods_Nyphine
{
	\0\s[0]Nyphine is the god of loyalty. \s[11]She believes in forming strong bonds, and pursuing them above all else. \s[113]Unfortunately that makes her very loyal to fate, as well. \s[222]As to be expected, I suppose. 
	
	\s[130]She's a very powerful ally if you can get her on your side. \s[221]Just don't ever make the mistake of betraying her, she does not like when loyalty is thrown aside.
}

talk OnAskGods_Tysus
{
	\0\s[0]Tysus is the god of health. \s[11]And he will nag you about it relentlessly. 
	
	{smoke}\s[22]His exterior is very rough, but if you get to know him you'll find he has a lot of compassion underneath. \s[100]Just remember that he's god of \f[italic,1]health\f[italic,default], not god of \f[italic,1]good\f[italic,default] health. \s[131]Don't piss him off. \s[230]A slow and lingering death from disease is the last thing you want.
}

talk OnAskGods_Gabin
{
	\0\s[0]Gabin is the god of love. \s[22]He's the soft sort that gets attached easily to just about anyone. \s[113]This inevitably leads to heartbreak whenever his favorite mortal of the century dies, as mortals tend to do. 
	
	\s[200]I don't blame him for it, but I hate to see him suffer.
}

talk OnAskGods_Meiyr
{
	\0\s[0]Meiyr is the god of understanding. \s[11]That's a lot scarier than it sounds. \s[130]They struggle with many inner demons, and they want their turmoil to be understood, you see. 
	
	\s[31]At times they have been known to go to extreme lengths to make that happen. \s[21]You really don't want to trifle with them, or they'll give you a taste of the hell{br}they've been through. \s[11]But if you're also suffering, they'll be the best supporter you could ever have.
}

//TODO br here is making it not pause - this note is from the YAYA version
talk OnAskGods_Tohmjir
{
	\0\s[11]Tohmjir is the god of growth and decay. \s[111]I imagine that sounds scary to a mortal, but he's one of the least scary gods you could meet. \s[31]The man just wants to grow plants and watch over decomposing skulls,{br}how can he be faulted for that? 
	
	\s[0]Well, that's not entirely true. \s[11]He also wants good food and drink, which I think is why his domain has to do with growth in the first place. \s[200]He always seems content, so maybe he's onto something.
}

talk OnAskGods_Nemara
{
	\0\s[221]Nemara is the god of impulsivity, and is extremely hot-headed. \s[230]She'd punch you right in the face at the drop of a hat if her mood is sour, and it usually is. \s[0]We tend to end up on the same side of various issues, though. She doesn't care much for living life in the way it was laid out for her. 
	
	\s[111]Our solutions are different, though.
}

talk OnAskGods_Thaelia
{
	\0\s[0]Thaelia is the god of balance. \s[131]That's what she calls herself, anyways, but it's a bit of a misnomer. \s[30]Balance in a vestibular sense,\w4{br}not as in managing the forces of good and evil. \s[100]Although, it's actually a wider domain than even that; she covers all sorts of so-called 6th senses, and subconscious processes. 
	
	\s[230]You ever look at a person and immediately know they're bad news? \s[130]That's her. That gut feeling. 
	
	\s[0]We work together more than you might expect. We both have our invisible tendrils all over the world, subtly influencing a bit of everything. \s[11]The main difference is that she goes with the flow, while I disrupt it.
}

talk OnAskGods_Vismir
{
	\0\s[111]Vismir is the god of invention. If you've ever found yourself suddenly struck with a seemingly brilliant idea, that's his influence. \s[31]Actual brilliance of the idea may vary. 
	
	\s[22]He mingles a lot with the mortal population, always has. \s[111]I'd say he's the most likely of the gods for someone to casually bump into. 
	
	\s[200]Much like me, he's not terribly fond of following fate's plan unquestioningly. He changes up his identity a lot, \w4\s[211]and he's been responsible for all of your kind's leaps in technology.
}

talk OnAskGods_Sajun
{
	\0\s[111]Sajun is one half of the god of joy. \s[11]He and his "brother" @Malous used to be a singular being, \w4\s[200]but they were deemed too powerful and were split in two. \s[211]Together they could give and take joy at will, but alone, Sajun can only give joy. 
	
	\s[231]I know "god that gives joy" sounds nice on the surface, but a fragile mortal such as yourself should avoid him at all costs. \s[111]His{br}"joy" primarily comes from watching others suffer.
}

talk OnAskGods_Malous
{
	\0\s[111]Malous is one half of the god of joy. \s[11]He and his "brother" @Sajun used to be a singular being, \w4\s[200]but they were deemed too powerful and were split in two. \s[211]Together they could give and take joy at will, but alone, Malous can only take joy. 
	
	\s[130]I know "god that takes joy" sounds terrible on the surface, but he's generally very reasonable, and makes good company. \s[11]He'd do anything for his brother though, so he's still best avoided by mortals.
}

talk OnAskGods_Nevris
{
	\0\s[0]Nevris is the god of life and death. \s[111]She brings souls into the world at the start of life, and collects them later when they have expired. \s[0]She does fate's dirty work, basically. \s[200]People tend to hate her for it, not realizing that she's the one providing souls with safe passage to the afterlife. 
	
	\s[222]She's a good fit for the job, always practical and punctual. \s[211]A shame she can't be convinced to deviate from fate's plans.
}

talk OnAskGods_FirstTime_Xaeyar_A
{
	\t\*\0\s[231]Did I not explain this to you already? \s[131]Xaeyar is my name, or your mortal approximation of it. \s[111]Xaeyar, god of luck? One of several deities that influences this world you inhabit? \w8\w8\w8
	
	\s[31]This really doesn't ring a bell for you at all? \w8{smoke(2)}\s[213]I thought these things were taught in school... 
	
	\s[200]I don't know how you've come this far in life without any familiarity at all, but I suppose I could tell you about myself and my... \s[220]companions... \s[221]if you want to know. 
	
	\s[11]It will be a far more accurate account than you could get from mortal teachings anyhow, \s[130]you would not believe the sorts of wild assumptions your kind makes about us.
	
	\_q\![*]\__q[OnAskGods_Bridge_Xaeyar]So,\![] about yourself...?\__q
}

talk OnAskGods_FirstTime_Xaeyar_B
{
	\t\*\0\s[230]Who is Xaeyar? \s[231]Don't they teach you this in school? 
	
	{smoke(2)}\w8\w8\s[211]Xaeyar is my name, or your mortal approximation of it. I am one of the gods that influences this world you inhabit. \s[200]I don't know how you've come this far in life without any familiarity at all, but I suppose I could tell you about myself and my... \s[220]companions... \s[221]if you want to know. 
	
	\s[11]It will be a far more accurate account than you could get from mortal teachings anyhow, \s[130]you would not believe the sorts of wild assumptions your kind makes about us.
	
	\_q\![*]\__q[OnAskGods_Bridge_Xaeyar]So,\![] about yourself...?\__q
}

talk OnAskGods_FirstTime_Other
{
	\t\*\0\s[230]Who is {Shiori.Reference[0]}? \s[231]Don't they teach you this in school? 
	
	{smoke(2)}\w8\w8\s[211]{Shiori.Reference[0]} is one of the gods that influences this world you inhabit. \s[200]I don't know how you've come this far in life without any familiarity at all, but I suppose I could tell you about my... \s[220]companions... \s[221]if you want to know. 
	
	\s[11]It will be a far more accurate account than you could get from mortal teachings anyhow, \s[130]you would not believe the sorts of wild assumptions your kind makes about us.
	
	\_q\![*]\__q[OnAskGods_Bridge,{Shiori.Reference[0]}]So,\![] about {Shiori.Reference[0]}...?\__q
}

talk OnAskGods_Bridge_Xaeyar
{
	\0\s[0]Right... you wanted to know about me in particular. \s[222]How to explain... I don't usually have to tell people about myself. \w8\w8
	
	{smoke}\s[111]As I said previously, I am the god of luck. {XaeyarDescript}
}

function OnAskGods_Bridge
{
	return "\0\s[222]Yes, yes, of course. You wanted to know about {Shiori.Reference[0]} in particular. \s[11]Hmm. \w8\s[0]I don't usually have to explain my brethren, where do I begin... \w8\w8\n\n {smoke}\![embed,OnAskGods_{Shiori.Reference[0]}]";
}

talk XaeyarDescript
{
	\s[11]I influence just about everything in some fashion, even if only in subtle ways. \s[200]Not everyone is a fan. I tend to ruin meticulously made plans. 
	
	\s[230]I add some color and interest to the world,\w4{br}where otherwise it would be drab and predictable.
}

function OnStory
{
	if (Shiori.Reference[0] == "")
	{
		return OnStory@Locked + "locked\x";
	}
	else
	{
		//local ref = Shiori.Reference[0];
		local talk_name = "OnStory@" + Shiori.Reference[0];
		return Reflection.Get(talk_name);
		//return OnStory@Locked() + "locked\x";
	}
}

talk OnStory@HidingInACave
{
	\0\s[0].\w8.\w8. \w8\w8\s[11]I might have caused a bit of trouble back home. \s[100]Maybe, say, stepped on{br}@Dueyar's toes a little too heavily. 
	
	\s[200]Something of that nature.\![raise,OnIncrementStory,1]
}

talk OnStory@UpsetDueyar
{
	\0\s[11]Well, as I mentioned, she's the god of justice and order. \s[211]A lot of emphasis on that justice part. 
	
	{smoke}\s[0]She'd spent quite a bit of time and energy tracking down a master criminal, and finally pinned him with evidence for all kinds of heinous crimes he'd committed. \s[111]You name it, he'd done it,\w4 pretty much. 
	
	\s[0]He was set to be executed for his numerous crimes, and rightly so. \x\n[-200]
	
	\0\s[0]Anyways, he broke free, thanks to a tiny favor from me. \s[111]I thought it would be more interesting if things didn't go perfectly to plan. 
	
	\s[230]You should have seen the storm that followed. \s[130]@Dueyar flew into a rage, and we haven't had a normal conversation since. \s[200]She's still enraged any time she sets sight on me. 
	
	\s[220]They caught him again not that long later;\w8{br}fate had already decided that it was his time, so I'm not sure what harm a little bump in the road really caused there. \s[221]If anything, I'm keeping them from becoming too complacent. \x\n[-200]
	
	{smoke(2)}\s[213]Anyways, I figured literally anything was more productive than being yelled at all the time, and maybe some time apart will let her cool down. 
	
	\s[0]So here I am, spending my free time in a cave for probably the next century or two.\w8\w8{br}\s[11]Talking to a mortal, apparently.\![raise,OnIncrementStory,2]
}

talk OnStory@ProblemWithFate
{
	\0\s[0]Well they're the greatest tyrant in the universe, for one. \s[211]Sure they mostly stay in the background, but they're pulling the strings on everything. \s[111]Their authority goes, and they don't really listen to anyone else. 
	
	\s[220]Not even the other gods, it's hardly fair to compare us to them. \s[221]We're all pawns in their little game. \s[121]And if that's the way things are going to be, I may as well make it at least somewhat challenging for them.\w8\w8\x\n[-200]
	
	{smoke(2)}\s[222]That's something most mortals don't know about us. They think the gods are all powerful. Infinite, invincible, unbreakable.\w8\w8
	
	\s[231]I'm not quite sure why, given that @Sajun and @Malous are clear evidence that this is not the case. \s[230]But I suppose they've come up with stories to explain that away. \s[222]As some of my bretheren have done as well, truthfully.\![raise,OnIncrementStory,3]
}

talk OnStory@SajunAndMalous
{
	\0{smoke(2)}\s[222]As I told you before, they're the two halves of what used to be the singular god of joy. \s[122]I've been around since the beginning of time, practically speaking, so I knew him. \s[211]And I was there the day he was torn in two. \x\n[-200]
	
	\0\s[200]Things have never been quite the same since then. \s[220]It's one of the few times I've ever seen @Aion take an active role, and the only time they have acted outwardly against one of us. 
	
	\s[221]I suppose he must have been causing some sort of problem with their ultimate plan for the world. Or perhaps they were simply dissatisfied with what they had made. \x\n[-200]
	
	\s[121]Let me tell you, rending a god in two is no easy task, even if you are their creator. \s[220]That's the sort of sight you don't forget, even after millenia have passed. 
	
	\s[222]I think, for a moment, I understood what it was to be mortal. To have no say in what was happening, and no chance to stop it. \s[22]To realize that my own life could be taken away at fate's whim. \s[13]That we are not, in fact, untouchable. \x\n[-200]
	
	{smoke}\s[13]I've been at odds with fate since then. \s[22]After all, if who we are as people does not matter to them as much as their end goal does, why bother playing nice? \s[21]I certainly am not going to sit around and be puppeteered passively. 
	
	\s[213]There isn't really a way to escape fate, of that much I am certain. \s[11]But I \f[italic,1]can\f[italic,default] be a thorn in their side. \x\n[-200]
	
	\s[222]Some of the other gods get it, but a lot of them don't. Some of them were made after that day, and can't truly understand what it was like. \s[213]And some of them are simply in denial.\![raise,OnIncrementStory,0]
}

talk OnStory@Locked
{
	\0\s[21]That's hardly any business of yours, mortal.
}

function OnIncrementStory
{
	Save.Data.StoryIndex = Shiori.Reference[0];
}