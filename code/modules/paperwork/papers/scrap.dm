/obj/item/paper/bsmith
	info = "It's easy to smith. Put ores in the smelter. Put ingots on the anvil. Use your tongs to handle ingots. Hit them with the hammer. Quench hot ingots in the barrel (there must be water in it). Steel is an alloy from iron and coal, find the golden ratio"

/obj/item/paper/heartfelt/Initialize()
	var/static/list/info = list(
		"Negotiate trade agreements with merchants in Osseus to facilitate the exchange of goods and resources between the two realms.",
		"Explore the mysteries of peninsula of Osseus, uncovering its secrets and hidden treasures.",
		"Establish a diplomatic alliance with the Monarch of Osseus to strengthen the relationship between Heartfelt and Osseus.",
		"Our lands have long been forsaken by Dendor, Our fields are failing and the famine is causing unrest in our realm. Seek royal largesse",
	)
	src.info = pick(info)
	return ..()
