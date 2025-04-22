local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Удаляем старый GUI, если существует
for _, obj in pairs(PlayerGui:GetChildren()) do
    if obj.Name == "CustomHub" then
        obj:Destroy()
    end
end

-- Создаем ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CustomHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Главный фрейм
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 450)
Frame.Position = UDim2.new(0, 25, 0.5, -225)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Parent = ScreenGui
Frame.Visible = false  -- Скрыт по умолчанию

-- Градиент для фона
local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new(
    Color3.fromRGB(40, 40, 40),
    Color3.fromRGB(100, 100, 100)
)
Gradient.Parent = Frame

-- Иконка для сворачивания
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

-- Кнопка для сворачивания/открытия
IconBtn.MouseButton1Click:Connect(function()
    if Frame.Visible then
        Frame.Visible = false
    else
        Frame.Visible = true
    end
end)

-- Вкладки
local TabButtons = {}
local TabFrames = {}

-- Функция для создания вкладки
local function createTab(name, parentFrame)
    local TabButton = Instance.new("TextButton")
    TabButton.Size = UDim2.new(0, 100, 0, 50)
    TabButton.Text = name
    TabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.Parent = parentFrame
    TabButton.MouseButton1Click:Connect(function()
        for _, tabFrame in pairs(TabFrames) do
            tabFrame.Visible = false
        end
        TabFrames[name].Visible = true
    end)
    
    TabButtons[name] = TabButton
end

-- Основной фрейм для вкладок
local TabsFrame = Instance.new("Frame")
TabsFrame.Size = UDim2.new(0, 100, 0, 450)
TabsFrame.Position = UDim2.new(0, 0, 0, 0)
TabsFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TabsFrame.Parent = Frame

-- Создаем вкладки
createTab("Speed", TabsFrame)
createTab("Teleport", TabsFrame)
createTab("Visuals", TabsFrame)
createTab("Chat", TabsFrame)
createTab("Misc", TabsFrame)

-- Функции вкладок
local function createSpeedTab()
    local SpeedTab = Instance.new("Frame")
    SpeedTab.Size = UDim2.new(0, 200, 0, 450)
    SpeedTab.Position = UDim2.new(0, 100, 0, 0)
    SpeedTab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    SpeedTab.Parent = Frame
    TabFrames["Speed"] = SpeedTab

    -- Кнопка для увеличения скорости
    local SpeedBtn = Instance.new("TextButton")
    SpeedBtn.Size = UDim2.new(0, 200, 0, 40)
    SpeedBtn.Position = UDim2.new(0, 25, 0, 50)
    SpeedBtn.Text = "Increase Speed"
    SpeedBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    SpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedBtn.Parent = SpeedTab
    SpeedBtn.MouseButton1Click:Connect(function()
        Player.Character.Humanoid.WalkSpeed = 50  -- Быстрая скорость
    end)
end

local function createTeleportTab()
    local TeleportTab = Instance.new("Frame")
    TeleportTab.Size = UDim2.new(0, 200, 0, 450)
    TeleportTab.Position = UDim2.new(0, 100, 0, 0)
    TeleportTab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TeleportTab.Parent = Frame
    TabFrames["Teleport"] = TeleportTab

    -- Кнопка для телепорта в Мексику
    local MexicoBtn = Instance.new("TextButton")
    MexicoBtn.Size = UDim2.new(0, 200, 0, 40)
    MexicoBtn.Position = UDim2.new(0, 25, 0, 50)
    MexicoBtn.Text = "Teleport to Mexico"
    MexicoBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    MexicoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    MexicoBtn.Parent = TeleportTab
    MexicoBtn.MouseButton1Click:Connect(function()
        -- Телепорт в Мексику
        local destination = workspace:WaitForChild("Mexico")  -- Замените на точное имя локации
        Player.Character.HumanoidRootPart.CFrame = destination.CFrame
    end)

    -- Кнопка для телепорта в начало
    local StartBtn = Instance.new("TextButton")
    StartBtn.Size = UDim2.new(0, 200, 0, 40)
    StartBtn.Position = UDim2.new(0, 25, 0, 100)
    StartBtn.Text = "Teleport to Start"
    StartBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    StartBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    StartBtn.Parent = TeleportTab
    StartBtn.MouseButton1Click:Connect(function()
        -- Телепорт в начало
        local startPoint = workspace:WaitForChild("Start")  -- Замените на точное имя локации
        Player.Character.HumanoidRootPart.CFrame = startPoint.CFrame
    end)
end

local function createVisualsTab()
    local VisualsTab = Instance.new("Frame")
    VisualsTab.Size = UDim2.new(0, 200, 0, 450)
    VisualsTab.Position = UDim2.new(0, 100, 0, 0)
    VisualsTab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    VisualsTab.Parent = Frame
    TabFrames["Visuals"] = VisualsTab

    -- Функция для изменения настроек визуала
    local VisualsBtn = Instance.new("TextButton")
    VisualsBtn.Size = UDim2.new(0, 200, 0, 40)
    VisualsBtn.Position = UDim2.new(0, 25, 0, 50)
    VisualsBtn.Text = "Change Visuals"
    VisualsBtn.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
    VisualsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    VisualsBtn.Parent = VisualsTab
    VisualsBtn.MouseButton1Click:Connect(function()
        -- Пример изменения визуала
        Player.Character.HumanoidRootPart.Color = Color3.fromRGB(255, 0, 0)  -- Просто пример
    end)
end

local function createChatTab()
    local ChatTab = Instance.new("Frame")
    ChatTab.Size = UDim2.new(0, 200, 0, 450)
    ChatTab.Position = UDim2.new(0, 100, 0, 0)
    ChatTab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    ChatTab.Parent = Frame
    TabFrames["Chat"] = ChatTab

    -- Кнопка для открытия чата
    local ChatBtn = Instance.new("TextButton")
    ChatBtn.Size = UDim2.new(0, 200, 0, 40)
    ChatBtn.Position = UDim2.new(0, 25, 0, 50)
    ChatBtn.Text = "Open Chat"
    ChatBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    ChatBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ChatBtn.Parent = ChatTab
    ChatBtn.MouseButton1Click:Connect(function()
        -- Пример отправки сообщения в чат
        game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {Text = "Hello, world!"})
    end)
end

-- Функция для вкладки Misc
local function createMiscTab()
    local MiscTab = Instance.new("Frame")
    MiscTab.Size = UDim2.new(0, 200, 0, 450)
    MiscTab.Position = UDim2.new(0, 100, 0, 0)
    MiscTab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MiscTab.Parent = Frame
    TabFrames["Misc"] = MiscTab

    -- Пример функции для скрытия/показа HUD
    local ToggleHUDBtn = Instance.new("TextButton")
    ToggleHUDBtn.Size = UDim2.new(0, 200, 0, 40)
    ToggleHUDBtn.Position = UDim2.new(0, 25, 0, 50)
    ToggleHUDBtn.Text = "Toggle HUD"
    ToggleHUDBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
    ToggleHUDBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleHUDBtn.Parent = MiscTab
    ToggleHUDBtn.MouseButton1Click:Connect(function()
        local playerUI = PlayerGui:FindFirstChild("PlayerUI")
        if playerUI then
            playerUI.Enabled = not playerUI.Enabled
        end
    end)

    -- Пример функции для создания привата (анимированные NPC)
    local SpawnNPCBtn = Instance.new("TextButton")
    SpawnNPCBtn.Size = UDim2.new(0, 200, 0, 40)
    SpawnNPCBtn.Position = UDim2.new(0, 25, 0, 100)
    SpawnNPCBtn.Text = "Spawn NPC"
    SpawnNPCBtn.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
    SpawnNPCBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpawnNPCBtn.Parent = MiscTab
    SpawnNPCBtn.MouseButton1Click:Connect(function()
        local npc = Instance.new("Model")
        npc.Name = "NPC"
        npc.Parent = workspace
        -- Дальше можно добавить логику создания NPC
    end)
end

-- Инициализируем вкладки
createSpeedTab()
createTeleportTab()
createVisualsTab()
createChatTab()
createMiscTab()
