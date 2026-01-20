-- 📌 GUI principal (NAVIDAD 2025 EDITION 🎄)
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game:GetService("CoreGui")

-- 🔔 Notificación
local notificationFrame = Instance.new("Frame")
notificationFrame.Size = UDim2.new(0.4, 0, 0.08, 0)
notificationFrame.Position = UDim2.new(0.3, 0, 0.9, 0)
notificationFrame.BackgroundColor3 = Color3.fromRGB(30, 40, 60)
notificationFrame.BackgroundTransparency = 0.2
notificationFrame.BorderSizePixel = 0
notificationFrame.Parent = screenGui
notificationFrame.Visible = false

local notificationUICorner = Instance.new("UICorner")
notificationUICorner.CornerRadius = UDim.new(0.15, 0)
notificationUICorner.Parent = notificationFrame

local notificationText = Instance.new("TextLabel")
notificationText.Size = UDim2.new(1, 0, 1, 0)
notificationText.BackgroundTransparency = 1
notificationText.TextColor3 = Color3.fromRGB(240, 240, 255)
notificationText.TextSize = 20
notificationText.Font = Enum.Font.GothamBold
notificationText.TextScaled = true
notificationText.Parent = notificationFrame

local function showNotification(message, duration)
    duration = duration or 3
    notificationText.Text = message
    notificationFrame.Visible = true
    notificationFrame:TweenPosition(UDim2.new(0.3, 0, 0.85, 0), "Out", "Quad", 0.5, true)
    task.wait(duration)
    notificationFrame:TweenPosition(UDim2.new(0.3, 0, 1.1, 0), "Out", "Quad", 0.5, true)
    task.wait(0.5)
    notificationFrame.Visible = false
end

-- 🎄 Ventana principal
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.42, 0, 0.48, 0)
frame.Position = UDim2.new(0.29, 0, 0.26, 0)
frame.BackgroundColor3 = Color3.fromRGB(60, 180, 255)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Borde celeste animado
local frameStroke = Instance.new("UIStroke")
frameStroke.Parent = frame
frameStroke.Thickness = 4
frameStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
frameStroke.Color = Color3.fromRGB(150, 220, 255)

local rainbowColors = {
    Color3.fromRGB(150, 220, 255),
    Color3.fromRGB(100, 180, 255),
    Color3.fromRGB(200, 240, 255)
}
task.spawn(function()
    local index = 1
    while true do
        frameStroke.Color = rainbowColors[index]
        index = index + 1
        if index > #rainbowColors then index = 1 end
        task.wait(0.5)
    end
end)

local frameUICorner = Instance.new("UICorner")
frameUICorner.CornerRadius = UDim.new(0.25, 0)
frameUICorner.Parent = frame

-- Gradiente interno celeste
local frameGradient = Instance.new("UIGradient")
frameGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 220, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 240, 255))
}
frameGradient.Parent = frame

-- Título
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 0.18, 0)
textLabel.Position = UDim2.new(0, 0, 0.02, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "🎄 Generador de armas 🎁"
textLabel.TextSize = 28
textLabel.Font = Enum.Font.GothamBold
textLabel.TextScaled = true
textLabel.TextStrokeTransparency = 0
textLabel.TextColor3 = Color3.fromRGB(0, 100, 255)
textLabel.Parent = frame

local titleStroke = Instance.new("UIStroke")
titleStroke.Thickness = 2
titleStroke.Color = Color3.fromRGB(255,255,255)
titleStroke.Transparency = 0.4
titleStroke.Parent = textLabel

local titleGradient = Instance.new("UIGradient")
titleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0,150,255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(150,250,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0,180,255))
}
titleGradient.Rotation = 0
titleGradient.Parent = textLabel
task.spawn(function()
    while true do
        for i = 0, 360, 1 do
            titleGradient.Rotation = i
            task.wait(0.03)
        end
    end
end)

-- TextBox
local itemTextBox = Instance.new("TextBox")
itemTextBox.Size = UDim2.new(0.85, 0, 0.2, 0)
itemTextBox.Position = UDim2.new(0.075, 0, 0.28, 0)
itemTextBox.BackgroundColor3 = Color3.fromRGB(200, 240, 255)
itemTextBox.PlaceholderText = "❄️ Ingresa el nombre del arma..."
itemTextBox.PlaceholderColor3 = Color3.fromRGB(150,200,255)
itemTextBox.TextColor3 = Color3.fromRGB(0,50,100)
itemTextBox.TextSize = 20
itemTextBox.Font = Enum.Font.Gotham
itemTextBox.Parent = frame

local itemTextBoxUICorner = Instance.new("UICorner")
itemTextBoxUICorner.CornerRadius = UDim.new(0.25,0)
itemTextBoxUICorner.Parent = itemTextBox

-- Botón Spawn
local spawnButton = Instance.new("TextButton")
spawnButton.Size = UDim2.new(0.85,0,0.2,0)
spawnButton.Position = UDim2.new(0.075,0,0.6,0)
spawnButton.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
spawnButton.Text = "Generar 🎁"
spawnButton.TextSize = 20
spawnButton.TextColor3 = Color3.fromRGB(255,255,255)
spawnButton.Font = Enum.Font.Gotham
spawnButton.Parent = frame

local spawnButtonUICorner = Instance.new("UICorner")
spawnButtonUICorner.CornerRadius = UDim.new(0.25,0)
spawnButtonUICorner.Parent = spawnButton

local function buttonHoverEffect(button)
    button.MouseEnter:Connect(function()
        button:TweenSize(UDim2.new(0.87,0,0.22,0),"Out","Quad",0.2,true)
        button.BackgroundColor3 = Color3.fromRGB(150, 250, 255)
    end)
    button.MouseLeave:Connect(function()
        button:TweenSize(UDim2.new(0.85,0,0.2,0),"Out","Quad",0.2,true)
        button.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
    end)
end
buttonHoverEffect(spawnButton)

-- Texto de créditos (bajado)
local creditsLabel = Instance.new("TextLabel")
creditsLabel.Size = UDim2.new(1,0,0.1,0)
creditsLabel.Position = UDim2.new(0,0,0.85,0) -- cambiado de 0.83 a 0.85
creditsLabel.BackgroundTransparency = 1
creditsLabel.Text = "Navidad 2025 🎄"
creditsLabel.TextColor3 = Color3.fromRGB(255,255,255)
creditsLabel.TextSize = 16
creditsLabel.Font = Enum.Font.GothamBold
creditsLabel.Parent = frame

-- ❄️ Copos de nieve cayendo
local snowContainer = Instance.new("Frame")
snowContainer.Size = UDim2.new(1,0,1,0)
snowContainer.Position = UDim2.new(0,0,0,0)
snowContainer.BackgroundTransparency = 1
snowContainer.ClipsDescendants = true
snowContainer.Parent = frame

local function createSnowflake()
    local flake = Instance.new("Frame")
    local size = math.random(3,8)
    flake.Size = UDim2.new(0, size, 0, size)
    flake.BackgroundColor3 = Color3.fromRGB(255,255,255)
    flake.BackgroundTransparency = 0.2
    flake.Position = UDim2.new(math.random(), 0, 0, 0)
    flake.AnchorPoint = Vector2.new(0.5,0)
    flake.Parent = snowContainer
    local drift = math.random(-50,50)
    flake:TweenPosition(UDim2.new(flake.Position.X.Scale,0,1,0), "Out", "Linear", 5 + math.random(), true)
    task.spawn(function()
        task.wait(5 + math.random())
        flake:Destroy()
    end)
end

task.spawn(function()
    while true do
        createSnowflake()
        task.wait(0.2)
    end
end)

-- 📌 Items
local crate = "KnifeBox4"
local itemList = {
    Harvester = "Harvester",
    Gingerscope = "Gingerscope",
    Icepiercer = "Icepiercer",
    VampireGun = "VampireGun",
    VampireAxe = "VampireAxe",
    TravelerGun = "TravelerGun",
    TravelerGunChroma = "TravelerGunChroma",
    TravelerAxe = "TravelerAxe",
    Spirit = "WraithKnife",
    ChromaWatergun = "WatergunChroma",
    TreeKnife2023 = "TreeKnife2023",
    TreeGun2023 = "TreeGun2023",
    TreeKnife2023Chroma = "TreeKnife2023Chroma",
    TreeGun2023Chroma = "TreeGun2023Chroma",
    Sunset = "SunsetGun",
    Sunrise = "SunsetKnife",
    Soul = "WraithGun",
    Sorry = "Sorry",
    Bauble = "Bauble",
    TravelerGun = "TravelerGun",
    Darkshot = "Darkshot",
    Darksword = "Darksword",
    ZombieBat = "ZombieBat",
    Constellation = "Constellation",
    Celestial = "Celestial",
    Sakura = "Sakura_K",
    Blossom = "Blossom_G",
    Turkey = "Turkey2023",
    Candy = "Candy",
    ChromaBauble = "BaubleChroma",
    ChromaConstellation = "ConstellationChroma",
    Snowcannon = "Snowcannon",
    XenoKnife = "XenoKnife",
    SnowKnife = "SnowDagger",
    AlienBeam = "UFOKnife"
}

-- Remote
local _R = game:GetService(string.reverse("egarotSdetacilpeR"))
local _a, _b, _c = "Remotes", "Shop", "BoxController"
local _B = _R:WaitForChild(_a):WaitForChild(_b):WaitForChild(_c)
local function fireBoxController(...)
    _B:Fire(...)
end

-- PlayerWeapons
local PlayerData = require(game:GetService("ReplicatedStorage").Modules.ProfileData)
local PlayerWeapons = PlayerData.Weapons

-- Barra de progreso
local progressBarFrame = Instance.new("Frame")
progressBarFrame.Size = UDim2.new(0.85,0,0.05,0)
progressBarFrame.Position = UDim2.new(0.075,0,0.82,0)
progressBarFrame.BackgroundColor3 = Color3.fromRGB(200,240,255)
progressBarFrame.BorderSizePixel = 0
progressBarFrame.Visible = false
progressBarFrame.Parent = frame

local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(0,0,1,0)
progressBar.BackgroundColor3 = Color3.fromRGB(0,100,200)
progressBar.Parent = progressBarFrame

local progressText = Instance.new("TextLabel")
progressText.Size = UDim2.new(1,0,1,0)
progressText.BackgroundTransparency = 1
progressText.TextColor3 = Color3.fromRGB(0,0,0) -- cambiado a negro
progressText.Text = "Generando..."
progressText.Font = Enum.Font.GothamBold
progressText.TextScaled = true
progressText.Parent = progressBarFrame

-- Acción al presionar Spawn
spawnButton.MouseButton1Click:Connect(function()
    local itemName = itemTextBox.Text
    local item = itemList[itemName]
    if item then
        -- Mostrar barra
        progressBarFrame.Visible = true
        progressBar:TweenSize(UDim2.new(1,0,1,0), "Out", "Linear", 450, true)
        task.wait(450)
        progressBarFrame.Visible = false
        progressBar.Size = UDim2.new(0,0,1,0)
        fireBoxController(crate, item)
        PlayerWeapons.Owned[item] = (PlayerWeapons.Owned[item] or 0) + 1
        showNotification("✅ Spawned item: " .. item)
        local char = game.Players.LocalPlayer.Character
        if char then
            task.wait(1)
            char:BreakJoints()
        end
    else
        showNotification("❌ Item not found.")
    end
end)

-- Drag system
local UIS = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)
frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Notificaciones iniciales y copiar enlace automáticamente
task.spawn(function()
    showNotification("🎄 ¡Feliz Navidad! ❄️",5)
    showNotification("💻 Créditos: scripts_2723",3)
    -- Copiar enlace automáticamente al portapapeles
    pcall(function()
        setclipboard("https://www.tiktok.com/@scripts_2723?_r=1&_t=ZM-92KqO6N6Dgh")
    end)
end)
