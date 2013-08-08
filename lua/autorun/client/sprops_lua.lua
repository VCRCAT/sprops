if SERVER then return end

timer.Simple(120, function()
	/* Check for spawnlists. */
	local lists = file.Find("settings/spawnlist/*-sprops.txt", "garrysmod")
	if #lists == 0 then
		notification.AddLegacy("SProps spawnlists were not installed correctly.", NOTIFY_HINT, 10)
	elseif #lists == 2 then
		notification.AddLegacy("Duplicate SProps spawnlists found, remember to remove the old ones!", NOTIFY_HINT, 10)
	end
	
	/* Check client revision. */
	http.Fetch("http://shadowscions-construction-props.googlecode.com/svn/", function(contents)
		if file.Exists("data/sprops_version.txt", "GAME") then
			local client = tonumber(file.Read("data/sprops_version.txt", "GAME"))
			local svn = tonumber(string.match(contents, "Revision ([0-9]+)"))
			
			if svn and client < svn then
				notification.AddLegacy("SProps is out of date!", NOTIFY_HINT, 10)
			end
		end
	end)
end)
