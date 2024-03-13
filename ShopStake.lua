--- STEAMODDED HEADER
--- MOD_NAME: Add +1 Shop to Stakes
--- MOD_ID: ShopStakeMod
--- MOD_AUTHOR: [Encarvlucas]
--- MOD_DESCRIPTION: Adds Overstock Voucher (+1 card slot in Shop) to all runs at Blue Stakes or higher

----------------------------------------------
------------MOD CODE -------------------------

local MOD_ID = "ShopStakeMod";

function SMODS.INIT.ShopStakeMod()
    -- Changing description to add mod information
    G.localization.descriptions["Stake"]["stake_blue"] = {
        name = "Blue Stake",
        text = {
            "{C:red}-1{} Discard",
            "Starts with {C:attention,T:v_overstock_norm}Overstock{}",
            "{s:0.8}Applies all previous Stakes"
        }
    }
end

local Backapply_to_runRef_stake = Back.apply_to_run
-- Function used to apply new effects to runs
function Back.apply_to_run(arg)
	Backapply_to_runRef_stake(arg)
    
    local applied_voucher = 'v_overstock_norm'
    if G.GAME.stake >= 5 then
        G.GAME.used_vouchers[applied_voucher] = true
        Card.apply_to_run(nil, G.P_CENTERS[applied_voucher])
    end
end

----------------------------------------------
------------MOD CODE END----------------------