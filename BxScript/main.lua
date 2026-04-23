local base = "https://raw.githubusercontent.com/SEU_USER/BxScript/main/"

local function loadModule(path)
	local code = game:HttpGet(base .. path)
	return loadstring(code)()
end

local UI = loadModule("modules/ui/ui.lua")
local Movement = loadModule("modules/movement/movement.lua")

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
