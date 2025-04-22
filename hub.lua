local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Удаляем старый GUI (если он существует)
for _, obj in pairs(PlayerGui:GetChildren()) do
    if obj.Name == "CustomHub" then
        obj:Destroy()
    end
end

-- ScreenGui для нового интерфейса
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CustomHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Основной фрейм с новым стилем
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 450)
Frame.Position = UDim2.new(0.5, -150, 0.5, -225)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Parent = ScreenGui
Frame.Visible = false  -- По умолчанию скрыт

-- Градиент для фона (темный с плавным переходом)
local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new(
    Color3.fromRGB(40, 40, 40),
    Color3.fromRGB(100, 100, 100)
)
Gradient.Parent = Frame

-- Иконка для сворачивания/открытия
local IconBtn = Instance.new("ImageButton")
IconBtn.Size = UDim2.new(0, 50, 0, 50)
IconBtn.Position = UDim2.new(0.5, -25, 0.5, -200)
IconBtn.Image = "rbxassetid://6031071056"  -- Белая иконка
IconBtn.BackgroundTransparency = 1
IconBtn.Parent = ScreenGui

-- Логика для перетаскивания иконки
local dragging = false
local dragInput, dragStart, startPos

IconBtn.MouseButton1Down:Connect(function(input)
    dragging = true
    dragStart = input.Position
    startPos = IconBtn.Position

    input.Changed:Connect(function()
        if input.UserInputState == Enum.UserInputState.End then
            dragging = false
        end
    end)
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging then
        local delta = input.Position - dragStart
        IconBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Кнопка для спидхака
local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Size = UDim2.new(0, 250, 0, 40)
SpeedBtn.Position = UDim2.new(0, 25, 0, 70)
SpeedBtn.Text = "Увеличить скорость"
SpeedBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
SpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedBtn.Parent = Frame
SpeedBtn.MouseButton1Click:Connect(function()
    Player.Character.Humanoid.WalkSpeed = 100
end)

-- Кнопка для прыжка
local JumpBtn = Instance.new("TextButton")
JumpBtn.Size = UDim2.new(0, 250, 0, 40)
JumpBtn.Position = UDim2.new(0, 25, 0, 120)
JumpBtn.Text = "Увеличить прыжок"
JumpBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
JumpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpBtn.Parent = Frame
JumpBtn.MouseButton1Click:Connect(function()
    Player.Character.Humanoid.JumpPower = 200
end)

-- Кнопка для полета
local FlyBtn = Instance.new("TextButton")
FlyBtn.Size = UDim2.new(0, 250, 0, 40)
FlyBtn.Position = UDim2.new(0, 25, 0, 170)
FlyBtn.Text = "Полёт"
FlyBtn.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
FlyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyBtn.Parent = Frame
FlyBtn.MouseButton1Click:Connect(function()
    -- Код для полёта
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ТВОЙ_НИК/репозиторий/raw/полёт-скрипт.lua"))()
end)

-- Кнопка для закрытия
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 60, 0, 30)
CloseBtn.Position = UDim2.new(1, -65, 0, 5)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
CloseBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
CloseBtn.Parent = Frame
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Кнопка для сворачивания/открытия
IconBtn.MouseButton1Click:Connect(function()
    if Frame.Visible then
        Frame.Visible = false
    else
        Frame.Visible = true
    end
end)
-- Кнопка для телепорта в Мексику (или конец карты)
local MexicoBtn = Instance.new("TextButton")
MexicoBtn.Size = UDim2.new(0, 250, 0, 40)
MexicoBtn.Position = UDim2.new(0, 25, 0, 220)
MexicoBtn.Text = "Телепорт в Мексику"
MexicoBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
MexicoBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
MexicoBtn.Parent = Frame
MexicoBtn.MouseButton1Click:Connect(function()
    local char = Player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = CFrame.new(9999, 100, 9999) -- координаты "Мексики"
    end
end)
-- Кнопка для сворачивания/открытия
IconBtn.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
end)

-- Открываем GUI сразу при запуске
wait(0.1)
Frame.Visible = true
-- Разблокировка камеры и курсора при запуске
local player = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")

-- Делаем курсор обычным
uis.MouseIconEnabled = true

-- Включаем свободную камеру (третье лицо)
pcall(function()
    player.CameraMode = Enum.CameraMode.Classic
    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
end)

-- Мышь не привязана к экрану
uis.MouseBehavior = Enum.MouseBehavior.Default



