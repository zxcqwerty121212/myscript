-- GUI-хаб: спидхак и прыжок + кнопка закрытия

local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MyHackHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Основной фрейм
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 250, 0, 200)
Frame.Position = UDim2.new(0.5, -125, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.Parent = ScreenGui

-- Кнопка "Speed"
local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Size = UDim2.new(0, 200, 0, 40)
SpeedBtn.Position = UDim2.new(0, 25, 0, 20)
SpeedBtn.Text = "Спидхак"
SpeedBtn.Parent = Frame
SpeedBtn.MouseButton1Click:Connect(function()
	Player.Character.Humanoid.WalkSpeed = 100
end)

-- Кнопка "Jump"
local JumpBtn = Instance.new("TextButton")
JumpBtn.Size = UDim2.new(0, 200, 0, 40)
JumpBtn.Position = UDim2.new(0, 25, 0, 70)
JumpBtn.Text = "Прыжок x10"
JumpBtn.Parent = Frame
JumpBtn.MouseButton1Click:Connect(function()
	Player.Character.Humanoid.JumpPower = 200
end)

-- Кнопка "Закрыть"
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 60, 0, 30)
CloseBtn.Position = UDim2.new(1, -65, 0, 5)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.new(1, 0, 0)
CloseBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CloseBtn.Parent = Frame
CloseBtn.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)
