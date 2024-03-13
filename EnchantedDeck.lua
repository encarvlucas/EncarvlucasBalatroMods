--- STEAMODDED HEADER
--- MOD_NAME: Enchanted Deck
--- MOD_ID: EnchantedDeck
--- MOD_AUTHOR: [Encarvlucas]
--- MOD_DESCRIPTION: Start the game with some of your cards already be enhanced!

----------------------------------------------
------------MOD CODE -------------------------

function randomSelect(table)
	if #table == 0 then
			return nil -- Table is empty
	end
	local randomIndex = math.random(1, #table)
	return table[randomIndex]
end

local Backapply_to_runRef = Back.apply_to_run
function Back.apply_to_run(arg)
	Backapply_to_runRef(arg)

	if arg.effect.config.enchanted then
		G.E_MANAGER:add_event(Event({
			func = function()
				local trandom_m = {
					G.P_CENTERS.m_stone,
					G.P_CENTERS.m_steel,
					G.P_CENTERS.m_glass,
					G.P_CENTERS.m_gold,
					G.P_CENTERS.m_bonus,
					G.P_CENTERS.m_mult,
					G.P_CENTERS.m_wild,
					G.P_CENTERS.m_lucky,
				}
				local trandom_e = {
					{foil = true},
					{holo = true},
					{polychrome = true},
				}
				local trandom_g = {
					"Red",
					"Blue",
					"Gold",
					"Purple",
				}
				for iter = #G.playing_cards, 1, -1 do
					-- Chance to apply modifications 
					-- 15% to have one of the enhancements
					if math.random(100) <= 15 then  
						local random_m = randomSelect(trandom_m)
						G.playing_cards[iter]:set_ability(random_m)
					end

					-- 5% to have one of the editions
					if math.random(100) <= 5 then  
						local random_e = randomSelect(trandom_e)
						G.playing_cards[iter]:set_edition(random_e, true, true)
					end

					-- 5% to have one of the seals
					if math.random(100) <= 5 then  
						local random_g = randomSelect(trandom_g)
						G.playing_cards[iter]:set_seal(random_g, true, true)
					end
				end

				return true
			end
		}))
	end
end

function SMODS.INIT.EnchantedDeck()
	local loc_def = {
		["name"]="Enchanted Deck",
		["text"]={
			[1]="Start with a Deck",
			[2]="with some cards",
			[3]="already {C:attention}Enhanced{}"
		},
	}

	local absolute = SMODS.Deck:new("Enchanted Deck", "enchanted", {enchanted = true}, {x = 5, y = 2}, loc_def)
	absolute:register()
end

----------------------------------------------
------------MOD CODE END----------------------
