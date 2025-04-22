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
Frame.Position = UDim2.new(0, 10, 0.5, -200)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.Parent = ScreenGui
Frame.Visible = false  -- По умолчанию скрыт

-- Градиент для фона (темный с плавным переходом)
local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new(
    Color3.fromRGB(50, 50, 50),
    Color3.fromRGB(100, 100, 100)
)
Gradient.Parent = Frame

-- Иконка для сворачивания/открытия
local IconBtn = Instance.new("ImageButton")
IconBtn.Size = UDim2.new(0, 50, 0, 50)
IconBtn.Position = UDim2.new(0, 125, 0, -50)
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

-- Кнопка для сворачивания/открытия
IconBtn.MouseButton1Click:Connect(function()
    if Frame.Visible then
        Frame.Visible = false
    else
        Frame.Visible = true
    end
end)

-- Вкладки (меню)
local TabFrame = Instance.new("Frame")
TabFrame.Size = UDim2.new(0, 300, 0, 50)
TabFrame.Position = UDim2.new(0, 0, 0, 0)
TabFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TabFrame.Parent = Frame

local Tabs = {"Start", "Chat", "Teleport"}
local Buttons = {}

for i, tabName in ipairs(Tabs) do
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 100, 0, 50)
    Button.Position = UDim2.new(0, (i - 1) * 100, 0, 0)
    Button.Text = tabName
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Button.Parent = TabFrame
    Buttons[tabName] = Button
end

-- Кнопка для телепорта в Мексику
local MexicoBtn = Instance.new("TextButton")
MexicoBtn.Size = UDim2.new(0, 250, 0, 40)
MexicoBtn.Position = UDim2.new(0, 25, 0, 70)
MexicoBtn.Text = "Телепорт в Мексику"
MexicoBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
MexicoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MexicoBtn.Parent = Frame
MexicoBtn.Visible = false
MexicoBtn.MouseButton1Click:Connect(function()
    -- Здесь код для телепорта в Мексику (просто пример)
    print("Телепортируем в Мексику!")
end)

-- Кнопка для телепорта в начало
local StartBtn = Instance.new("TextButton")
StartBtn.Size = UDim2.new(0, 250, 0, 40)
StartBtn.Position = UDim2.new(0, 25, 0, 120)
StartBtn.Text = "Телепорт в Начало"
StartBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
StartBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
StartBtn.Parent = Frame
StartBtn.Visible = false
StartBtn.MouseButton1Click:Connect(function()
    -- Здесь код для телепорта в начало
    print("Телепортируем в начало!")
end)

-- Переключение вкладок
Buttons["Start"].MouseButton1Click:Connect(function()
    MexicoBtn.Visible = false
    StartBtn.Visible = false
end)

Buttons["Chat"].MouseButton1Click:Connect(function()
    MexicoBtn.Visible = false
    StartBtn.Visible = false
end)

Buttons["Teleport"].MouseButton1Click:Connect(function()
    MexicoBtn.Visible = true
    StartBtn.Visible = true
end)
