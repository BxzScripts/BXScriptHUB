local Aim = {}

local running = false

function Aim:Start(loadModule)
	if running then return end
	running = true

	local Config = loadModule("modules/visual/config.lua")
	local UIController = loadModule("modules/visual/ui_controller.lua")
	local TargetDetector = loadModule("modules/visual/target_detector.lua")

	local ui = UIController.new()
	local detector = TargetDetector.new(ui)

	game:GetService("RunService").RenderStepped:Connect(function()
		if running then
			detector:Update(Config.FOV.Radius)
		end
	end)
end

function Aim:Stop()
	running = false
end

return Aim
