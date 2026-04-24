local base = "https://raw.githubusercontent.com/BxzScripts/BXScriptHUB/main/BxScript/"

local function loadModule(path)
	local success, code = pcall(function()
		return game:HttpGet(base .. path)
	end)

	if not success then
		warn("Erro ao baixar:", path)
		return nil
	end

	local func = loadstring(code)
	if not func then
		warn("Erro ao compilar:", path)
		return nil
	end

	local ok, module = pcall(func)
	if not ok then
		warn("Erro ao executar:", path, module)
		return nil
	end

	return module
end

local UI = loadModule("modules/ui/ui.lua")
local Movement = loadModule("modules/movement/movement.lua")

if not UI then
	warn("UI não carregou")
	return
end

if not Movement then
	warn("Movement não carregou")
	return
end

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
