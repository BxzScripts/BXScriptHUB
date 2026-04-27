local UIController = {}
UIController.__index = UIController

local player = game.Players.LocalPlayer

function UIController.new()
	local self = setmetatable({}, UIController)

	local gui = Instance.new("ScreenGui")
	gui.Name = "AimUI"
	gui.Parent = player:WaitForChild("PlayerGui")

	local circle = Instance.new("Frame")
	circle.Size = UDim2.new(0,240,0,240)
	circle.Position = UDim2.new(0.5,-120,0.5,-120)
	circle.BackgroundTransparency = 0.7
	circle.BackgroundColor3 = Color3.fromRGB(255,255,255)
	circle.Parent = gui

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(1,0)
	corner.Parent = circle

	local crosshair = Instance.new("TextLabel")
	crosshair.Size = UDim2.new(0,30,0,30)
	crosshair.Position = UDim2.new(0.5,-15,0.5,-15)
	crosshair.BackgroundTransparency = 1
	crosshair.Text = "+"
	crosshair.TextColor3 = Color3.new(1,0,0)
	crosshair.TextScaled = true
	crosshair.Parent = gui

	local nameLabel = Instance.new("TextLabel")
	nameLabel.Size = UDim2.new(0,200,0,30)
	nameLabel.Position = UDim2.new(0.5,-100,0.5,-150)
	nameLabel.BackgroundTransparency = 1
	nameLabel.TextColor3 = Color3.new(1,1,1)
	nameLabel.Text = ""
	nameLabel.Parent = gui

	local invLabel = Instance.new("TextLabel")
	invLabel.Size = UDim2.new(0,200,0,30)
	invLabel.Position = UDim2.new(0.5,-100,0.5,-120)
	invLabel.BackgroundTransparency = 1
	invLabel.TextColor3 = Color3.new(1,1,1)
	invLabel.Text = ""
	invLabel.Parent = gui

	self.Circle = circle
	self.Crosshair = crosshair
	self.NameLabel = nameLabel
	self.InvLabel = invLabel

	return self
end

function UIController:UpdateTarget(player)
	if player then
		self.NameLabel.Text = player.Name
		local backpack = player:FindFirstChild("Backpack")
		if backpack then
			local items = {}
			for _, tool in pairs(backpack:GetChildren()) do
				table.insert(items, tool.Name)
			end
			self.InvLabel.Text = table.concat(items, ", ")
		end
	end
end

function UIController:ClearTarget()
	self.NameLabel.Text = ""
	self.InvLabel.Text = ""
end

return UIController
