local UI = {}

local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "BxScriptPRO"
gui.Parent = player:WaitForChild("PlayerGui")

function UI:Init()

	local open = Instance.new("TextButton", gui)
	open.Size = UDim2.new(0,120,0,40)
	open.Position = UDim2.new(0,10,0,10)
	open.Text = "Bx Script"
	open.BackgroundColor3 = Color3.fromRGB(20,20,20)
	open.TextColor3 = Color3.new(1,1,1)

	local frame = Instance.new("Frame", gui)
	frame.Size = UDim2.new(0,0,0,0)
	frame.Position = UDim2.new(0.5,0,0.5,0)
	frame.AnchorPoint = Vector2.new(0.5,0.5)
	frame.BackgroundColor3 = Color3.fromRGB(15,15,15)
	frame.Visible = false
	frame.Active = true
	frame.Draggable = true

	local top = Instance.new("Frame", frame)
	top.Size = UDim2.new(1,0,0,40)
	top.BackgroundColor3 = Color3.fromRGB(25,25,25)

	local title = Instance.new("TextLabel", top)
	title.Size = UDim2.new(1,0,1,0)
	title.Text = "Bx Script PRO"
	title.TextColor3 = Color3.new(1,1,1)
	title.BackgroundTransparency = 1

	local close = Instance.new("TextButton", top)
	close.Size = UDim2.new(0,40,1,0)
	close.Position = UDim2.new(1,-40,0,0)
	close.Text = "X"
	close.BackgroundColor3 = Color3.fromRGB(150,0,0)
	close.TextColor3 = Color3.new(1,1,1)

	local container = Instance.new("Frame", frame)
	container.Size = UDim2.new(1,0,1,-40)
	container.Position = UDim2.new(0,0,0,40)
	container.BackgroundTransparency = 1

	self.Container = container

	local layout = Instance.new("UIListLayout", container)
	layout.Padding = UDim.new(0,5)

	local function abrir()
		frame.Visible = true
		TweenService:Create(frame, TweenInfo.new(0.3), {
			Size = UDim2.new(0,320,0,420)
		}):Play()
	end

	local function fechar()
		local t = TweenService:Create(frame, TweenInfo.new(0.3), {
			Size = UDim2.new(0,0,0,0)
		})
		t:Play()
		t.Completed:Wait()
		frame.Visible = false
	end

	open.MouseButton1Click:Connect(abrir)
	close.MouseButton1Click:Connect(fechar)

end

function UI:AddToggle(nome, callback)
	local b = Instance.new("TextButton", self.Container)
	b.Size = UDim2.new(1,-10,0,45)
	b.BackgroundColor3 = Color3.fromRGB(30,30,30)
	b.TextColor3 = Color3.new(1,1,1)
	b.Text = nome.." OFF"

	local state = false

	b.MouseButton1Click:Connect(function()
		state = not state
		b.Text = nome.." "..(state and "ON" or "OFF")

		TweenService:Create(b, TweenInfo.new(0.2), {
			BackgroundColor3 = state and Color3.fromRGB(0,170,0) or Color3.fromRGB(30,30,30)
		}):Play()

		callback(state)
	end)
end

function UI:AddSlider(nome, min, max, callback)
	local b = Instance.new("TextButton", self.Container)
	b.Size = UDim2.new(1,-10,0,45)
	b.BackgroundColor3 = Color3.fromRGB(30,30,30)
	b.TextColor3 = Color3.new(1,1,1)
	b.Text = nome..": "..min

	local valor = min

	b.MouseButton1Click:Connect(function()
		valor = valor + 5
		if valor > max then valor = min end
		b.Text = nome..": "..valor
		callback(valor)
	end)
end

return UI
