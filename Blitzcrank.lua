if GetObjectName(GetMyHero()) ~= "Blitzcrank" then return end
local version = "0.1"
if tonumber(data) > tonumber(version) then
        print("New version found! " .. data)
        print("Downloading update, please wait...")
        DownloadFileAsync("https://raw.githubusercontent.com/JuanScripting/LoLScripts/master/VeigarInitiative.lua", SCRIPT_PATH .. "VeigarInitiative.lua", function() print("Update Complete, please 2x F6!") return end)
    end
end
end