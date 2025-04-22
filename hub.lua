-- Удаляем старый GUI, если он существует
local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

for _, obj in pairs(PlayerGui:GetChildren()) do
    if obj.Name == "CustomHub" then
        obj:Destroy()
    end
end

-- Создание нового ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CustomHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Основной фрейм
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 450)
Frame.Position = UDim2.new(0, 0, 0.5, -225)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Parent = ScreenGui
Frame.Visible = false  -- По умолчанию скрыт

-- Иконка для сворачивания/открытия
local IconBtn = Instance.new("ImageButton")
IconBtn.Size = UDim2.new(0, 50, 0, 50)
IconBtn.Position = UDim2.new(0, 0, 0, 0)
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

-- Создание вкладок
local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(0, 300, 0, 40)
tabFrame.Position = UDim2.new(0, 0, 0, 0)
tabFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
tabFrame.Parent = Frame

local teleportTabButton = Instance.new("TextButton")
teleportTabButton.Size = UDim2.new(0, 100, 0, 40)
teleportTabButton.Position = UDim2.new(0, 0, 0, 0)
teleportTabButton.Text = "Teleport"
teleportTabButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
teleportTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportTabButton.Parent = tabFrame

local mainTabButton = Instance.new("TextButton")
mainTabButton.Size = UDim2.new(0, 100, 0, 40)
mainTabButton.Position = UDim2.new(0, 100, 0, 0)
mainTabButton.Text = "Main"
mainTabButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
mainTabButton.Parent = tabFrame

local aimBotTabButton = Instance.new("TextButton")
aimBotTabButton.Size = UDim2.new(0, 100, 0, 40)
aimBotTabButton.Position = UDim2.new(0, 200, 0, 0)
aimBotTabButton.Text = "AimBot"
aimBotTabButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
aimBotTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
aimBotTabButton.Parent = tabFrame

-- Вкладка для телепортации
local teleportFrame = Instance.new("Frame")
teleportFrame.Size = UDim2.new(0, 300, 0, 250)
teleportFrame.Position = UDim2.new(0, 0, 0, 40)
teleportFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
teleportFrame.Parent = Frame
teleportFrame.Visible = false

-- Кнопка для телепортации в деревню
local villageButton = Instance.new("TextButton")
villageButton.Size = UDim2.new(0, 250, 0, 40)
villageButton.Position = UDim2.new(0, 25, 0, 50)
villageButton.Text = "Teleport to Village"
villageButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
villageButton.TextColor3 = Color3.fromRGB(255, 255, 255)
villageButton.Parent = teleportFrame
villageButton.MouseButton1Click:Connect(function()
    teleportToPosition(Vector3.new(100, 0, 100))  -- Пример координат деревни
end)

-- Кнопка для телепортации в лабораторию Теслы
local teslaButton = Instance.new("TextButton")
teslaButton.Size = UDim2.new(0, 250, 0, 40)
teslaButton.Position = UDim2.new(0, 25, 0, 100)
teslaButton.Text = "Teleport to Tesla Lab"
teslaButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
teslaButton.TextColor3 = Color3.fromRGB(255, 255, 255)
teslaButton.Parent = teleportFrame
teslaButton.MouseButton1Click:Connect(function()
    teleportToPosition(Vector3.new(200, 0, 200))  -- Пример координат лаборатории Теслы
end)

-- Вкладка для Main
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 250)
mainFrame.Position = UDim2.new(0, 0, 0, 40)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.Parent = Frame
mainFrame.Visible = false

-- Кнопка для авто фарма
local autoFarmButton = Instance.new("TextButton")
autoFarmButton.Size = UDim2.new(0, 250, 0, 40)
autoFarmButton.Position = UDim2.new(0, 25, 0, 50)
autoFarmButton.Text = "Auto Farm"
autoFarmButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
autoFarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
autoFarmButton.Parent = mainFrame
autoFarmButton.MouseButton1Click:Connect(function()
    -- Добавьте код для авто фарма
end)

-- Вкладка для AimBot
local aimBotFrame = Instance.new("Frame")
aimBotFrame.Size = UDim2.new(0, 300, 0, 250)
aimBotFrame.Position = UDim2.new(0, 0, 0, 40)
aimBotFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
aimBotFrame.Parent = Frame
aimBotFrame.Visible = false

-- Кнопка для включения AimBot
local aimBotButton = Instance.new("TextButton")
aimBotButton.Size = UDim2.new(0, 250, 0, 40)
aimBotButton.Position = UDim2.new(0, 25, 0, 50)
aimBotButton.Text = "Enable AimBot"
aimBotButton.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
aimBotButton.TextColor3 = Color3.fromRGB(255, 255, 255)
aimBotButton.Parent = aimBotFrame
aimBotButton.MouseButton1Click:Connect(function()
    -- Добавьте код для AimBot
end)

-- Кнопка для настройки FOV
local fovButton = Instance.new("TextButton")
fovButton.Size = UDim2.new(0, 250, 0, 40)
fovButton.Position = UDim2.new(0, 25, 0, 100)
fovButton.Text = "Set FOV"
fovButton.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
fovButton.TextColor3 = Color3.fromRGB(255, 255, 255)
fovButton.Parent = aimBotFrame
fovButton.MouseButton1Click:Connect(function()
    -- Добавьте код для изменения FOV
end)

-- Логика для переключения между вкладками
teleportTabButton.MouseButton1Click:Connect(function()
    teleportFrame.Visible = true
    mainFrame.Visible = false
    aimBotFrame.Visible = false
end)

mainTabButton.MouseButton1Click:Connect(function()
    teleportFrame.Visible = false
    mainFrame.Visible = true
    aimBotFrame.Visible = false
end)

aimBotTabButton.MouseButton1Click:Connect(function()
    teleportFrame.Visible = false
    mainFrame.Visible = false
    aimBotFrame.Visible = true
end)

-- Кнопка для сворачивания/открытия
IconBtn.MouseButton1Click:Connect(function()
    if Frame.Visible then
        Frame.Visible = false
    else
        Frame.Visible = true
    end
end)
