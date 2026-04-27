local base = "https://raw.githubusercontent.com/BxzScripts/BXScriptHUB/main/BxScript/"

local function loadModule(path)
	local success, code = pcall(function()
		return game:HttpGet(base .. path)
	end)
	if not success then return nil end

	local func = loadstring(code)
	if not func then return nil end

	local ok, module = pcall(func)
	if not ok then return nil end

	return module
end

local UI = loadModule("modules/ui/ui.lua")
local Movement = loadModule("modules/movement/movement.lua")
local Aim = loadModule("modules/visual/aim.lua")

if not UI then return end
if not Movement then return end
if not Aim then return end

UI:Init()

UI:AddToggle("Fly", function(v)
	Movement:Fly(v)
end)

UI:AddSlider("Speed", 16, 100, function(v)
	Movement:SetSpeed(v)
end)

UI:AddSlider("Jump", 50, 200, function(v)
	Movement:SetJump(v)
end)

UI:AddToggle("Aim", function(v)
	if v then
		Aim:Start(loadModule)
	else
		Aim:Stop()
	end
end)
