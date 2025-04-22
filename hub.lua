local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Удаляем старый GUI, если он существует
for _, obj in pairs(PlayerGui:GetChildren()) do
    if obj.Name == "CustomHub" then
        obj:Destroy()
    end
end

-- Создание нового ScreenGui для интерфейса
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CustomHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Основной фрейм с темным стилем
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 500)
Frame.Position = UDim2.new(0, 0, 0.5, -250) -- Слева от экрана
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Frame.Parent = ScreenGui
Frame.Visible = false  -- По умолчанию скрыт

-- Иконка для сворачивания/открытия интерфейса
local IconBtn = Instance.new("ImageButton")
IconBtn.Size = UDim2.new(0, 50, 0, 50)
IconBtn.Position = UDim2.new(0, 5, 0.5, -25) -- В левом верхнем углу
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

-- Кнопка для телепортации в Мексику
local MexicoBtn = Instance.new("TextButton")
MexicoBtn.Size = UDim2.new(0, 250, 0, 40)
MexicoBtn.Position = UDim2.new(0, 25, 0, 70)
MexicoBtn.Text = "Телепорт в Мексику"
MexicoBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
MexicoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MexicoBtn.Parent = Frame
MexicoBtn.MouseButton1Click:Connect(function()
    -- Используем координаты для телепортации в Мексику
    -- Вставь свои точные координаты Мексики, если они у тебя есть
    local mexicoPosition = Vector3.new(1000, 50, 1000)  -- Примерные координаты
    Player.Character:SetPrimaryPartCFrame(CFrame.new(mexicoPosition))
    print("Телепортируем в Мексику!")
end)

-- Кнопка для телепортации на начало
local StartBtn = Instance.new("TextButton")
StartBtn.Size = UDim2.new(0, 250, 0, 40)
StartBtn.Position = UDim2.new(0, 25, 0, 120)
StartBtn.Text = "Телепорт в начало"
StartBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
StartBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
StartBtn.Parent = Frame
StartBtn.MouseButton1Click:Connect(function()
    -- Перемещаем игрока на стартовые координаты
    local startPosition = Vector3.new(0, 50, 0)  -- Примерные координаты
    Player.Character:SetPrimaryPartCFrame(CFrame.new(startPosition))
    print("Телепортируем на начало!")
end)

-- Кнопка для сворачивания/открытия интерфейса
IconBtn.MouseButton1Click:Connect(function()
    if Frame.Visible then
        Frame.Visible = false
    else
        Frame.Visible = true
    end
end)

-- Кнопка для закрытия интерфейса
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

-- Открытие интерфейса по умолчанию
IconBtn.MouseButton1Click:Connect(function()
    if Frame.Visible then
        Frame.Visible = false
    else
        Frame.Visible = true
    end
end)

