for k,v in pairs(data.raw["bool-setting"]) do
	if v.default_value ~= nil then
		v.localised_description = {"noxys-extrasettingsinfo.merge", {"mod-setting-description." .. v.name}, "\n\n" .. "Default: " .. tostring(v.default_value) .. "."}
	end
end
for _,s in pairs{"int-setting", "double-setting"} do
	for k,v in pairs(data.raw[s]) do
		local t = {}
		if v.minimum_value ~= nil  then
			table.insert(t, "Min: " .. v.minimum_value)
		end
		if v.default_value ~= nil  then
			table.insert(t, "Default: " .. v.default_value)
		end
		if v.maximum_value ~= nil  then
			table.insert(t, "Max: " .. v.maximum_value)
		end
		if #t then
			v.localised_description = {"noxys-extrasettingsinfo.merge", {"mod-setting-description." .. v.name}, "\n\n" .. table.concat(t, " ") .. "."}
		end
	end
end
for k,v in pairs(data.raw["string-setting"]) do
	local t = {}
	if v.default_value ~= nil  then
		table.insert(t, "Default: \"" .. v.default_value .. "\"")
	end
	if v.allow_blank == true then
		table.insert(t, "Allows blank")
	elseif v.allow_blank == false then
		table.insert(t, "Disallows blank")
	end
	if #t then
		v.localised_description = {"noxys-extrasettingsinfo.merge", {"mod-setting-description." .. v.name}, "\n\n" .. table.concat(t, ", ") .. "."}
	end
end
