//This file handles a couple little QOL functions you may want, as well as default text for some events since SSP doesn't provide defaults. But these are not necessary! If you don't care for them just erase them. If you don't want to set up network updates, you can comment or remove the update functions too. If you're not interested in any of these, just remove the whole file!
//If you are interested in expanding on these events, I've included links to their documentation in ukadoc for easy reference

//—————————————————————————————— Installing something ——————————————————————————————
//https://ukagakadreamteam.github.io/ukadoc/manual/list_shiori_event.html#OnInstallBegin

function OnInstallComplete
{
	local output = "";
	
	output += "\0\i[10]Installed {Shiori.Reference[1]} ({Shiori.Reference[0]}).";
	
	//A little menu to open or change to the ghost that was installed immediately
	if (!Shiori.Reference[0].IndexOf("ghost").IsNull())
	{
		output += "\n\n\_q";
		output += "\![*]\__q[OnInstallComplete@Action,call]Call {Shiori.Reference[1]}\__q  \![*]\__q[OnInstallComplete@Action,change]Change to {Shiori.Reference[1]}\__q\n\n";
		output += "\![*]\q[Thanks,blank]";
	}
	
	return output;
}

function OnInstallComplete@Action
{
	if (Shiori.Reference[0] == "change")
	{
		return "\![change,ghost,lastinstalled]";
	}
	else //call
	{
		return "\![call,ghost,lastinstalled]";
	}
}

function OnInstallFailure
{
	local reason = Shiori.Reference[0];
	
	if (Shiori.Reference[0] == "unlha32")
	{
		reason = "could not load the dll to decompress lzh files";
	}
	else if (Shiori.Reference[0] == "extraction")
	{
		reason = "failed to decompress the file";
	}
	else if (Shiori.Reference[0] == "invalid type")
	{
		reason = "the install.txt is incorrect";
	}
	else if (Shiori.Reference[0] == "unsupported")
	{
		reason = "the archive is not supported";
	}
	else if (Shiori.Reference[0] == "password")
	{
		reason = "incorrect password";
	}
	else if (Shiori.Reference[0] == "artificial")
	{
		reason = "canceled by user";
	}
	
	return "\0\i[10]Could not complete installation: {reason}.";
}


//—————————————————————————————— Creating a .nar file ——————————————————————————————
//https://ukagakadreamteam.github.io/ukadoc/manual/list_shiori_event.html#OnNarCreating

function OnNarCreated
{
	//Makes a clickable link that'll open the location of the file they just made
	local nar = `\_a[OnNarLocation,"{Shiori.Reference[1]}"]{Shiori.Reference[0]}\_a`;
	
	return "\0\i[10]Successfully created {nar}.";
}

function OnNarLocation
{
	return "\![open,explorer," + '"' + Shiori.Reference[0] + '"' + "]";
}


//—————————————————————————————— Network Update ——————————————————————————————
//https://ukagakadreamteam.github.io/ukadoc/manual/list_shiori_event.html#OnUpdateBegin

function OnUpdateBegin
{
	return "\0\i[10]Checking for updates.\w8";
}

//reference0 is the number of new files, starting from 0
function OnUpdateReady
{
	//Number of files starts from 0, so this displays the correct amount
	local newfiles = Shiori.Reference[0];
	newfiles = newfiles.ToNumber();
	newfiles += 1;
	
	//plural checks, adds an s and changes is to are if there's more than 1 file
	local s = "";
	local are = "";
	if (newfiles != 1)
	{
		s = "s";
		are = "are";
	}
	
	return "\0\i[10]There {are} {newfiles} new file{s}.\w8";
}

//When the update finishes. Don't forget to initialize any new variables you've created! I highly highly recommend using OnInitialize for this (it's in boot.dic), in case the user updates via the ghost explorer or some other means.
//reference0 is 'none' if there were no new files to update with
function OnUpdateComplete
{
	if (Shiori.Reference[0] == "none")
	{
		return "\0\i[10]There are no new files.";
	}
	else
	{
		return "\0\i[10]Update complete.";
	}
}

function OnUpdateFailure
{
	//TODO idk how to do SPLITPATH here...
	//Need to do a normal split but first i need to see what the file paths look like. i'm assuming a forward slash, but...
	local badfilepath = Shiori.Reference[0]; //For MD5 errors, this gets the name and extension of the offending file
	badfilepath = badfilepath.Split("/");
	local badfile = badfilepath[badfilepath.length];
	local reason = Shiori.Reference[0];
	
	if (Shiori.Reference[0] == "timeout")
	{
		reason = "connection timed out";
	}
	else if (Shiori.Reference[0] == "md5 miss")
	{
		reason = "MD5 error on file {badfile}\n\nPlease contact the ghost author for assistance";
	}
	else if (Shiori.Reference[0] == "artificial")
	{
		reason = "canceled by user";
	}
	
	return "\0\i[10]Could not update: {reason}.\n\n{Shiori.Reference[1]}";
}

function test
{
	return "testing network update stuff";
}

//—————————————————————————————— SNTP (clock fixing) ——————————————————————————————
//https://ukagakadreamteam.github.io/ukadoc/manual/list_shiori_event.html#OnSNTPBegin

function OnSNTPCompare
{
	local output = "";
	if (Shiori.Reference[3] != 0)
	{
		local s = "";
		if (Shiori.Reference[3] != 1)
		{
			s = "s";
		}
		
		output += "\0\i[10]The clock is off by {Shiori.Reference[3]} second{s}.\n\n";
		
		output += "\![*]\q[Fix it,script:\6]  \![*]\q[Leave it,blank]";
	}
	else
	{
		output += "\0\i[10]The clock is accurate.";
	}
	
	return output;
}

function OnSNTPCorrect
{
	return "\0\i[10]The clock has been corrected.";
}

function OnSNTPFailure
{
	return "\0\i[10]Could not correct the clock.";
}


//—————————————————————————————— BIFF (Email check) ———————————————————————————————
//https://ukagakadreamteam.github.io/ukadoc/manual/list_shiori_event.html#OnBIFFBegin

function OnBIFFFailure
{
	local reason = Shiori.Reference[0];
	
	if (Shiori.Reference[0] == "timeout")
	{
		reason = "connection timed out";
	}
	else if (Shiori.Reference[0] == "kick")
	{
		reason = "can't access account";
	}
	else if (Shiori.Reference[0] == "defect")
	{
		reason = "POP settings incorrect";
	}
	else if (Shiori.Reference[0] == "artificial")
	{
		reason = "canceled by user";
	}

	return "\0\i[10]Could not get emails: {reason}.";
}


//———————————————————————————————— Headlines/RSS ——————————————————————————————————
//https://ukagakadreamteam.github.io/ukadoc/manual/list_shiori_event.html#OnHeadlinesenseBegin

function OnHeadlinesenseFailure
{
	local reason = Shiori.Reference[0];
	
	if (Shiori.Reference[0] == "can't download")
	{
		reason = "can't download the file";
	}
	else if (Shiori.Reference[0] == "can't analyze")
	{
		reason = "can't analyze the file";
	}

	return "\0\i[10]Could not get RSS: {reason}.";
}