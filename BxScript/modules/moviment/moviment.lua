local Movement = {}

local player = game.Players.LocalPlayer

function Movement:SetSpeed(v)
	local hum = player.Character and player.Character:FindFirstChild("Humanoid")
	if hum then hum.WalkSpeed = v end
end

function Movement:SetJump(v)
	local hum = player.Character and player.Character:FindFirstChild("Humanoid")
	if hum then hum.JumpPower = v end
end

function Movement:Fly(state)
	local char = player.Character
	if not char then return end
	
	local hrp = char:FindFirstChild("HumanoidRootPart")
	
	if state then
		local bv = Instance.new("BodyVelocity", hrp)
		bv.Name = "FlyVel"
		bv.MaxForce = Vector3.new(1,1,1)*999999
	else
		local old = hrp:FindFirstChild("FlyVel")
		if old then old:Destroy() end
	end
end

return Movement
