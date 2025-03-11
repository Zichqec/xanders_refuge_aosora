//Default save data
function OnAosoraDefaultSaveData
{
	Save.Data.UserName = "Mortal";
	Save.Data.TalkInterval = 180;
	Save.Data.TotalBoots = 0;
	Save.Data.StoryIndex = 0;
	Save.Data.AskedGods = 0;
	Save.Data.KnowDueyar = 0;
	Save.Data.KnowAion = 0;
	Save.Data.KnowSajun = 0;
	Save.Data.KnowMalous = 0;
}

//Values to be set upon loading
function OnAosoraLoad
{
	TalkTimer.RandomTalk = OnAiTalk;
	TalkTimer.RandomTalkIntervalSeconds = Save.Data.TalkInterval;
	
	LastTalk = "";
	TalkEndTime = Time.GetNowUnixEpoch();
	CanTalkFlag = 0;
	LastTalk = "";
	MenuPoses = [];
	MenuGreetings = [];
}

function OnBoot()
{
	Save.Data.TotalBoots += 1;
	return "\1\s[-1]\0\s[0]" + BootTalk();
}

function OnClose()
{
	return CloseTalk() + "\_w[1000]\-";
}


//—————————————————————————————— Recreated YAYA functions ——————————————————————————————
//This is a ghost ported from YAYA... and it turns out that YAYA has a bunch of functions that make things easy for me that I didn't account for! So here's where I'm going to recreate those as needed...
//Well, more or less recreate. Some of it I really can't, but usually just the really fiddly super specific stuff

function OnNotifySelfInfo
{
	CurrentBalloonName = Shiori.Reference[5];
}

function OnBalloonChange
{
	CurrentBalloonName = Shiori.Reference[0];
}

function CanTalk
{
	if (Shiori["talking"] || Shiori["choosing"] || Shiori["minimizing"] || Shiori["timecritical"])
	{
		return 0;
	}
	else
	{
		return 1;
	}
}