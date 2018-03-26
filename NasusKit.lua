if GetObjectName(GetMyHero()) ~= "Nasus" then return end

local version = "0.1"

function AutoUpdate(data)
    if tonumber(data) > tonumber(version) then
        print("New version found! " .. data)
        print("Downloading update, please wait...")
        DownloadFileAsync("https://raw.githubusercontent.com/JuanScripting/LoLScripts/master/VeigarInitiative.lua", SCRIPT_PATH .. "VeigarInitiative.lua", function() print("Update Complete, please 2x F6!") return end)
    end
end

GetWebResultAsync("https://raw.githubusercontent.com/JuanScripting/LoLScripts/master/Version/VeigarInitiative.version", AutoUpdate)

print ("Nasus Kit v." .. version .. " Script Loaded")
require ("OpenPredict")
require ("DamageLib")

local SorakaMenu = Menu("Nasus", "Nasus")
NasusMenu:SubMenu("Config", "Options")
NasusMenu.Config:Boolean("showKilleable", "Show Combo for kill", true)
NasusMenu.Config:Boolean("showFarm", "Show Q Farm", true)
Nasus.SubMenu("Harass", "Harass Skills")
NasusMenu.Harass:Boolean("Q", "Use Q", true)
NasusMenu.Harass:Boolean("W", "Use W", false)
NasusMenu.Harass:Boolean("E", "Use E", true)

local Spells = {
Q = {range = 125, delay = 0.25, speed 5000, width = 30}
W = {range = 600, delay = 0.25, speed = 5000, width = 30}
E = {range = 650, delay = 0.25, speed = 5000, width = 400}
}

function getMode()
if _G.IOW_Loaded and IOW:Mode() then
return IOW:Mode()

	elseif _G.PW_Loaded and PW:Mode() then
		return PW:Mode()
	elseif _G.DAC_Loaded and DAC:Mode() then
		return DAC:Mode()
	elseif _G.AutoCarry_Loaded and DACR:Mode() then
		return DACR:Mode()
	elseif _G.SLW_Loaded and SLW:Mode() then
		return SLW:Mode()
	end
end

OnTick(function()
	target = GetCurrentTarget()
	
	OnTick(function()
	target = GetCurrentTarget()
	
	if NasusMenu.Config.showKilleable:Value() then
		SHOW_KILLEABLE_COMBO()
		Combo()
	end
	if NasusMenu.Config.showFarm:Value() then
		ShowFarm()
	end
	
	Harass()
end)

function function NasusE(enemy)
	if Ready(_E) and ValidTarget(enemy, Spells.E.range) then
		local EPred = GetPrediction(enemy, Spells.E)
		if EPred.hitChance > 0.3 then
			CastSkillShot(_E, EPred.castPos)
			return true
		end
	end
	return false
end   

function NasusQ(enemy)
	if Ready(_Q) and ValidTarget(enemy, Spells.Q.range) then
		CastTargetSpell(enemy, _Q)
		end
end
function ShowFarm()
	for _, minion in pairs(minionManager.objects) do
		if GetTeam(minion) ~= MINION_ALLY then
			if ValidTarget(minion, 1500) then
				if GetCurrentHP(minion) < getdmg("AA", minion, myHero) then
					DrawCircle(GetOrigin(minion), 50, 3, 8, GoS.Cyan)
				else
					if GetCurrentHP(minion) < getdmg("Q", minion, myHero) then
						DrawCircle(GetOrigin(minion), 50, 2, 8, GoS.Green)
					end
				end
			end
		end
	end
end