if SERVER then return end

local c_hash = string.Left( file.Read( ".git/FETCH_HEAD", "GAME" ), 40 )
local fetch_url = "https://api.github.com/repos/shadowscion/sprops/commits?per_page=1"
local fetch_reg = "\"sha\":\"(%w+)\","

timer.Simple( 1, function()
	-- Spawnlist Check
	local c_lists = file.Find( "settings/spawnlist/*-sprops.txt", "garrysmod" )
	if #c_lists == 0 then
		chat.AddText( Color(225,225,255), "SProps spawnlists were not installed correctly!" )
	end

	-- Update Check
	http.Fetch( fetch_url, function( fetch_str )
		local g_hash = string.match( fetch_str, fetch_reg )
		if c_hash != g_hash then
			chat.AddText( Color(225,225,255), "SProps is either out of date, or not installed!" )
		end
	end)
end)
