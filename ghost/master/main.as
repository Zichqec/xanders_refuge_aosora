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

//SHIORIロード後
function OnAosoraLoad
{
	//ランダムトークの設定
	TalkTimer.RandomTalk = Reflection.Get("RandomTalk");
	TalkTimer.RandomTalkIntervalSeconds = Save.Data.TalkInterval;
}

//喋り間隔の設定
function SetTalkInterval(intervalSeconds)
{
	//間隔を設定して、待ち時間をリセット
	TalkTimer.RandomTalkIntervalSeconds = intervalSeconds;
	TalkTimer.RandomTalkElapsedSeconds = 0;
	Save.Data.TalkInterval = intervalSeconds;
}

//選択肢
function OnChoiceSelect{
	return Reflection.Get(Shiori.Reference[0]);
}

function OnBoot()
{
	//少しウェイトをいれてやる
	Save.Data.TotalBoots += 1;
	return "\1\s[-1]\0\s[0]" + BootTalk();
}

function OnClose()
{
	//少しウェイトをいれてやる
	return CloseTalk() + "\_w[1000]\-";
}



//—————————————————————————————— Recreated YAYA functions ——————————————————————————————
//This is a ghost ported from YAYA... and it turns out that YAYA has a bunch of functions that make things easy for me that I didn't account for! So here's where I'm going to recreate those as needed...
//Well, more or less recreate. I can't recreate the whole SHIORI3EV thing here because AFAIK I do not have access to EVAL (nor do I want it, honestly)

function OnNotifySelfInfo
{
	CurrentBalloonName = Shiori.Reference[5];
}

function OnBalloonChange
{
	CurrentBalloonName = Shiori.Reference[0];
}