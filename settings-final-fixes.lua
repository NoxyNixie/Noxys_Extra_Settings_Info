if mods["factorio_cross_mod"] then return end

if data.raw["bool-setting"] then
	for _,v in pairs(data.raw["bool-setting"]) do
		if v.default_value ~= nil then
			v.localised_description = {"noxys-extrasettingsinfo.merge", {"mod-setting-description." .. v.name}, {"noxys-extrasettingsinfo.merge5", "\n\n", {"noxys-extrasettingsinfo.default"}, ": ", tostring(v.default_value), "."}}
		end
	end
end
for _,s in pairs{"int-setting", "double-setting"} do
	if data.raw[s] then
		for _,v in pairs(data.raw[s]) do
			if v.minimum_value ~= nil or v.minimum_value ~= nil or v.minimum_value ~= nil then
				local t = {"noxys-extrasettingsinfo.merge", {"mod-setting-description." .. v.name}, "\n\n"}
				local comma = false
				if v.minimum_value ~= nil  then
					t = {"noxys-extrasettingsinfo.merge4", t, {"noxys-extrasettingsinfo.minimum"}, ": ", tostring(v.minimum_value)}
					comma = true
				end
				if v.default_value ~= nil  then
					if comma then
						t = {"noxys-extrasettingsinfo.merge", t, ", "}
					end
					t = {"noxys-extrasettingsinfo.merge4", t, {"noxys-extrasettingsinfo.default"}, ": ", tostring(v.default_value)}
					comma = true
				end
				if v.maximum_value ~= nil  then
					if comma then
						t = {"noxys-extrasettingsinfo.merge", t, ", "}
					end
					t = {"noxys-extrasettingsinfo.merge4", t, {"noxys-extrasettingsinfo.maximum"}, ": ", tostring(v.maximum_value)}
				end
				v.localised_description = {"noxys-extrasettingsinfo.merge", t, "."}
			end
		end
	end
end
if data.raw["string-setting"] then
	for _,v in pairs(data.raw["string-setting"]) do
		if v.default_value ~= nil or v.allow_blank ~= nil then
			local t = {"noxys-extrasettingsinfo.merge", {"mod-setting-description." .. v.name}, "\n\n"}
			if v.default_value ~= nil  then
				t = {"noxys-extrasettingsinfo.merge5", t, {"noxys-extrasettingsinfo.default"}, ": \"", tostring(v.default_value), "\" "}
			end
			if v.allow_blank == true then
				t = {"noxys-extrasettingsinfo.merge", t, {"noxys-extrasettingsinfo.blanks"}}
			elseif v.allow_blank == false then
				t = {"noxys-extrasettingsinfo.merge", t, {"noxys-extrasettingsinfo.noblanks"}}
			end
			v.localised_description = {"noxys-extrasettingsinfo.merge", t, "."}
		end
	end
end