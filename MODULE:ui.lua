local UI = {}

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))

function UI:Init()
	self.Frame = Instance.new("Frame", gui)
	self.Frame.Size = UDim2.new(0,300,0,400)
	self.Frame.Position = UDim2.new(0.5,-150,0.5,-200)
end

function UI:AddToggle(nome, callback)
	local b = Instance.new("TextButton", self.Frame)
	b.Size = UDim2.new(1,0,0,40)
	b.Text = nome.." OFF"
	
	local state = false
	b.MouseButton1Click:Connect(function()
		state = not state
		b.Text = nome.." "..(state and "ON" or "OFF")
		callback(state)
	end)
end

function UI:AddSlider(nome, min, max, callback)
	local b = Instance.new("TextButton", self.Frame)
	b.Size = UDim2.new(1,0,0,40)
	b.Text = nome
	
	b.MouseButton1Click:Connect(function()
		local val = math.random(min, max)
		callback(val)
	end)
end

return UI
