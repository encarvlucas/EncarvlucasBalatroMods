--- STEAMODDED HEADER
--- MOD_NAME: Add +1 Shop to Every Run
--- MOD_ID: PermanentOverstockMod
--- MOD_AUTHOR: [Encarvlucas]
--- MOD_DESCRIPTION: Adds Overstock Voucher (+1 card slot in Shop) to all runs

----------------------------------------------
------------MOD CODE -------------------------

local Backapply_to_runRef_permanent = Back.apply_to_run
-- Function used to apply new effects to runs
function Back.apply_to_run(arg)
	Backapply_to_runRef_permanent(arg)
    
    local applied_voucher = 'v_overstock_norm'
    G.GAME.used_vouchers[applied_voucher] = true
    Card.apply_to_run(nil, G.P_CENTERS[applied_voucher])
end

----------------------------------------------
------------MOD CODE END----------------------