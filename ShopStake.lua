--- STEAMODDED HEADER
--- MOD_NAME: Add +1 Shop to Stakes
--- MOD_ID: ShopStake
--- MOD_AUTHOR: [Encarvlucas]
--- MOD_DESCRIPTION: Adds Overstock Voucher (+1 Shop) to all runs at Blue Stakes or higher

----------------------------------------------
------------MOD CODE -------------------------

local Backapply_to_runRef_stake = Back.apply_to_run
-- Function used to apply new Deck effects
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