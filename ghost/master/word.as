function smoke(surface)
{
	//I think this probably....... isn't correct lol. TODO find out how to check for an empty variable
	if (surface.IsNull())
	{
		surface = 0;
	}
	
	output = "";
	output += "\s[12]\_w[1500]";
	output += "\s[{surface}13]\_w[2000]";
	output += "\s[{surface}14]\i[50,wait]\_w[500]\s[{surface}13]";
	
	return output;
}

function overthere
{
	return Random.Select([
		"up on the hill",
		"by the shopping mall",
		"at the edge of town",
		"across the street from the abandoned mill",
		"next to the burned down plaza",
		"next to the creek",
		"at the bottom of the hill",
		"over that little gulley where rain likes to gather",
		"right smack dab in the middle of the floodplain",
		"in literally the worst corner of town",
		"right where they built the last one\w4—you know, the one that got hit by lightning and burned down",
		"on top of where the park was"
	]);
}

function closeshave
{
	return Random.Select([
		"slipped on an invisible patch of ice and broke every bone in his back",
		"walked up to a door at the exact moment someone pushed it open at full force, sending him tumbling back down the stairs",
		"tripped on a rock and tumbled into the river",
		"misjudged the amount of stairs and fell on the landing while carrying a heavy box",
		"stepped right into a bear trap",
		"had an unexpected bear encounter",
		"ran face first into a hornet nest",
		"didn't see the stairs until he had already fallen all the way to the bottom",
		"discovered how far humans can fall and still survive somehow",
		"\c[char,1]... \w8\w8\s[211]Well. I won't go into detail",
		"got to know some machinery up close and personal"
	]);
}

function weirdinvention
{
	//TODO ask about escaping quotes...
	return Random.Select([
		'"anti finger-crumbs" bowl',
		"windshield wiper for a watch",
		"single-eye sunglasses",
		"hair unbraider",
		'"guaranteed spider-free" facial wipes',
		"pasta mixer, as in mixing different kinds of already-cooked pasta,",
		"acorn de-sheller",
		"pizza fork for eating pizza specifically",
		"spaghetti knotter",
		"garlic bread press",
		"candy strainer",
		"food un-coloring device",
		"cook book that's actually a joke book in disguise",
		"ultimate spice blend made of all known spices"
	]);
}