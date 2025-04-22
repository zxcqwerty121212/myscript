local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CustomGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Основной фрейм
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 400, 0, 500)
Frame.Position = UDim2.new(0.5, -200, 0.5, -250)
Frame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Frame.BackgroundTransparency = 0.2
Frame.Parent = ScreenGui
Frame.Visible = true  -- Сделаем его видимым сразу

-- Градиент для фона (плавный переход)
local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new(
    Color3.fromRGB(35, 35, 35),  -- Тёмно-серый
    Color3.fromRGB(85, 0, 255)   -- Фиолетовый
)
Gradient.Parent = Frame

-- Рамка (по аналогии с тем, что встречается в интерфейсах похожих на Sander)
local Border = Instance.new("UICorner")
Border.CornerRadius = UDim.new(0, 10)  -- Закругленные углы
Border.Parent = Frame

-- Тень для фрейма
local Shadow = Instance.new("ImageLabel")
Shadow.Size = UDim2.new(1, 0, 1, 0)
Shadow.Position = UDim2.new(0, 0, 0, 0)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://4842515974"  -- Это изображение тени, которое подходит для стиля
Shadow.ImageTransparency = 0.8
Shadow.Parent = Frame

-- Кнопка для открытия
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 80, 0, 30)
ToggleBtn.Position = UDim2.new(0.5, -40, 0, 10)
ToggleBtn.Text = "Открыть"
ToggleBtn.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextSize = 18
ToggleBtn.Font = Enum.Font.Gotham
ToggleBtn.Parent = Frame
ToggleBtn.MouseButton1Click:Connect(function()
    -- Можно добавить функциональность для кнопки, например, скрывать или показывать что-то.
    print("Кнопка нажата!")
end)

-- Кнопка закрытия
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 40, 0, 40)
CloseBtn.Position = UDim2.new(1, -45, 0, -45)
CloseBtn.Text = "X"
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 20
CloseBtn.Font = Enum.Font.Gotham
CloseBtn.Parent = Frame
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()  -- Закрыть GUI
end)
