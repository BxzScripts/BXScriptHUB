local TargetDetector = {}
TargetDetector.__index = TargetDetector

local Players = game:GetService("Players")
local Camera = workspace.CurrentCamera

function TargetDetector.new(ui)
	local self = setmetatable({}, TargetDetector)
	self.UI = ui
	return self
end

function TargetDetector:GetClosestPlayer(radius)
	local closest = nil
	local shortest = radius

	for _, plr in pairs(Players:GetPlayers()) do
		if plr ~= Players.LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") then
			local pos, visible = Camera:WorldToViewportPoint(plr.Character.Head.Position)

			if visible then
				local dist = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude

				if dist < shortest then
					shortest = dist
					closest = plr
				end
			end
		end
	end

	return closest
end

function TargetDetector:Update(radius)
	local target = self:GetClosestPlayer(radius)

	if target then
		self.UI:UpdateTarget(target)
	else
		self.UI:ClearTarget()
	end
end

return TargetDetector
