local fate_card_list = {
"fate_card",
"blank_card",
"kolmi",
"the_hanged_man",
"the_magician",
"the_moon",
"the_fool",
"the_empress",
"the_hierophant",
"the_lovers",
"the_hermit",
"pit_boss",
"monolith",

}

local fate_card_golden_list = {
"fate_card",
"the_hanged_man",
"the_magician",
"the_moon",
"the_fool",
"the_empress",
"the_hierophant",
"the_lovers",

}

--- Spawn a fate card at the specified position in the world. If Gold is true, will spawn the associated golden variant if
---@param card string
---@param x number
---@param y number
---@param gold boolean
function spawn_fate_card(card,x,y,gold)
	if gold == true then
		local card = "mods/abyssal_glare/files/entities/items/fate_cards/gold/"..card..".xml"
		EntityLoad(card, x, y)
	else
		local card = "mods/abyssal_glare/files/entities/items/fate_cards/"..card..".xml"
		EntityLoad(card, x, y)
	end
end

function spawn_random_fate_card(x,y)
		SetRandomSeed(x,y)
	local golden = Random(0,1000)
	local randcardgold = fate_card_golden_list[Random(1,#fate_card_golden_list)]
	local randcard = fate_card_list[Random(1,#fate_card_list)]
		--print("Gold Card Rolled:"..randcardgold)
		--print("Card Rolled:"..randcard)
	if golden == 1000 then
		local card = EntityLoad("mods/abyssal_glare/files/entities/items/fate_cards/gold/"..randcardgold..".xml", x, y)
	else
		local card = EntityLoad("mods/abyssal_glare/files/entities/items/fate_cards/"..randcard..".xml", x, y)
	end
	
end
