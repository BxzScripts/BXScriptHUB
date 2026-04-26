local UIController = {}
UIController.__index = UIController

local player = game.Players.LocalPlayer

function UIController.new()
	local self = setmetatable({}, UIController)

	local gui = Instance.new("ScreenGui")
	gui.Parent = player:WaitForChild("PlayerGui")

	local circle = Instance.new("Frame")
	circle.Size = UDim2.new(0,240,0,240)
	circle.Position = UDim2.new(0.5,-120,0.5,-120)
	circle.BackgroundTransparency = 0.5
	circle.BackgroundColor3 = Color3.fromRGB(255,255,255)
	circle.Parent = gui

	local nameLabel = Instance.new("TextLabel")
	nameLabel.Size = UDim2.new(0,200,0,30)
	nameLabel.Position = UDim2.new(0.5,-100,0.5,-150)
	nameLabel.BackgroundTransparency = 1
	nameLabel.TextColor3 = Color3.new(1,1,1)
	nameLabel.Text = ""
	nameLabel.Parent = gui

	self.Circle = circle
	self.NameLabel = nameLabel

	return self
end

function UIController:UpdateTarget(player)
	if player then
		self.NameLabel.Text = player.Name
	end
end

function UIController:ClearTarget()
	self.NameLabel.Text = ""
end

return UIController
