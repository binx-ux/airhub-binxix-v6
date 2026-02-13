-- ============================================
-- BINXIX HUB V6 - AIRHUB V2 STYLE REDESIGN
-- Complete GUI overhaul with premium AirHub aesthetic
-- ============================================

-- GLOBAL UNLOAD FLAG
_G.BinxixUnloaded = false

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer

local currentPlaceId = game.PlaceId

-- ============================================
-- AIRHUB V2 STYLE COLOR PALETTE
-- ============================================
-- ============================================
-- THEME SYSTEM
-- ============================================
local ThemePresets = {
    Purple = {
        Background = Color3.fromRGB(25, 25, 30), BackgroundDark = Color3.fromRGB(18, 18, 22), BackgroundLight = Color3.fromRGB(35, 35, 42),
        Accent = Color3.fromRGB(170, 100, 200), AccentDark = Color3.fromRGB(130, 70, 160), AccentBright = Color3.fromRGB(200, 130, 230), AccentPink = Color3.fromRGB(200, 100, 180),
        TextPrimary = Color3.fromRGB(220, 220, 225), TextSecondary = Color3.fromRGB(150, 150, 160), TextDim = Color3.fromRGB(100, 100, 110), TextHeader = Color3.fromRGB(180, 140, 200),
        Border = Color3.fromRGB(50, 50, 60), BorderLight = Color3.fromRGB(70, 70, 85),
        CheckboxEnabled = Color3.fromRGB(255, 255, 255), CheckboxDisabled = Color3.fromRGB(60, 60, 70),
        SliderBackground = Color3.fromRGB(45, 45, 55), SliderFill = Color3.fromRGB(180, 100, 200),
        TabActive = Color3.fromRGB(200, 130, 230), TabInactive = Color3.fromRGB(120, 120, 130),
        ESP_Close = Color3.fromRGB(255, 60, 60), ESP_Medium = Color3.fromRGB(255, 180, 50), ESP_Far = Color3.fromRGB(255, 255, 80), ESP_VeryFar = Color3.fromRGB(80, 255, 80),
    },
    Blue = {
        Background = Color3.fromRGB(20, 24, 32), BackgroundDark = Color3.fromRGB(14, 17, 24), BackgroundLight = Color3.fromRGB(30, 36, 48),
        Accent = Color3.fromRGB(70, 130, 220), AccentDark = Color3.fromRGB(50, 100, 180), AccentBright = Color3.fromRGB(100, 160, 255), AccentPink = Color3.fromRGB(70, 140, 230),
        TextPrimary = Color3.fromRGB(215, 220, 230), TextSecondary = Color3.fromRGB(140, 150, 170), TextDim = Color3.fromRGB(90, 100, 120), TextHeader = Color3.fromRGB(120, 170, 240),
        Border = Color3.fromRGB(40, 50, 65), BorderLight = Color3.fromRGB(55, 70, 90),
        CheckboxEnabled = Color3.fromRGB(255, 255, 255), CheckboxDisabled = Color3.fromRGB(50, 58, 72),
        SliderBackground = Color3.fromRGB(35, 42, 58), SliderFill = Color3.fromRGB(70, 140, 230),
        TabActive = Color3.fromRGB(100, 160, 255), TabInactive = Color3.fromRGB(110, 120, 140),
        ESP_Close = Color3.fromRGB(255, 60, 60), ESP_Medium = Color3.fromRGB(255, 180, 50), ESP_Far = Color3.fromRGB(255, 255, 80), ESP_VeryFar = Color3.fromRGB(80, 255, 80),
    },
    Red = {
        Background = Color3.fromRGB(28, 22, 22), BackgroundDark = Color3.fromRGB(20, 15, 15), BackgroundLight = Color3.fromRGB(42, 32, 32),
        Accent = Color3.fromRGB(200, 70, 70), AccentDark = Color3.fromRGB(160, 50, 50), AccentBright = Color3.fromRGB(240, 100, 100), AccentPink = Color3.fromRGB(220, 80, 80),
        TextPrimary = Color3.fromRGB(225, 215, 215), TextSecondary = Color3.fromRGB(160, 140, 140), TextDim = Color3.fromRGB(110, 90, 90), TextHeader = Color3.fromRGB(220, 130, 130),
        Border = Color3.fromRGB(60, 42, 42), BorderLight = Color3.fromRGB(85, 60, 60),
        CheckboxEnabled = Color3.fromRGB(255, 255, 255), CheckboxDisabled = Color3.fromRGB(70, 55, 55),
        SliderBackground = Color3.fromRGB(55, 38, 38), SliderFill = Color3.fromRGB(220, 80, 80),
        TabActive = Color3.fromRGB(240, 100, 100), TabInactive = Color3.fromRGB(130, 110, 110),
        ESP_Close = Color3.fromRGB(255, 60, 60), ESP_Medium = Color3.fromRGB(255, 180, 50), ESP_Far = Color3.fromRGB(255, 255, 80), ESP_VeryFar = Color3.fromRGB(80, 255, 80),
    },
    Green = {
        Background = Color3.fromRGB(20, 28, 22), BackgroundDark = Color3.fromRGB(14, 20, 16), BackgroundLight = Color3.fromRGB(30, 42, 34),
        Accent = Color3.fromRGB(60, 180, 90), AccentDark = Color3.fromRGB(40, 140, 70), AccentBright = Color3.fromRGB(80, 220, 120), AccentPink = Color3.fromRGB(60, 200, 100),
        TextPrimary = Color3.fromRGB(215, 225, 218), TextSecondary = Color3.fromRGB(140, 160, 145), TextDim = Color3.fromRGB(90, 110, 95), TextHeader = Color3.fromRGB(100, 200, 130),
        Border = Color3.fromRGB(40, 58, 45), BorderLight = Color3.fromRGB(55, 80, 62),
        CheckboxEnabled = Color3.fromRGB(255, 255, 255), CheckboxDisabled = Color3.fromRGB(50, 68, 55),
        SliderBackground = Color3.fromRGB(35, 52, 40), SliderFill = Color3.fromRGB(60, 200, 100),
        TabActive = Color3.fromRGB(80, 220, 120), TabInactive = Color3.fromRGB(110, 130, 115),
        ESP_Close = Color3.fromRGB(255, 60, 60), ESP_Medium = Color3.fromRGB(255, 180, 50), ESP_Far = Color3.fromRGB(255, 255, 80), ESP_VeryFar = Color3.fromRGB(80, 255, 80),
    },
    Rose = {
        Background = Color3.fromRGB(28, 22, 26), BackgroundDark = Color3.fromRGB(20, 15, 19), BackgroundLight = Color3.fromRGB(42, 32, 38),
        Accent = Color3.fromRGB(220, 80, 140), AccentDark = Color3.fromRGB(180, 55, 110), AccentBright = Color3.fromRGB(255, 110, 170), AccentPink = Color3.fromRGB(240, 90, 150),
        TextPrimary = Color3.fromRGB(225, 215, 222), TextSecondary = Color3.fromRGB(160, 140, 152), TextDim = Color3.fromRGB(110, 90, 100), TextHeader = Color3.fromRGB(240, 130, 175),
        Border = Color3.fromRGB(60, 42, 52), BorderLight = Color3.fromRGB(85, 60, 72),
        CheckboxEnabled = Color3.fromRGB(255, 255, 255), CheckboxDisabled = Color3.fromRGB(70, 55, 62),
        SliderBackground = Color3.fromRGB(55, 38, 48), SliderFill = Color3.fromRGB(240, 90, 150),
        TabActive = Color3.fromRGB(255, 110, 170), TabInactive = Color3.fromRGB(130, 110, 120),
        ESP_Close = Color3.fromRGB(255, 60, 60), ESP_Medium = Color3.fromRGB(255, 180, 50), ESP_Far = Color3.fromRGB(255, 255, 80), ESP_VeryFar = Color3.fromRGB(80, 255, 80),
    },
}

local currentThemeName = "Purple"
local Theme = {}
for k, v in pairs(ThemePresets.Purple) do
    Theme[k] = v
end

-- List of GUI elements that need recoloring when theme changes (populated during GUI creation)
local themeUpdateCallbacks = {}

local function applyTheme(themeName)
    local preset = ThemePresets[themeName]
    if not preset then return end
    currentThemeName = themeName
    for k, v in pairs(preset) do
        Theme[k] = v
    end
    -- Fire all registered recolor callbacks
    for _, cb in ipairs(themeUpdateCallbacks) do
        pcall(cb)
    end
end

-- ============================================
-- GAME DETECTION & EXTERNAL SCRIPT LOADING
-- ============================================
local supportedGames = {
    [286090429] = {name = "Arsenal", espEnabled = true},
    [9157605735] = {name = "MiscGunTest-X", espEnabled = false},
    [155615604] = {name = "PR", espEnabled = true},
    [95721658376580] = {name = "MTC", espEnabled = true},
    [83728249169833] = {name = "Quick-Shot", espEnabled = true},
    [109397169461300] = {name = "SNIPER DUELS", espEnabled = false},
    [142823291] = {name = "Murder Mystery 2", espEnabled = false, loadScript = "https://raw.smokingscripts.org/vertex.lua", scriptName = "Vertex"},
    [10449761463] = {name = "The Strongest Battlegrounds", espEnabled = false, loadScript = "https://raw.githubusercontent.com/ATrainz/Phantasm/refs/heads/main/Games/TSB.lua", scriptName = "Phantasm"},
}

local currentGameData = supportedGames[currentPlaceId] or {name = "Universal", espEnabled = true}
local gameConfig = {espEnabled = currentGameData.espEnabled}

-- External script redirect for MM2 and TSB
if currentGameData.loadScript then
    _G.BinxixUnloaded = true
    
    local notifGui = Instance.new("ScreenGui")
    notifGui.Name = "BinxixLoader"
    notifGui.ResetOnSpawn = false
    notifGui.IgnoreGuiInset = true
    notifGui.Parent = player:WaitForChild("PlayerGui")
    
    local notifFrame = Instance.new("Frame")
    notifFrame.Size = UDim2.new(0, 280, 0, 60)
    notifFrame.Position = UDim2.new(0.5, -140, 0.5, -30)
    notifFrame.BackgroundColor3 = Theme.BackgroundDark
    notifFrame.BorderSizePixel = 0
    notifFrame.Parent = notifGui
    
    local notifText = Instance.new("TextLabel")
    notifText.Size = UDim2.new(1, -16, 1, -16)
    notifText.Position = UDim2.new(0, 8, 0, 8)
    notifText.BackgroundTransparency = 1
    notifText.Text = "Loading " .. currentGameData.scriptName .. "..."
    notifText.TextColor3 = Theme.TextPrimary
    notifText.TextSize = 12
    notifText.Font = Enum.Font.SourceSans
    notifText.Parent = notifFrame
    
    task.spawn(function()
        task.wait(0.5)
        local success, err = pcall(function()
            loadstring(game:HttpGet(currentGameData.loadScript))()
        end)
        
        if success then
            notifText.Text = currentGameData.scriptName .. " Loaded!"
            task.wait(2)
        else
            notifText.Text = "Failed: " .. tostring(err)
            task.wait(3)
        end
        notifGui:Destroy()
    end)
    
    return
end

-- ============================================
-- SETTINGS & STATE MANAGEMENT
-- ============================================
local Settings = {
    ESP = {
        Enabled = false,
        BoxEnabled = true,
        NameEnabled = true,
        HealthEnabled = true,
        DistanceEnabled = true,
        TracerEnabled = true,
        SkeletonEnabled = false,
        HeadDotEnabled = true,
        OffscreenArrows = false,
        RainbowOutline = false,
        RainbowColor = false,
        OutlineEnabled = true,
        OutlineColor = Theme.AccentPink,
        TracerOrigin = "Bottom",
        TracerThickness = 1,
        TracerTransparency = 0,
        TracerRainbowOutline = false,
        TracerRainbowColor = false,
        BoxThickness = 1,
        SkeletonThickness = 1,
        Transparency = 0,
        FontSize = 13,
        Font = nil,
        Offset = 0,
        ArrowSize = 20,
        ArrowDistance = 500,
        ChamsEnabled = false,
        ChamsFillTransparency = 0.5,
        FilterMode = "Enemies", -- "All", "Enemies", "Team", "All (No Team Check)"
    },
    Aimbot = {
        Enabled = false,
        Toggle = false,
        LockPart = "Head",
        Smoothness = 0.15,
        FOVRadius = 150,
        ShowFOV = true,
        FOVOpacity = 0.5,
        RequireLOS = true,
        Prediction = true,
        PredictionAmount = 0.12,
        StickyAim = true,
        MaxDistance = 500,
    },
    Crosshair = {
        Enabled = false,
        Style = "Cross",
        Size = 10,
        Thickness = 2,
        Gap = 4,
        Color = Theme.AccentPink,
        Outline = true,
        CenterDot = false,
    },
    Visuals = {
        Fullbright = false,
        NoFog = false,
        CustomFOV = false,
        FOVAmount = 70,
        ShowFPS = false,
        ShowVelocity = false,
    },
    Movement = {
        SpeedEnabled = false,
        Speed = 16,
        JumpEnabled = false,
        JumpPower = 50,
        BunnyHop = false,
        BunnyHopSpeed = 30,
        Fly = false,
        FlySpeed = 50,
    },
    Combat = {
        KillAura = false,
        KillAuraRange = 15,
        KillAuraSpeed = 0.15,
        KillAuraMethod = "Click", -- "Click", "Touch"
        TriggerBot = false,
        TriggerBotDelay = 0.05,
        TriggerBotFOV = 50,
        FastReload = false,
        FastFireRate = false,
        AlwaysAuto = false,
        NoSpread = false,
        NoRecoil = false,
    },
    StreamerMode = {
        Enabled = false,
        HideNames = true,
        HideChat = false,
        HideNotifications = false,
        FakeName = "Player",
    },
    Misc = {
        AntiAFK = false,
        AutoRejoin = false,
        AutoTPLoop = false,
        AutoTPLoopDelay = 0.2,
        AutoTPTargetName = "Nearest Enemy",
        ChatSpammer = false,
        ChatSpamMessage = "Binxix Hub V6 on top",
        ChatSpamDelay = 3,
    },
}

-- ============================================
-- PROFILE SYSTEM
-- ============================================
local PROFILE_DIR = "BinxixHubV6_Profiles/"
local currentProfileName = "Default"

local function ensureProfileDir()
    pcall(function()
        if not isfolder(PROFILE_DIR) then
            makefolder(PROFILE_DIR)
        end
    end)
end

local function getProfilePath(name)
    return PROFILE_DIR .. name .. ".json"
end

local function listProfiles()
    local profiles = {}
    pcall(function()
        ensureProfileDir()
        local files = listfiles(PROFILE_DIR)
        for _, file in ipairs(files) do
            local name = file:match("([^/\\]+)%.json$")
            if name then
                table.insert(profiles, name)
            end
        end
    end)
    if #profiles == 0 then
        table.insert(profiles, "Default")
    end
    return profiles
end

local function saveProfile(name)
    ensureProfileDir()
    local success, err = pcall(function()
        local saveData = {
            _meta = {
                theme = currentThemeName,
                version = "V6.3",
                game = currentGameData.name,
                profile = name,
            },
        }
        for category, values in pairs(Settings) do
            saveData[category] = {}
            for key, val in pairs(values) do
                if typeof(val) == "boolean" or typeof(val) == "number" or typeof(val) == "string" then
                    saveData[category][key] = val
                elseif typeof(val) == "Color3" then
                    saveData[category][key] = {_type = "Color3", R = math.floor(val.R * 255), G = math.floor(val.G * 255), B = math.floor(val.B * 255)}
                elseif typeof(val) == "EnumItem" then
                    saveData[category][key] = {_type = "Enum", Value = val.Name}
                end
            end
        end
        local json = HttpService:JSONEncode(saveData)
        writefile(getProfilePath(name), json)
    end)
    return success, err
end

local function loadProfile(name)
    local success, err = pcall(function()
        local path = getProfilePath(name)
        if not isfile(path) then
            error("Profile not found: " .. name)
        end
        local json = readfile(path)
        local saveData = HttpService:JSONDecode(json)
        if saveData._meta and saveData._meta.theme then
            applyTheme(saveData._meta.theme)
        end
        for category, values in pairs(saveData) do
            if category ~= "_meta" and Settings[category] then
                for key, val in pairs(values) do
                    if Settings[category][key] ~= nil then
                        if type(val) == "table" and val._type == "Color3" then
                            Settings[category][key] = Color3.fromRGB(val.R, val.G, val.B)
                        elseif type(val) == "table" and val._type == "Enum" then
                            -- skip
                        else
                            Settings[category][key] = val
                        end
                    end
                end
            end
        end
        currentProfileName = name
    end)
    return success, err
end

local function deleteProfile(name)
    pcall(function()
        local path = getProfilePath(name)
        if isfile(path) then
            delfile(path)
        end
    end)
end

local allConnections = {}
local activeESP = {}
local isUnloading = false
local currentTarget = nil
local isTracking = false
local toggleTrackingActive = false
local rightMouseTracking = nil

-- Fly variables
local flyBodyVelocity = nil
local flyBodyGyro = nil
local isFlying = false

-- Skeleton bone connections for R15
local SKELETON_CONNECTIONS_R15 = {
    {"Head", "UpperTorso"},
    {"UpperTorso", "LowerTorso"},
    {"UpperTorso", "LeftUpperArm"},
    {"LeftUpperArm", "LeftLowerArm"},
    {"LeftLowerArm", "LeftHand"},
    {"UpperTorso", "RightUpperArm"},
    {"RightUpperArm", "RightLowerArm"},
    {"RightLowerArm", "RightHand"},
    {"LowerTorso", "LeftUpperLeg"},
    {"LeftUpperLeg", "LeftLowerLeg"},
    {"LeftLowerLeg", "LeftFoot"},
    {"LowerTorso", "RightUpperLeg"},
    {"RightUpperLeg", "RightLowerLeg"},
    {"RightLowerLeg", "RightFoot"},
}

-- Skeleton bone connections for R6
local SKELETON_CONNECTIONS_R6 = {
    {"Head", "Torso"},
    {"Torso", "Left Arm"},
    {"Torso", "Right Arm"},
    {"Torso", "Left Leg"},
    {"Torso", "Right Leg"},
}

-- ============================================
-- NOTIFICATION SYSTEM
-- ============================================
local notificationQueue = {}
local notifScreenGui = nil -- Set when GUI is created

local function sendNotification(title, message, duration)
    duration = duration or 3
    
    -- Streamer Mode: suppress notifications if enabled
    if Settings.StreamerMode.Enabled and Settings.StreamerMode.HideNotifications then return end
    
    if not notifScreenGui then return end
    
    -- Create notification container if not exists
    local notifHolder = notifScreenGui:FindFirstChild("NotifHolder")
    if not notifHolder then
        notifHolder = Instance.new("Frame")
        notifHolder.Name = "NotifHolder"
        notifHolder.Size = UDim2.new(0, 220, 1, 0)
        notifHolder.Position = UDim2.new(1, -230, 0, 40)
        notifHolder.BackgroundTransparency = 1
        notifHolder.Parent = notifScreenGui
    end
    
    -- Count existing notifications for stacking
    local notifCount = 0
    for _, child in ipairs(notifHolder:GetChildren()) do
        if child:IsA("Frame") then notifCount = notifCount + 1 end
    end
    
    -- Create notification frame
    local notif = Instance.new("Frame")
    notif.Size = UDim2.new(1, 0, 0, 50)
    notif.Position = UDim2.new(1, 10, 0, notifCount * 56) -- Start offscreen right
    notif.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
    notif.BorderSizePixel = 1
    notif.BorderColor3 = Color3.fromRGB(60, 60, 75)
    notif.ClipsDescendants = true
    notif.Parent = notifHolder
    
    -- Accent bar on left
    local accentBar = Instance.new("Frame")
    accentBar.Size = UDim2.new(0, 3, 1, 0)
    accentBar.BackgroundColor3 = Color3.fromRGB(200, 100, 180)
    accentBar.BorderSizePixel = 0
    accentBar.Parent = notif
    
    -- Title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -14, 0, 18)
    titleLabel.Position = UDim2.new(0, 10, 0, 4)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(200, 130, 230)
    titleLabel.TextSize = 12
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextTruncate = Enum.TextTruncate.AtEnd
    titleLabel.Parent = notif
    
    -- Message
    local msgLabel = Instance.new("TextLabel")
    msgLabel.Size = UDim2.new(1, -14, 0, 20)
    msgLabel.Position = UDim2.new(0, 10, 0, 22)
    msgLabel.BackgroundTransparency = 1
    msgLabel.Text = message
    msgLabel.TextColor3 = Color3.fromRGB(180, 180, 190)
    msgLabel.TextSize = 11
    msgLabel.Font = Enum.Font.SourceSans
    msgLabel.TextXAlignment = Enum.TextXAlignment.Left
    msgLabel.TextTruncate = Enum.TextTruncate.AtEnd
    msgLabel.Parent = notif
    
    -- Progress bar (bottom, shrinks over time)
    local progressBar = Instance.new("Frame")
    progressBar.Size = UDim2.new(1, 0, 0, 2)
    progressBar.Position = UDim2.new(0, 0, 1, -2)
    progressBar.BackgroundColor3 = Color3.fromRGB(200, 100, 180)
    progressBar.BorderSizePixel = 0
    progressBar.Parent = notif
    
    -- Slide in animation
    task.spawn(function()
        local tweenIn = TweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0, notifCount * 56)
        })
        tweenIn:Play()
        
        -- Progress bar shrink
        local tweenProgress = TweenService:Create(progressBar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
            Size = UDim2.new(0, 0, 0, 2)
        })
        tweenProgress:Play()
        
        task.wait(duration)
        
        -- Slide out
        local tweenOut = TweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            Position = UDim2.new(1, 10, 0, notif.Position.Y.Offset)
        })
        tweenOut:Play()
        tweenOut.Completed:Wait()
        notif:Destroy()
        
        -- Restack remaining notifications
        if notifHolder and notifHolder.Parent then
            local idx = 0
            for _, child in ipairs(notifHolder:GetChildren()) do
                if child:IsA("Frame") then
                    TweenService:Create(child, TweenInfo.new(0.2), {
                        Position = UDim2.new(child.Position.X.Scale, child.Position.X.Offset, 0, idx * 56)
                    }):Play()
                    idx = idx + 1
                end
            end
        end
    end)
end

-- ============================================
-- UTILITY FUNCTIONS
-- ============================================
local function isSameTeam(player1, player2)
    if not player1.Team or not player2.Team then return false end
    return player1.Team == player2.Team
end

-- ESP filter-aware target check
local function isValidESPTarget(admin, target)
    if target == admin then return false end
    local mode = Settings.ESP.FilterMode
    if mode == "All (No Team Check)" then
        return true
    elseif mode == "All" then
        return true
    elseif mode == "Team" then
        return isSameTeam(admin, target)
    else -- "Enemies" (default)
        return not isSameTeam(admin, target)
    end
end

-- Non-ESP target check (aimbot, auto TP — always enemies only)
local function isValidTarget(admin, target)
    if target == admin then return false end
    if isSameTeam(admin, target) then return false end
    return true
end

local function hasLineOfSight(admin, target)
    local adminChar = admin.Character
    local targetChar = target.Character
    if not adminChar or not targetChar then return false end
    local adminHead = adminChar:FindFirstChild("Head")
    local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
    if not adminHead or not targetHRP then return false end
    
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    raycastParams.FilterDescendantsInstances = {adminChar, targetChar}
    
    local result = Workspace:Raycast(adminHead.Position, (targetHRP.Position - adminHead.Position), raycastParams)
    return result == nil
end

local function isInFOV(target, fovRadius)
    local camera = Workspace.CurrentCamera
    if not camera then return false end
    local targetChar = target.Character
    if not targetChar then return false end
    
    local lockPart = Settings.Aimbot.LockPart
    local targetPart = targetChar:FindFirstChild(lockPart) or targetChar:FindFirstChild("Head") or targetChar:FindFirstChild("HumanoidRootPart")
    if not targetPart then return false end
    
    local screenPos, onScreen = camera:WorldToViewportPoint(targetPart.Position)
    if not onScreen or screenPos.Z < 0 then return false end
    
    local screenCenter = camera.ViewportSize / 2
    local targetScreenPos = Vector2.new(screenPos.X, screenPos.Y)
    local distanceFromCenter = (targetScreenPos - screenCenter).Magnitude
    
    return distanceFromCenter <= fovRadius
end

local function getNearestValidTarget()
    local adminChar = player.Character
    if not adminChar then return nil end
    local adminHRP = adminChar:FindFirstChild("HumanoidRootPart")
    if not adminHRP then return nil end
    
    local camera = Workspace.CurrentCamera
    if not camera then return nil end
    
    local screenCenter = camera.ViewportSize / 2
    local nearestPlayer, nearestScreenDistance = nil, math.huge
    local fovRadius = Settings.Aimbot.FOVRadius
    local requireLOS = Settings.Aimbot.RequireLOS
    local maxDistance = Settings.Aimbot.MaxDistance
    
    for _, target in ipairs(Players:GetPlayers()) do
        if isValidTarget(player, target) then
            local targetChar = target.Character
            if targetChar then
                local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
                local targetHumanoid = targetChar:FindFirstChild("Humanoid")
                
                if targetHRP and targetHumanoid and targetHumanoid.Health > 0 then
                    local worldDistance = (adminHRP.Position - targetHRP.Position).Magnitude
                    
                    if worldDistance <= maxDistance then
                        local lockPart = Settings.Aimbot.LockPart
                        local targetPart = targetChar:FindFirstChild(lockPart) or targetChar:FindFirstChild("Head") or targetHRP
                        
                        if targetPart then
                            local screenPos, onScreen = camera:WorldToViewportPoint(targetPart.Position)
                            
                            if onScreen and screenPos.Z > 0 then
                                local targetScreenPos = Vector2.new(screenPos.X, screenPos.Y)
                                local screenDistance = (targetScreenPos - screenCenter).Magnitude
                                
                                if screenDistance <= fovRadius then
                                    if not requireLOS or hasLineOfSight(player, target) then
                                        if screenDistance < nearestScreenDistance then
                                            nearestScreenDistance = screenDistance
                                            nearestPlayer = target
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    
    return nearestPlayer
end

local function getPredictedPosition(targetChar)
    local lockPart = Settings.Aimbot.LockPart
    local targetPart = targetChar:FindFirstChild(lockPart) or targetChar:FindFirstChild("Head") or targetChar:FindFirstChild("HumanoidRootPart")
    if not targetPart then return nil end
    
    local position = targetPart.Position
    
    if Settings.Aimbot.Prediction then
        local hrp = targetChar:FindFirstChild("HumanoidRootPart")
        if hrp then
            position = position + (hrp.AssemblyLinearVelocity * Settings.Aimbot.PredictionAmount)
        end
    end
    
    return position
end

local function startAimbotTracking()
    if rightMouseTracking then
        rightMouseTracking:Disconnect()
        rightMouseTracking = nil
    end
    
    isTracking = true
    currentTarget = getNearestValidTarget()
    
    rightMouseTracking = RunService.RenderStepped:Connect(function()
        if isUnloading or _G.BinxixUnloaded then return end
        if not Settings.Aimbot.Enabled then return end
        if not isTracking then return end
        
        local camera = Workspace.CurrentCamera
        if not camera then return end
        
        -- Find best target if we don't have one or current is invalid
        if not currentTarget or not currentTarget.Character then
            currentTarget = getNearestValidTarget()
        else
            -- Check if current target is still valid
            local targetChar = currentTarget.Character
            if targetChar then
                local targetHumanoid = targetChar:FindFirstChild("Humanoid")
                if not targetHumanoid or targetHumanoid.Health <= 0 then
                    currentTarget = getNearestValidTarget()
                elseif not isInFOV(currentTarget, Settings.Aimbot.FOVRadius) then
                    -- Target left FOV, find new one
                    if not Settings.Aimbot.StickyAim then
                        currentTarget = getNearestValidTarget()
                    end
                elseif Settings.Aimbot.RequireLOS and not hasLineOfSight(player, currentTarget) then
                    -- Lost line of sight
                    currentTarget = getNearestValidTarget()
                end
            else
                currentTarget = getNearestValidTarget()
            end
        end
        
        -- Aim at target
        if currentTarget and currentTarget.Character then
            local targetPos = getPredictedPosition(currentTarget.Character)
            if targetPos then
                local smoothness = Settings.Aimbot.Smoothness
                local targetCFrame = CFrame.new(camera.CFrame.Position, targetPos)
                camera.CFrame = camera.CFrame:Lerp(targetCFrame, smoothness)
            end
        end
    end)
    
    table.insert(allConnections, rightMouseTracking)
end

local function stopAimbotTracking()
    isTracking = false
    currentTarget = nil
    
    if rightMouseTracking then
        rightMouseTracking:Disconnect()
        rightMouseTracking = nil
    end
end

local function getESPColor(distance)
    if distance < 30 then return Theme.ESP_Close
    elseif distance < 75 then return Theme.ESP_Medium
    elseif distance < 150 then return Theme.ESP_Far
    else return Theme.ESP_VeryFar end
end

local function getHealthColor(percent)
    if percent > 0.6 then return Color3.fromRGB(80, 255, 80)
    elseif percent > 0.3 then return Color3.fromRGB(255, 200, 50)
    else return Color3.fromRGB(255, 60, 60) end
end

-- ============================================
-- COMPLETE ESP SYSTEM
-- ============================================
local espObjects = {}

local function createESPForPlayer(target)
    if target == player then return end
    if espObjects[target.UserId] then return end
    
    local espData = {
        billboard = nil,
        box = nil,
        tracer = nil,
        healthBar = nil,
    }
    
    -- Create BillboardGui for name/distance/health
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "BinxixESP"
    billboard.AlwaysOnTop = true
    billboard.Size = UDim2.new(0, 150, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.LightInfluence = 0
    billboard.MaxDistance = 1000
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "NameLabel"
    nameLabel.Size = UDim2.new(1, 0, 0, 14)
    nameLabel.Position = UDim2.new(0, 0, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = target.Name
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextStrokeTransparency = 0
    nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    nameLabel.TextSize = 13
    nameLabel.Font = Enum.Font.SourceSansBold
    nameLabel.Parent = billboard
    
    local distanceLabel = Instance.new("TextLabel")
    distanceLabel.Name = "DistanceLabel"
    distanceLabel.Size = UDim2.new(1, 0, 0, 12)
    distanceLabel.Position = UDim2.new(0, 0, 0, 14)
    distanceLabel.BackgroundTransparency = 1
    distanceLabel.Text = "[0m]"
    distanceLabel.TextColor3 = Theme.ESP_Far
    distanceLabel.TextStrokeTransparency = 0
    distanceLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    distanceLabel.TextSize = 11
    distanceLabel.Font = Enum.Font.SourceSans
    distanceLabel.Parent = billboard
    
    local healthLabel = Instance.new("TextLabel")
    healthLabel.Name = "HealthLabel"
    healthLabel.Size = UDim2.new(1, 0, 0, 12)
    healthLabel.Position = UDim2.new(0, 0, 0, 26)
    healthLabel.BackgroundTransparency = 1
    healthLabel.Text = "100 HP"
    healthLabel.TextColor3 = Color3.fromRGB(80, 255, 80)
    healthLabel.TextStrokeTransparency = 0
    healthLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    healthLabel.TextSize = 11
    healthLabel.Font = Enum.Font.SourceSans
    healthLabel.Parent = billboard
    
    espData.billboard = billboard
    espData.nameLabel = nameLabel
    espData.distanceLabel = distanceLabel
    espData.healthLabel = healthLabel
    
    espObjects[target.UserId] = espData
end

local function removeESPForPlayer(target)
    local espData = espObjects[target.UserId]
    if espData then
        if espData.billboard then espData.billboard:Destroy() end
        if espData.boxGui then espData.boxGui:Destroy() end
        if espData.boxHighlight then espData.boxHighlight:Destroy() end
        espObjects[target.UserId] = nil
    end
end

local function clearAllESP()
    for userId, espData in pairs(espObjects) do
        if espData.billboard then espData.billboard:Destroy() end
        if espData.boxGui then espData.boxGui:Destroy() end
        if espData.boxHighlight then espData.boxHighlight:Destroy() end
    end
    espObjects = {}
end

local function updateESP()
    if not Settings.ESP.Enabled then
        -- Hide all ESP
        for userId, espData in pairs(espObjects) do
            if espData.billboard then espData.billboard.Enabled = false end
            if espData.boxGui then espData.boxGui.Visible = false end
        end
        return
    end
    
    local myChar = player.Character
    if not myChar then return end
    local myHRP = myChar:FindFirstChild("HumanoidRootPart")
    if not myHRP then return end
    
    for _, target in ipairs(Players:GetPlayers()) do
        if target ~= player and isValidESPTarget(player, target) then
            local targetChar = target.Character
            if targetChar then
                local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
                local targetHead = targetChar:FindFirstChild("Head")
                local targetHumanoid = targetChar:FindFirstChild("Humanoid")
                
                if targetHRP and targetHead and targetHumanoid then
                    -- Create ESP if not exists
                    if not espObjects[target.UserId] then
                        createESPForPlayer(target)
                    end
                    
                    local espData = espObjects[target.UserId]
                    if espData and espData.billboard then
                        -- Attach billboard to head
                        espData.billboard.Adornee = targetHead
                        espData.billboard.Parent = targetChar
                        espData.billboard.Enabled = true
                        
                        -- Calculate distance
                        local distance = (myHRP.Position - targetHRP.Position).Magnitude
                        local espColor = getESPColor(distance)
                        
                        -- Update name
                        if espData.nameLabel then
                            espData.nameLabel.Visible = Settings.ESP.NameEnabled
                            -- Streamer Mode: hide real names
                            if Settings.StreamerMode.Enabled and Settings.StreamerMode.HideNames then
                                espData.nameLabel.Text = Settings.StreamerMode.FakeName .. " #" .. tostring(target.UserId):sub(-3)
                            else
                                espData.nameLabel.Text = target.DisplayName
                            end
                            espData.nameLabel.TextColor3 = Settings.ESP.RainbowColor and Color3.fromHSV(tick() % 5 / 5, 1, 1) or espColor
                        end
                        
                        -- Update distance
                        if espData.distanceLabel then
                            espData.distanceLabel.Visible = Settings.ESP.DistanceEnabled
                            espData.distanceLabel.Text = string.format("[%dm]", math.floor(distance))
                            espData.distanceLabel.TextColor3 = espColor
                        end
                        
                        -- Update health
                        if espData.healthLabel then
                            espData.healthLabel.Visible = Settings.ESP.HealthEnabled
                            local health = targetHumanoid.Health
                            local maxHealth = targetHumanoid.MaxHealth
                            local healthPercent = health / maxHealth
                            espData.healthLabel.Text = string.format("%d HP", math.floor(health))
                            espData.healthLabel.TextColor3 = getHealthColor(healthPercent)
                        end
                        
                        -- Box ESP using Highlight
                        if Settings.ESP.BoxEnabled then
                            if not espData.boxHighlight then
                                espData.boxHighlight = Instance.new("Highlight")
                                espData.boxHighlight.Name = "BinxixBoxESP"
                                espData.boxHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            end
                            -- Chams: if enabled, show fill color through walls
                            if Settings.ESP.ChamsEnabled then
                                espData.boxHighlight.FillTransparency = Settings.ESP.ChamsFillTransparency
                                espData.boxHighlight.FillColor = Settings.ESP.RainbowColor and Color3.fromHSV(tick() % 5 / 5, 1, 1) or espColor
                            else
                                espData.boxHighlight.FillTransparency = 1
                            end
                            espData.boxHighlight.OutlineTransparency = Settings.ESP.OutlineEnabled and 0 or 1
                            espData.boxHighlight.Parent = targetChar
                            espData.boxHighlight.OutlineColor = Settings.ESP.RainbowOutline and Color3.fromHSV(tick() % 5 / 5, 1, 1) or espColor
                            espData.boxHighlight.Enabled = true
                        else
                            if espData.boxHighlight then
                                espData.boxHighlight.Enabled = false
                            end
                        end
                    end
                end
            end
        else
            -- Remove ESP for invalid targets
            if espObjects[target.UserId] then
                removeESPForPlayer(target)
            end
        end
    end
end

-- ============================================
-- TARGET LOCK MARKER (Highlight)
-- ============================================
local targetHighlight = nil

local function updateTargetMarker()
    -- Hide lock marker when Streamer Mode is on
    if Settings.StreamerMode.Enabled then
        if targetHighlight then
            targetHighlight.Parent = nil
        end
        return
    end
    
    if currentTarget and currentTarget.Character and isTracking then
        if not targetHighlight then
            targetHighlight = Instance.new("Highlight")
            targetHighlight.Name = "BinxixLockMarker"
            targetHighlight.FillColor = Theme.AccentPink
            targetHighlight.FillTransparency = 0.7
            targetHighlight.OutlineColor = Theme.AccentBright
            targetHighlight.OutlineTransparency = 0
            targetHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        end
        targetHighlight.Parent = currentTarget.Character
    else
        if targetHighlight then
            targetHighlight.Parent = nil
        end
    end
end

-- ============================================
-- IMPROVED NO FOG FUNCTION
-- ============================================
local originalFogSettings = nil

local function enableNoFog()
    -- Store original settings
    if not originalFogSettings then
        originalFogSettings = {
            FogStart = Lighting.FogStart,
            FogEnd = Lighting.FogEnd,
            FogColor = Lighting.FogColor,
            Atmospheres = {}
        }
        
        -- Store atmosphere settings
        for _, effect in ipairs(Lighting:GetChildren()) do
            if effect:IsA("Atmosphere") then
                table.insert(originalFogSettings.Atmospheres, {
                    instance = effect,
                    Density = effect.Density,
                    Offset = effect.Offset,
                    Color = effect.Color,
                    Decay = effect.Decay,
                    Glare = effect.Glare,
                    Haze = effect.Haze
                })
            end
        end
    end
    
    -- Remove fog
    Lighting.FogStart = 100000
    Lighting.FogEnd = 100000
    
    -- Remove atmosphere effects
    for _, effect in ipairs(Lighting:GetChildren()) do
        if effect:IsA("Atmosphere") then
            effect.Density = 0
            effect.Offset = 0
            effect.Haze = 0
            effect.Glare = 0
        end
    end
end

local function disableNoFog()
    if originalFogSettings then
        Lighting.FogStart = originalFogSettings.FogStart
        Lighting.FogEnd = originalFogSettings.FogEnd
        Lighting.FogColor = originalFogSettings.FogColor
        
        -- Restore atmosphere settings
        for _, data in ipairs(originalFogSettings.Atmospheres) do
            if data.instance and data.instance.Parent then
                data.instance.Density = data.Density
                data.instance.Offset = data.Offset
                data.instance.Color = data.Color
                data.instance.Decay = data.Decay
                data.instance.Glare = data.Glare
                data.instance.Haze = data.Haze
            end
        end
    end
end

-- ============================================
-- AIRHUB V2 STYLE GUI CREATION
-- ============================================
local function createAirHubStyleGUI()
    -- Main ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "BinxixHub_V6"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.IgnoreGuiInset = true
    screenGui.Parent = player:WaitForChild("PlayerGui")
    notifScreenGui = screenGui -- Set reference for notification system
    
    -- FOV Circle for Aimbot
    local fovCircle = Instance.new("Frame")
    fovCircle.Name = "FOVCircle"
    fovCircle.Size = UDim2.new(0, 300, 0, 300)
    fovCircle.Position = UDim2.new(0.5, 0, 0.5, 0)
    fovCircle.AnchorPoint = Vector2.new(0.5, 0.5)
    fovCircle.BackgroundTransparency = 1
    fovCircle.Visible = false
    fovCircle.Parent = screenGui
    
    local fovCircleCorner = Instance.new("UICorner")
    fovCircleCorner.CornerRadius = UDim.new(1, 0)
    fovCircleCorner.Parent = fovCircle
    
    local fovStroke = Instance.new("UIStroke")
    fovStroke.Color = Theme.AccentPink
    fovStroke.Thickness = 1
    fovStroke.Transparency = 0.5
    fovStroke.Parent = fovCircle
    
    -- Update FOV circle every frame
    local fovUpdateConn = RunService.RenderStepped:Connect(function()
        if isUnloading or _G.BinxixUnloaded then return end
        local radius = Settings.Aimbot.FOVRadius
        fovCircle.Size = UDim2.new(0, radius * 2, 0, radius * 2)
        -- Hide FOV circle when Streamer Mode is on
        if Settings.StreamerMode.Enabled then
            fovCircle.Visible = false
        else
            fovCircle.Visible = Settings.Aimbot.Enabled and Settings.Aimbot.ShowFOV
        end
        fovStroke.Transparency = 1 - Settings.Aimbot.FOVOpacity
    end)
    table.insert(allConnections, fovUpdateConn)
    
    -- Tracer Container (Optimized — line pooling)
    local tracerContainer = Instance.new("Frame")
    tracerContainer.Name = "TracerContainer"
    tracerContainer.Size = UDim2.new(1, 0, 1, 0)
    tracerContainer.BackgroundTransparency = 1
    tracerContainer.Parent = screenGui
    
    local tracerLinePool = {}
    local tracerPoolIndex = 0
    local TRACER_POOL_MAX = 30
    
    for i = 1, TRACER_POOL_MAX do
        local line = Instance.new("Frame")
        line.BackgroundColor3 = Color3.new(1, 1, 1)
        line.BorderSizePixel = 0
        line.AnchorPoint = Vector2.new(0.5, 0.5)
        line.Visible = false
        line.Parent = tracerContainer
        tracerLinePool[i] = line
    end
    
    local function resetTracerPool()
        for i = 1, tracerPoolIndex do
            tracerLinePool[i].Visible = false
        end
        tracerPoolIndex = 0
    end
    
    local function getTracerLine()
        tracerPoolIndex = tracerPoolIndex + 1
        if tracerPoolIndex > TRACER_POOL_MAX then
            tracerPoolIndex = TRACER_POOL_MAX
            return nil
        end
        return tracerLinePool[tracerPoolIndex]
    end
    
    local function updateTracers()
        resetTracerPool()
        
        if not Settings.ESP.Enabled or not Settings.ESP.TracerEnabled then return end
        
        local myChar = player.Character
        if not myChar then return end
        local myHRP = myChar:FindFirstChild("HumanoidRootPart")
        if not myHRP then return end
        
        local camera = Workspace.CurrentCamera
        if not camera then return end
        
        local screenSize = camera.ViewportSize
        local tracerOrigin = Settings.ESP.TracerOrigin
        local startPos
        
        if tracerOrigin == "Bottom" then
            startPos = Vector2.new(screenSize.X / 2, screenSize.Y)
        elseif tracerOrigin == "Center" then
            startPos = Vector2.new(screenSize.X / 2, screenSize.Y / 2)
        elseif tracerOrigin == "Mouse" then
            local mouse = player:GetMouse()
            startPos = Vector2.new(mouse.X, mouse.Y)
        else
            startPos = Vector2.new(screenSize.X / 2, screenSize.Y)
        end
        
        for _, target in ipairs(Players:GetPlayers()) do
            if target ~= player and isValidESPTarget(player, target) then
                local targetChar = target.Character
                if targetChar then
                    local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
                    if targetHRP then
                        local screenPos, onScreen = camera:WorldToViewportPoint(targetHRP.Position)
                        
                        if onScreen and screenPos.Z > 0 then
                            local line = getTracerLine()
                            if not line then break end
                            
                            local targetScreenPos = Vector2.new(screenPos.X, screenPos.Y)
                            local distance = (myHRP.Position - targetHRP.Position).Magnitude
                            local espColor = getESPColor(distance)
                            
                            if Settings.ESP.RainbowColor then
                                espColor = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                            end
                            
                            local thickness = Settings.ESP.TracerThickness or 1
                            local lineDist = (targetScreenPos - startPos).Magnitude
                            local center = (startPos + targetScreenPos) / 2
                            local angle = math.atan2(targetScreenPos.Y - startPos.Y, targetScreenPos.X - startPos.X)
                            
                            line.Size = UDim2.new(0, lineDist, 0, thickness)
                            line.Position = UDim2.new(0, center.X, 0, center.Y)
                            line.Rotation = math.deg(angle)
                            line.BackgroundColor3 = espColor
                            line.Visible = true
                        end
                    end
                end
            end
        end
    end
    
    -- ========================================
    -- SKELETON ESP (Optimized — line pooling, no per-frame GC)
    -- ========================================
    local skeletonContainer = Instance.new("Frame")
    skeletonContainer.Name = "SkeletonContainer"
    skeletonContainer.Size = UDim2.new(1, 0, 1, 0)
    skeletonContainer.BackgroundTransparency = 1
    skeletonContainer.Parent = screenGui
    
    local skeletonLinePool = {} -- All pre-created line frames
    local skeletonPoolIndex = 0 -- How many are currently in use
    local SKELETON_POOL_MAX = 200 -- Max lines we'll ever need (14 bones * ~12 players)
    
    -- Pre-create the line pool
    for i = 1, SKELETON_POOL_MAX do
        local line = Instance.new("Frame")
        line.BackgroundColor3 = Color3.new(1, 1, 1)
        line.BorderSizePixel = 0
        line.AnchorPoint = Vector2.new(0.5, 0.5)
        line.Visible = false
        line.Parent = skeletonContainer
        skeletonLinePool[i] = line
    end
    
    local function resetSkeletonPool()
        -- Hide all lines from last frame
        for i = 1, skeletonPoolIndex do
            skeletonLinePool[i].Visible = false
        end
        skeletonPoolIndex = 0
    end
    
    local function getSkeletonLine()
        skeletonPoolIndex = skeletonPoolIndex + 1
        if skeletonPoolIndex > SKELETON_POOL_MAX then
            skeletonPoolIndex = SKELETON_POOL_MAX
            return nil
        end
        return skeletonLinePool[skeletonPoolIndex]
    end
    
    local function updateSkeletonESP()
        resetSkeletonPool()
        
        if not Settings.ESP.Enabled or not Settings.ESP.SkeletonEnabled then return end
        
        local myChar = player.Character
        if not myChar then return end
        local myHRP = myChar:FindFirstChild("HumanoidRootPart")
        if not myHRP then return end
        
        local camera = Workspace.CurrentCamera
        if not camera then return end
        
        for _, target in ipairs(Players:GetPlayers()) do
            if target ~= player and isValidESPTarget(player, target) then
                local targetChar = target.Character
                if targetChar then
                    local distance = 1000
                    local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
                    if targetHRP then
                        distance = (myHRP.Position - targetHRP.Position).Magnitude
                    end
                    
                    -- Skip skeleton for very far players to save performance
                    if distance > 500 then continue end
                    
                    local espColor = getESPColor(distance)
                    if Settings.ESP.RainbowColor then
                        espColor = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                    end
                    
                    -- Determine if R15 or R6
                    local isR15 = targetChar:FindFirstChild("UpperTorso") ~= nil
                    local connections = isR15 and SKELETON_CONNECTIONS_R15 or SKELETON_CONNECTIONS_R6
                    
                    local thickness = Settings.ESP.SkeletonThickness or 1
                    
                    for _, connection in ipairs(connections) do
                        local part1 = targetChar:FindFirstChild(connection[1])
                        local part2 = targetChar:FindFirstChild(connection[2])
                        
                        if part1 and part2 then
                            local pos1, onScreen1 = camera:WorldToViewportPoint(part1.Position)
                            local pos2, onScreen2 = camera:WorldToViewportPoint(part2.Position)
                            
                            if pos1.Z > 0 and pos2.Z > 0 then
                                local line = getSkeletonLine()
                                if not line then break end
                                
                                local screenPos1 = Vector2.new(pos1.X, pos1.Y)
                                local screenPos2 = Vector2.new(pos2.X, pos2.Y)
                                local lineDist = (screenPos2 - screenPos1).Magnitude
                                local center = (screenPos1 + screenPos2) / 2
                                local angle = math.atan2(screenPos2.Y - screenPos1.Y, screenPos2.X - screenPos1.X)
                                
                                line.Size = UDim2.new(0, lineDist, 0, thickness)
                                line.Position = UDim2.new(0, center.X, 0, center.Y)
                                line.Rotation = math.deg(angle)
                                line.BackgroundColor3 = espColor
                                line.Visible = true
                            end
                        end
                    end
                end
            end
        end
    end
    
    -- ========================================
    -- OFFSCREEN ARROWS
    -- ========================================
    local arrowContainer = Instance.new("Frame")
    arrowContainer.Name = "ArrowContainer"
    arrowContainer.Size = UDim2.new(1, 0, 1, 0)
    arrowContainer.BackgroundTransparency = 1
    arrowContainer.Parent = screenGui
    
    local offscreenArrows = {}
    
    local function createArrow(color, size)
        -- Container for the arrow + label
        local container = Instance.new("Frame")
        container.Size = UDim2.new(0, size + 30, 0, size + 16)
        container.BackgroundTransparency = 1
        container.AnchorPoint = Vector2.new(0.5, 0.5)
        container.Parent = arrowContainer
        
        -- Outer glow arrow (slightly larger, dimmer)
        local glow = Instance.new("ImageLabel")
        glow.Size = UDim2.new(0, size + 8, 0, size + 8)
        glow.Position = UDim2.new(0.5, 0, 0, 0)
        glow.AnchorPoint = Vector2.new(0.5, 0)
        glow.BackgroundTransparency = 1
        glow.Image = "rbxassetid://3926305904"
        glow.ImageRectOffset = Vector2.new(764, 764)
        glow.ImageRectSize = Vector2.new(36, 36)
        glow.ImageColor3 = color
        glow.ImageTransparency = 0.6
        glow.Parent = container
        
        -- Main arrow
        local arrow = Instance.new("ImageLabel")
        arrow.Size = UDim2.new(0, size, 0, size)
        arrow.Position = UDim2.new(0.5, 0, 0, 4)
        arrow.AnchorPoint = Vector2.new(0.5, 0)
        arrow.BackgroundTransparency = 1
        arrow.Image = "rbxassetid://3926305904"
        arrow.ImageRectOffset = Vector2.new(764, 764)
        arrow.ImageRectSize = Vector2.new(36, 36)
        arrow.ImageColor3 = color
        arrow.Parent = container
        
        -- Distance label below arrow
        local distLabel = Instance.new("TextLabel")
        distLabel.Size = UDim2.new(1, 0, 0, 12)
        distLabel.Position = UDim2.new(0, 0, 1, -12)
        distLabel.BackgroundTransparency = 1
        distLabel.Text = ""
        distLabel.TextColor3 = color
        distLabel.TextSize = 10
        distLabel.Font = Enum.Font.SourceSansBold
        distLabel.TextStrokeTransparency = 0.4
        distLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        distLabel.Parent = container
        
        return {container = container, arrow = arrow, glow = glow, distLabel = distLabel}
    end
    
    local function updateOffscreenArrows()
        -- Clear old arrows
        for userId, arrowData in pairs(offscreenArrows) do
            if arrowData and arrowData.container then arrowData.container:Destroy() end
        end
        offscreenArrows = {}
        
        if not Settings.ESP.Enabled or not Settings.ESP.OffscreenArrows then return end
        
        local myChar = player.Character
        if not myChar then return end
        local myHRP = myChar:FindFirstChild("HumanoidRootPart")
        if not myHRP then return end
        
        local camera = Workspace.CurrentCamera
        if not camera then return end
        
        local screenSize = camera.ViewportSize
        local screenCenter = Vector2.new(screenSize.X / 2, screenSize.Y / 2)
        local padding = 60
        
        for _, target in ipairs(Players:GetPlayers()) do
            if target ~= player and isValidESPTarget(player, target) then
                local targetChar = target.Character
                if targetChar then
                    local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
                    if targetHRP then
                        local distance = (myHRP.Position - targetHRP.Position).Magnitude
                        
                        -- Only show arrows within max distance
                        if distance <= (Settings.ESP.ArrowDistance or 500) then
                            local screenPos, onScreen = camera:WorldToViewportPoint(targetHRP.Position)
                            
                            -- Only show arrow if offscreen
                            if not onScreen or screenPos.Z < 0 then
                                local espColor = getESPColor(distance)
                                if Settings.ESP.RainbowColor then
                                    espColor = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                                end
                                
                                -- Calculate direction to target
                                local direction = (targetHRP.Position - camera.CFrame.Position)
                                local flatDirection = Vector3.new(direction.X, 0, direction.Z).Unit
                                local cameraLook = Vector3.new(camera.CFrame.LookVector.X, 0, camera.CFrame.LookVector.Z).Unit
                                local cameraRight = Vector3.new(camera.CFrame.RightVector.X, 0, camera.CFrame.RightVector.Z).Unit
                                
                                -- Get 2D angle
                                local dotForward = flatDirection:Dot(cameraLook)
                                local dotRight = flatDirection:Dot(cameraRight)
                                local angle = math.atan2(dotRight, dotForward)
                                
                                -- Calculate arrow position on screen edge with elliptical clamping
                                local radiusX = screenSize.X / 2 - padding
                                local radiusY = screenSize.Y / 2 - padding
                                local arrowX = screenCenter.X + math.sin(angle) * radiusX
                                local arrowY = screenCenter.Y - math.cos(angle) * radiusY
                                
                                -- Clamp to screen bounds
                                arrowX = math.clamp(arrowX, padding, screenSize.X - padding)
                                arrowY = math.clamp(arrowY, padding, screenSize.Y - padding)
                                
                                local arrowSize = Settings.ESP.ArrowSize or 20
                                local arrowData = createArrow(espColor, arrowSize)
                                arrowData.container.Position = UDim2.new(0, arrowX, 0, arrowY)
                                arrowData.arrow.Rotation = math.deg(angle)
                                arrowData.glow.Rotation = math.deg(angle)
                                arrowData.distLabel.Text = math.floor(distance) .. "m"
                                arrowData.distLabel.TextColor3 = espColor
                                
                                offscreenArrows[target.UserId] = arrowData
                            end
                        end
                    end
                end
            end
        end
    end
    
    -- ESP Update Loop
    local espUpdateConn = RunService.RenderStepped:Connect(function()
        if isUnloading or _G.BinxixUnloaded then return end
        updateESP()
        updateTracers()
        updateSkeletonESP()
        updateOffscreenArrows()
        updateTargetMarker()
    end)
    table.insert(allConnections, espUpdateConn)
    
    -- Handle player leaving (cleanup ESP)
    local playerRemovingConn = Players.PlayerRemoving:Connect(function(target)
        if espObjects[target.UserId] then
            removeESPForPlayer(target)
        end
    end)
    table.insert(allConnections, playerRemovingConn)
    
    -- Main Frame (AirHub V2 style - compact, no rounded corners)
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 500, 0, 520)
    mainFrame.Position = UDim2.new(0.5, -250, 0.5, -260)
    mainFrame.BackgroundColor3 = Theme.BackgroundDark
    mainFrame.BorderSizePixel = 1
    mainFrame.BorderColor3 = Theme.Border
    mainFrame.Active = true
    mainFrame.Visible = true
    mainFrame.Parent = screenGui
    
    -- Register mainFrame for theme updates
    table.insert(themeUpdateCallbacks, function()
        mainFrame.BackgroundColor3 = Theme.BackgroundDark
        mainFrame.BorderColor3 = Theme.Border
    end)
    
    -- Title Bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 22)
    titleBar.BackgroundColor3 = Theme.BackgroundDark
    titleBar.BorderSizePixel = 0
    titleBar.Active = true
    titleBar.Parent = mainFrame
    
    table.insert(themeUpdateCallbacks, function()
        titleBar.BackgroundColor3 = Theme.BackgroundDark
    end)
    
    -- Custom drag system (replaces deprecated .Draggable)
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    local dragConn = UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    table.insert(allConnections, dragConn)
    
    -- Title Text
    local titleText = Instance.new("TextLabel")
    titleText.Size = UDim2.new(0, 200, 1, 0)
    titleText.Position = UDim2.new(0, 6, 0, 0)
    titleText.BackgroundTransparency = 1
    titleText.Text = "Binxix Hub V6"
    titleText.TextColor3 = Theme.TextPrimary
    titleText.TextSize = 12
    titleText.Font = Enum.Font.SourceSans
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.Parent = titleBar
    
    -- Close Button (X)
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 22, 0, 22)
    closeBtn.Position = UDim2.new(1, -22, 0, 0)
    closeBtn.BackgroundColor3 = Theme.BackgroundDark
    closeBtn.BorderSizePixel = 0
    closeBtn.Text = "×"
    closeBtn.TextColor3 = Theme.TextSecondary
    closeBtn.TextSize = 18
    closeBtn.Font = Enum.Font.SourceSans
    closeBtn.Parent = titleBar
    
    closeBtn.MouseEnter:Connect(function()
        closeBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
        closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    closeBtn.MouseLeave:Connect(function()
        closeBtn.BackgroundColor3 = Theme.BackgroundDark
        closeBtn.TextColor3 = Theme.TextSecondary
    end)
    closeBtn.MouseButton1Click:Connect(function()
        mainFrame.Visible = false
    end)
    
    -- Title underline
    local titleLine = Instance.new("Frame")
    titleLine.Size = UDim2.new(1, 0, 0, 1)
    titleLine.Position = UDim2.new(0, 0, 1, -1)
    titleLine.BackgroundColor3 = Theme.Border
    titleLine.BorderSizePixel = 0
    titleLine.Parent = titleBar
    
    -- Tab Container
    local tabContainer = Instance.new("Frame")
    tabContainer.Name = "TabContainer"
    tabContainer.Size = UDim2.new(1, 0, 0, 24)
    tabContainer.Position = UDim2.new(0, 0, 0, 22)
    tabContainer.BackgroundColor3 = Theme.BackgroundDark
    tabContainer.BorderSizePixel = 0
    tabContainer.Parent = mainFrame
    
    -- Tab underline
    local tabLine = Instance.new("Frame")
    tabLine.Size = UDim2.new(1, 0, 0, 1)
    tabLine.Position = UDim2.new(0, 0, 1, -1)
    tabLine.BackgroundColor3 = Theme.Border
    tabLine.BorderSizePixel = 0
    tabLine.Parent = tabContainer
    
    -- Content Area
    local contentArea = Instance.new("Frame")
    contentArea.Name = "ContentArea"
    contentArea.Size = UDim2.new(1, -8, 1, -54)
    contentArea.Position = UDim2.new(0, 4, 0, 50)
    contentArea.BackgroundTransparency = 1
    contentArea.BorderSizePixel = 0
    contentArea.Parent = mainFrame
    
    -- Tab system
    local tabs = {"General", "Aimbot", "ESP", "Crosshair", "Players", "Report", "Settings"}
    local tabButtons = {}
    local tabPages = {}
    local activeTab = "General"
    
    -- Tab indicator (the underline that shows active tab)
    local tabIndicator = Instance.new("Frame")
    tabIndicator.Name = "TabIndicator"
    tabIndicator.Size = UDim2.new(0, 54, 0, 2)
    tabIndicator.Position = UDim2.new(0, 6, 1, -2)
    tabIndicator.BackgroundColor3 = Theme.AccentPink
    tabIndicator.BorderSizePixel = 0
    tabIndicator.ZIndex = 2
    tabIndicator.Parent = tabContainer
    
    -- Create tab buttons
    local tabWidth = 54
    for i, tabName in ipairs(tabs) do
        local tabBtn = Instance.new("TextButton")
        tabBtn.Name = tabName .. "Tab"
        tabBtn.Size = UDim2.new(0, tabWidth, 1, 0)
        tabBtn.Position = UDim2.new(0, (i-1) * tabWidth + 6, 0, 0)
        tabBtn.BackgroundTransparency = 1
        tabBtn.Text = tabName
        tabBtn.TextColor3 = i == 1 and Theme.TabActive or Theme.TabInactive
        tabBtn.TextSize = 11
        tabBtn.Font = Enum.Font.SourceSans
        tabBtn.Parent = tabContainer
        tabButtons[tabName] = tabBtn
    end
    
    -- ========================================
    -- UI COMPONENT CREATORS (AirHub V2 Style)
    -- ========================================
    
    -- Create Section Header
    local function createSectionHeader(parent, text, posX, posY)
        local header = Instance.new("TextLabel")
        header.Size = UDim2.new(0, 200, 0, 16)
        header.Position = UDim2.new(0, posX, 0, posY)
        header.BackgroundTransparency = 1
        header.Text = text
        header.TextColor3 = Theme.TextHeader
        header.TextSize = 12
        header.Font = Enum.Font.SourceSansBold
        header.TextXAlignment = Enum.TextXAlignment.Left
        header.Parent = parent
        return header
    end
    
    -- Create Checkbox (AirHub V2 style - simple square)
    local function createCheckbox(parent, text, posX, posY, default, callback)
        local container = Instance.new("Frame")
        container.Size = UDim2.new(0, 200, 0, 16)
        container.Position = UDim2.new(0, posX, 0, posY)
        container.BackgroundTransparency = 1
        container.Parent = parent
        
        -- Checkbox box
        local checkbox = Instance.new("Frame")
        checkbox.Size = UDim2.new(0, 12, 0, 12)
        checkbox.Position = UDim2.new(0, 0, 0, 2)
        checkbox.BackgroundColor3 = default and Theme.CheckboxEnabled or Theme.CheckboxDisabled
        checkbox.BorderSizePixel = 1
        checkbox.BorderColor3 = Theme.BorderLight
        checkbox.Parent = container
        
        -- Label
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -18, 1, 0)
        label.Position = UDim2.new(0, 18, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Theme.TextPrimary
        label.TextSize = 12
        label.Font = Enum.Font.SourceSans
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = container
        
        local isEnabled = default
        
        -- Click handler
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 1, 0)
        btn.BackgroundTransparency = 1
        btn.Text = ""
        btn.Parent = container
        
        btn.MouseButton1Click:Connect(function()
            if isUnloading or _G.BinxixUnloaded then return end
            isEnabled = not isEnabled
            checkbox.BackgroundColor3 = isEnabled and Theme.CheckboxEnabled or Theme.CheckboxDisabled
            if callback then callback(isEnabled) end
        end)
        
        return {
            container = container,
            setValue = function(val)
                isEnabled = val
                checkbox.BackgroundColor3 = isEnabled and Theme.CheckboxEnabled or Theme.CheckboxDisabled
            end,
            getValue = function() return isEnabled end
        }
    end
    
    -- Create Slider (AirHub V2 style - pink bar with value)
    local function createSlider(parent, text, posX, posY, min, max, default, callback)
        local container = Instance.new("Frame")
        container.Size = UDim2.new(0, 200, 0, 30)
        container.Position = UDim2.new(0, posX, 0, posY)
        container.BackgroundTransparency = 1
        container.Parent = parent
        
        -- Label
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0, 120, 0, 14)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Theme.TextPrimary
        label.TextSize = 12
        label.Font = Enum.Font.SourceSans
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = container
        
        -- Value display
        local valueLabel = Instance.new("TextLabel")
        valueLabel.Size = UDim2.new(0, 50, 0, 14)
        valueLabel.Position = UDim2.new(1, -50, 0, 0)
        valueLabel.BackgroundTransparency = 1
        valueLabel.Text = tostring(default)
        valueLabel.TextColor3 = Theme.AccentPink
        valueLabel.TextSize = 12
        valueLabel.Font = Enum.Font.SourceSans
        valueLabel.TextXAlignment = Enum.TextXAlignment.Right
        valueLabel.Parent = container
        
        -- Slider background
        local sliderBg = Instance.new("Frame")
        sliderBg.Size = UDim2.new(1, 0, 0, 4)
        sliderBg.Position = UDim2.new(0, 0, 0, 18)
        sliderBg.BackgroundColor3 = Theme.SliderBackground
        sliderBg.BorderSizePixel = 0
        sliderBg.Parent = container
        
        -- Slider fill
        local sliderFill = Instance.new("Frame")
        sliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
        sliderFill.BackgroundColor3 = Theme.SliderFill
        sliderFill.BorderSizePixel = 0
        sliderFill.Parent = sliderBg
        
        local currentValue = default
        local dragging = false
        
        local sliderBtn = Instance.new("TextButton")
        sliderBtn.Size = UDim2.new(1, 0, 0, 16)
        sliderBtn.Position = UDim2.new(0, 0, 0, 10)
        sliderBtn.BackgroundTransparency = 1
        sliderBtn.Text = ""
        sliderBtn.Parent = container
        
        sliderBtn.MouseButton1Down:Connect(function() dragging = true end)
        
        local inputEndConn = UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
        end)
        table.insert(allConnections, inputEndConn)
        
        local updateConn = RunService.RenderStepped:Connect(function()
            if isUnloading or _G.BinxixUnloaded then return end
            if dragging then
                local mouse = player:GetMouse()
                local relativeX = math.clamp((mouse.X - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1)
                
                if max <= 1 then
                    currentValue = math.floor((min + relativeX * (max - min)) * 100) / 100
                else
                    currentValue = math.floor(min + relativeX * (max - min) + 0.5)
                end
                
                sliderFill.Size = UDim2.new(relativeX, 0, 1, 0)
                valueLabel.Text = tostring(currentValue)
                if callback then callback(currentValue) end
            end
        end)
        table.insert(allConnections, updateConn)
        
        return container
    end
    
    -- Create Dropdown (AirHub V2 style)
    local function createDropdown(parent, text, posX, posY, options, default, callback)
        local container = Instance.new("Frame")
        container.Size = UDim2.new(0, 200, 0, 34)
        container.Position = UDim2.new(0, posX, 0, posY)
        container.BackgroundTransparency = 1
        container.Parent = parent
        
        -- Label
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0, 90, 0, 14)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Theme.TextPrimary
        label.TextSize = 12
        label.Font = Enum.Font.SourceSans
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = container
        
        -- Dropdown button
        local dropBtn = Instance.new("TextButton")
        dropBtn.Size = UDim2.new(0, 100, 0, 18)
        dropBtn.Position = UDim2.new(1, -100, 0, 14)
        dropBtn.BackgroundColor3 = Theme.SliderBackground
        dropBtn.BorderSizePixel = 1
        dropBtn.BorderColor3 = Theme.Border
        dropBtn.Text = default
        dropBtn.TextColor3 = Theme.TextPrimary
        dropBtn.TextSize = 11
        dropBtn.Font = Enum.Font.SourceSans
        dropBtn.Parent = container
        
        -- Arrow
        local arrow = Instance.new("TextLabel")
        arrow.Size = UDim2.new(0, 14, 1, 0)
        arrow.Position = UDim2.new(1, -14, 0, 0)
        arrow.BackgroundTransparency = 1
        arrow.Text = "▼"
        arrow.TextColor3 = Theme.TextDim
        arrow.TextSize = 8
        arrow.Font = Enum.Font.SourceSans
        arrow.Parent = dropBtn
        
        local currentSelection = default
        local isOpen = false
        
        -- Options frame (created on click)
        local optionsFrame = Instance.new("Frame")
        optionsFrame.Size = UDim2.new(0, 100, 0, #options * 18)
        optionsFrame.BackgroundColor3 = Theme.Background
        optionsFrame.BorderSizePixel = 1
        optionsFrame.BorderColor3 = Theme.Border
        optionsFrame.Visible = false
        optionsFrame.ZIndex = 100
        optionsFrame.Parent = screenGui
        
        for i, opt in ipairs(options) do
            local optBtn = Instance.new("TextButton")
            optBtn.Size = UDim2.new(1, 0, 0, 18)
            optBtn.Position = UDim2.new(0, 0, 0, (i-1) * 18)
            optBtn.BackgroundColor3 = Theme.Background
            optBtn.BorderSizePixel = 0
            optBtn.Text = opt
            optBtn.TextColor3 = Theme.TextPrimary
            optBtn.TextSize = 11
            optBtn.Font = Enum.Font.SourceSans
            optBtn.ZIndex = 101
            optBtn.Parent = optionsFrame
            
            optBtn.MouseEnter:Connect(function()
                optBtn.BackgroundColor3 = Theme.AccentDark
            end)
            optBtn.MouseLeave:Connect(function()
                optBtn.BackgroundColor3 = Theme.Background
            end)
            optBtn.MouseButton1Click:Connect(function()
                currentSelection = opt
                dropBtn.Text = opt
                isOpen = false
                optionsFrame.Visible = false
                if callback then callback(opt) end
            end)
        end
        
        dropBtn.MouseButton1Click:Connect(function()
            isOpen = not isOpen
            if isOpen then
                local absPos = dropBtn.AbsolutePosition
                local absSize = dropBtn.AbsoluteSize
                optionsFrame.Position = UDim2.new(0, absPos.X, 0, absPos.Y + absSize.Y)
            end
            optionsFrame.Visible = isOpen
        end)
        
        return container
    end
    
    -- Create Color Picker (simplified)
    local function createColorDisplay(parent, text, posX, posY, defaultColor)
        local container = Instance.new("Frame")
        container.Size = UDim2.new(0, 200, 0, 18)
        container.Position = UDim2.new(0, posX, 0, posY)
        container.BackgroundTransparency = 1
        container.Parent = parent
        
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0, 120, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Theme.TextPrimary
        label.TextSize = 12
        label.Font = Enum.Font.SourceSans
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = container
        
        local colorBox = Instance.new("Frame")
        colorBox.Size = UDim2.new(0, 50, 0, 14)
        colorBox.Position = UDim2.new(1, -50, 0, 2)
        colorBox.BackgroundColor3 = defaultColor
        colorBox.BorderSizePixel = 1
        colorBox.BorderColor3 = Theme.Border
        colorBox.Parent = container
        
        return container
    end
    
    -- ========================================
    -- CREATE TAB PAGES
    -- ========================================
    
    -- ========================================
    -- AUTO TP LOOP SYSTEM (defined before tabs so callbacks can reference it)
    -- Teleports to nearest enemy, waits for them to die, moves to next
    -- ========================================
    local autoTPTarget = nil
    
    -- Check if a target is protected (forcefield, safe zone, spawn, godmode)
    local function isTargetProtected(target)
        local targetChar = target.Character
        if not targetChar then return true end
        
        local targetHumanoid = targetChar:FindFirstChild("Humanoid")
        if not targetHumanoid then return true end
        
        -- Check for ForceField instance on character
        for _, child in ipairs(targetChar:GetChildren()) do
            if child:IsA("ForceField") then
                return true
            end
        end
        
        -- Check if humanoid has forcefield flag (some games use this)
        if targetHumanoid:FindFirstChild("ForceField") then
            return true
        end
        
        -- Check for godmode — health stuck at max or extremely high
        if targetHumanoid.MaxHealth >= 999999 then
            return true
        end
        
        -- Check for spawn protection / invincibility attributes
        local invincibleAttrs = {"Invincible", "SpawnProtection", "Protected", "SafeZone", "Invulnerable", "GodMode", "Shielded"}
        for _, attrName in ipairs(invincibleAttrs) do
            local val = nil
            pcall(function() val = targetChar:GetAttribute(attrName) end)
            if val == true then return true end
            pcall(function() val = targetHumanoid:GetAttribute(attrName) end)
            if val == true then return true end
        end
        
        -- Check for shield/barrier parts or values on character
        for _, child in ipairs(targetChar:GetChildren()) do
            local lowerName = child.Name:lower()
            if lowerName:find("shield") or lowerName:find("barrier") or lowerName:find("safezone") or lowerName:find("forcefield") or lowerName:find("spawn_protect") then
                if child:IsA("Part") or child:IsA("MeshPart") or child:IsA("BoolValue") or child:IsA("ForceField") then
                    if child:IsA("BoolValue") and child.Value == true then
                        return true
                    elseif child:IsA("ForceField") or child:IsA("Part") or child:IsA("MeshPart") then
                        return true
                    end
                end
            end
        end
        
        -- Check if target HRP is inside a known safe zone part in workspace
        local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
        if targetHRP then
            -- Look for common safe zone parts in workspace
            local safeZoneNames = {"SafeZone", "SpawnZone", "Lobby", "SafeArea", "SpawnArea", "Safe_Zone", "Spawn_Zone"}
            for _, zoneName in ipairs(safeZoneNames) do
                local zone = Workspace:FindFirstChild(zoneName, true)
                if zone and zone:IsA("BasePart") then
                    -- Simple AABB check — is the target inside this part?
                    local zonePos = zone.Position
                    local zoneSize = zone.Size / 2
                    local tPos = targetHRP.Position
                    if math.abs(tPos.X - zonePos.X) < zoneSize.X and
                       math.abs(tPos.Y - zonePos.Y) < zoneSize.Y and
                       math.abs(tPos.Z - zonePos.Z) < zoneSize.Z then
                        return true
                    end
                end
            end
        end
        
        return false
    end
    
    local function getNextTPTarget()
        local myChar = player.Character
        if not myChar then return nil end
        local myHRP = myChar:FindFirstChild("HumanoidRootPart")
        if not myHRP then return nil end
        
        local targetName = Settings.Misc.AutoTPTargetName
        
        -- If a specific player is selected, try to find them
        if targetName and targetName ~= "Nearest Enemy" then
            for _, target in ipairs(Players:GetPlayers()) do
                if target ~= player and target.DisplayName == targetName or target.Name == targetName then
                    local targetChar = target.Character
                    if targetChar then
                        local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
                        local targetHumanoid = targetChar:FindFirstChild("Humanoid")
                        if targetHRP and targetHumanoid and targetHumanoid.Health > 0 then
                            if not isTargetProtected(target) then
                                return target
                            end
                        end
                    end
                end
            end
            -- Selected player not found or dead, return nil (wait for them)
            return nil
        end
        
        -- Default: nearest enemy
        local nearest, nearestDist = nil, math.huge
        
        for _, target in ipairs(Players:GetPlayers()) do
            if target ~= player and isValidTarget(player, target) then
                local targetChar = target.Character
                if targetChar then
                    local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
                    local targetHumanoid = targetChar:FindFirstChild("Humanoid")
                    if targetHRP and targetHumanoid and targetHumanoid.Health > 0 then
                        -- Skip protected targets
                        if not isTargetProtected(target) then
                            local dist = (myHRP.Position - targetHRP.Position).Magnitude
                            if dist < nearestDist then
                                nearestDist = dist
                                nearest = target
                            end
                        end
                    end
                end
            end
        end
        
        return nearest
    end
    
    local autoTPLoopConn = nil
    
    local function startAutoTPLoop()
        if autoTPLoopConn then return end -- Already running
        
        autoTPLoopConn = task.spawn(function()
            while Settings.Misc.AutoTPLoop and not isUnloading and not _G.BinxixUnloaded do
                local myChar = player.Character
                local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
                
                if myHRP then
                    -- Find next alive unprotected target
                    autoTPTarget = getNextTPTarget()
                    
                    if autoTPTarget then
                        local targetChar = autoTPTarget.Character
                        if targetChar then
                            local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
                            local targetHumanoid = targetChar:FindFirstChild("Humanoid")
                            
                            if targetHRP and targetHumanoid and targetHumanoid.Health > 0 then
                                -- Void protection: check if target is in a valid position
                                local targetPos = targetHRP.Position
                                local MIN_Y = -50
                                local MAX_Y = 2000
                                local skipTarget = false
                                
                                -- Save our current safe position before TPing
                                local safePosition = myHRP.CFrame
                                
                                -- Check target Y is sane
                                if targetPos.Y < MIN_Y or targetPos.Y > MAX_Y then
                                    -- (notification suppressed)
                                    skipTarget = true
                                end
                                
                                -- Raycast down from target to check there's ground
                                local rayParams = RaycastParams.new()
                                rayParams.FilterType = Enum.RaycastFilterType.Exclude
                                rayParams.FilterDescendantsInstances = {myChar, autoTPTarget.Character}
                                
                                if not skipTarget then
                                    local groundCheck = Workspace:Raycast(targetPos, Vector3.new(0, -200, 0), rayParams)
                                    
                                    if not groundCheck and targetPos.Y > 20 then
                                        -- (notification suppressed)
                                        local waitedForGround = false
                                        for i = 1, 20 do -- Wait up to 2 seconds
                                            task.wait(0.1)
                                            if not Settings.Misc.AutoTPLoop then break end
                                            local tChar = autoTPTarget and autoTPTarget.Character
                                            if not tChar then break end
                                            local tHRP = tChar:FindFirstChild("HumanoidRootPart")
                                            if not tHRP then break end
                                            local tPos = tHRP.Position
                                            if tPos.Y < MIN_Y then break end
                                            local gCheck = Workspace:Raycast(tPos, Vector3.new(0, -200, 0), rayParams)
                                            if gCheck then
                                                waitedForGround = true
                                                targetHRP = tHRP
                                                break
                                            end
                                        end
                                        if not waitedForGround then
                                            skipTarget = true
                                        end
                                    end
                                end
                                
                                if not skipTarget then
                                    -- TP behind the target (2 studs behind, facing them)
                                    local targetCF = targetHRP.CFrame
                                    local lookAtTarget = CFrame.lookAt(targetCF.Position + targetCF.LookVector * 2, targetCF.Position)
                                    myHRP.CFrame = lookAtTarget
                                    
                                    -- Lock camera to face target
                                    local camera = Workspace.CurrentCamera
                                    if camera then
                                        camera.CFrame = CFrame.lookAt(myHRP.Position + Vector3.new(0, 2, 0), targetHRP.Position)
                                    end
                                    
                                    -- Quick void check after TP
                                    task.wait(0.05)
                                    myChar = player.Character
                                    myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
                                    if myHRP and myHRP.Position.Y < MIN_Y then
                                        myHRP.CFrame = safePosition
                                        -- (notification suppressed)
                                        skipTarget = true
                                    end
                                end
                                
                                if not skipTarget then
                                    -- Track target — fast loop
                                    while Settings.Misc.AutoTPLoop and not isUnloading and not _G.BinxixUnloaded do
                                        task.wait(0.05) -- 50ms tick for fast response
                                        
                                        myChar = player.Character
                                        myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
                                        if not myHRP then break end
                                        
                                        -- If WE fell into void, escape back
                                        if myHRP.Position.Y < MIN_Y then
                                            myHRP.CFrame = safePosition
                                            -- (notification suppressed)
                                            break
                                        end
                                        
                                        -- Update safe position while on solid ground
                                        local selfGround = Workspace:Raycast(myHRP.Position, Vector3.new(0, -10, 0), rayParams)
                                        if selfGround then
                                            safePosition = myHRP.CFrame
                                        end
                                        
                                        targetChar = autoTPTarget and autoTPTarget.Character
                                        if not targetChar then break end
                                        targetHumanoid = targetChar:FindFirstChild("Humanoid")
                                        if not targetHumanoid or targetHumanoid.Health <= 0 then break end
                                        targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
                                        if not targetHRP then break end
                                        
                                        if targetHRP.Position.Y < MIN_Y then
                                            -- (notification suppressed)
                                            break
                                        end
                                        
                                        if isTargetProtected(autoTPTarget) then
                                            -- (notification suppressed)
                                            break
                                        end
                                        
                                        -- Stay close — TP if drifted more than 5 studs
                                        local dist = (myHRP.Position - targetHRP.Position).Magnitude
                                        if dist > 5 then
                                            if targetHRP.Position.Y > MIN_Y then
                                                local tCF = targetHRP.CFrame
                                                local stayPos = CFrame.lookAt(tCF.Position + tCF.LookVector * 2, tCF.Position)
                                                myHRP.CFrame = stayPos
                                            end
                                        end
                                        
                                        -- Keep camera locked on target
                                        local cam = Workspace.CurrentCamera
                                        if cam and targetHRP then
                                            cam.CFrame = CFrame.lookAt(myHRP.Position + Vector3.new(0, 1.5, 0), targetHRP.Position + Vector3.new(0, 1, 0))
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                
                -- Delay before finding next target
                local delay = Settings.Misc.AutoTPLoopDelay or 0.5
                task.wait(delay)
            end
            
            autoTPTarget = nil
            autoTPLoopConn = nil
        end)
    end
    
    local function stopAutoTPLoop()
        Settings.Misc.AutoTPLoop = false
        autoTPTarget = nil
        if autoTPLoopConn then
            pcall(function() task.cancel(autoTPLoopConn) end)
            autoTPLoopConn = nil
        end
    end
    
    -- GENERAL TAB
    local generalPage = Instance.new("ScrollingFrame")
    generalPage.Name = "GeneralPage"
    generalPage.Size = UDim2.new(1, 0, 1, 0)
    generalPage.BackgroundTransparency = 1
    generalPage.Visible = true
    generalPage.BorderSizePixel = 0
    generalPage.ScrollBarThickness = 4
    generalPage.ScrollBarImageColor3 = Theme.AccentDark
    generalPage.CanvasSize = UDim2.new(0, 0, 0, 400)
    generalPage.ScrollingDirection = Enum.ScrollingDirection.Y
    generalPage.Parent = contentArea
    tabPages["General"] = generalPage
    
    -- Left column
    createSectionHeader(generalPage, "Movement", 0, 0)
    createCheckbox(generalPage, "Speed Boost", 0, 20, false, function(e)
        Settings.Movement.SpeedEnabled = e
        local char = player.Character
        if char then
            local h = char:FindFirstChild("Humanoid")
            if h then h.WalkSpeed = e and Settings.Movement.Speed or 16 end
        end
    end)
    createSlider(generalPage, "Speed", 0, 40, 16, 200, 16, function(v)
        Settings.Movement.Speed = v
        if Settings.Movement.SpeedEnabled then
            local char = player.Character
            if char then
                local h = char:FindFirstChild("Humanoid")
                if h then h.WalkSpeed = v end
            end
        end
    end)
    createCheckbox(generalPage, "High Jump", 0, 80, false, function(e)
        Settings.Movement.JumpEnabled = e
        local char = player.Character
        if char then
            local h = char:FindFirstChild("Humanoid")
            if h then h.JumpPower = e and Settings.Movement.JumpPower or 50 end
        end
    end)
    createSlider(generalPage, "Jump Power", 0, 100, 50, 300, 50, function(v)
        Settings.Movement.JumpPower = v
        if Settings.Movement.JumpEnabled then
            local char = player.Character
            if char then
                local h = char:FindFirstChild("Humanoid")
                if h then h.JumpPower = v end
            end
        end
    end)
    createCheckbox(generalPage, "Bunny Hop", 0, 140, false, function(e)
        Settings.Movement.BunnyHop = e
    end)
    createSlider(generalPage, "Bhop Speed", 0, 160, 1, 100, 30, function(v)
        Settings.Movement.BunnyHopSpeed = v
    end)
    
    -- Right column
    createSectionHeader(generalPage, "Visuals", 240, 0)
    createCheckbox(generalPage, "Fullbright", 240, 20, false, function(e)
        Settings.Visuals.Fullbright = e
        if e then
            Lighting.Ambient = Color3.fromRGB(255, 255, 255)
            Lighting.Brightness = 2
            Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        else
            Lighting.Ambient = Color3.fromRGB(127, 127, 127)
            Lighting.Brightness = 1
            Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
        end
    end)
    createCheckbox(generalPage, "No Fog", 240, 40, false, function(e)
        Settings.Visuals.NoFog = e
        if e then
            enableNoFog()
        else
            disableNoFog()
        end
    end)
    createCheckbox(generalPage, "Custom FOV", 240, 60, false, function(e)
        Settings.Visuals.CustomFOV = e
        local camera = Workspace.CurrentCamera
        if camera then
            camera.FieldOfView = e and Settings.Visuals.FOVAmount or 70
        end
    end)
    createSlider(generalPage, "FOV Amount", 240, 80, 30, 120, 70, function(v)
        Settings.Visuals.FOVAmount = v
        if Settings.Visuals.CustomFOV then
            local camera = Workspace.CurrentCamera
            if camera then camera.FieldOfView = v end
        end
    end)
    createCheckbox(generalPage, "Show FPS", 240, 110, false, function(e)
        Settings.Visuals.ShowFPS = e
    end)
    createCheckbox(generalPage, "Show Velocity", 240, 130, false, function(e)
        Settings.Visuals.ShowVelocity = e
    end)
    
    -- Movement section (Fly)
    createSectionHeader(generalPage, "Movement", 240, 155)
    createCheckbox(generalPage, "Fly (Press F)", 240, 175, false, function(e)
        Settings.Movement.Fly = e
        if e then
            startFly()
            sendNotification("Fly", "Enabled — press F to toggle", 2)
        else
            stopFly()
            sendNotification("Fly", "Disabled", 2)
        end
    end)
    createSlider(generalPage, "Fly Speed", 240, 195, 10, 200, 50, function(v)
        Settings.Movement.FlySpeed = v
    end)
    
    -- Misc section
    createSectionHeader(generalPage, "Misc", 240, 225)
    createCheckbox(generalPage, "Anti-AFK", 240, 245, false, function(e)
        Settings.Misc.AntiAFK = e
    end)
    createCheckbox(generalPage, "Auto-Rejoin", 240, 265, false, function(e)
        Settings.Misc.AutoRejoin = e
    end)
    
    -- ========================================
    -- CHAT SPAMMER
    -- ========================================
    createSectionHeader(generalPage, "Chat Spammer", 240, 350)
    
    createCheckbox(generalPage, "Chat Spammer", 240, 370, false, function(e)
        Settings.Misc.ChatSpammer = e
        sendNotification("Chat Spammer", e and "Enabled — spamming chat" or "Disabled", 2)
    end)
    
    createSlider(generalPage, "Spam Delay (s)", 240, 390, 0.5, 10, 3, function(v)
        Settings.Misc.ChatSpamDelay = v
    end)
    
    -- Chat spam message input
    local spamMsgLabel = Instance.new("TextLabel")
    spamMsgLabel.Size = UDim2.new(0, 200, 0, 14)
    spamMsgLabel.Position = UDim2.new(0, 240, 0, 425)
    spamMsgLabel.BackgroundTransparency = 1
    spamMsgLabel.Text = "Spam Message:"
    spamMsgLabel.TextColor3 = Theme.TextSecondary
    spamMsgLabel.TextSize = 11
    spamMsgLabel.Font = Enum.Font.SourceSans
    spamMsgLabel.TextXAlignment = Enum.TextXAlignment.Left
    spamMsgLabel.Parent = generalPage
    
    local spamMsgBox = Instance.new("TextBox")
    spamMsgBox.Size = UDim2.new(0, 210, 0, 22)
    spamMsgBox.Position = UDim2.new(0, 240, 0, 440)
    spamMsgBox.BackgroundColor3 = Theme.BackgroundDark
    spamMsgBox.BorderSizePixel = 1
    spamMsgBox.BorderColor3 = Theme.Border
    spamMsgBox.Text = Settings.Misc.ChatSpamMessage
    spamMsgBox.PlaceholderText = "Enter spam message..."
    spamMsgBox.PlaceholderColor3 = Theme.TextDim
    spamMsgBox.TextColor3 = Theme.TextPrimary
    spamMsgBox.TextSize = 11
    spamMsgBox.Font = Enum.Font.SourceSans
    spamMsgBox.TextXAlignment = Enum.TextXAlignment.Left
    spamMsgBox.ClearTextOnFocus = false
    spamMsgBox.Parent = generalPage
    
    spamMsgBox.FocusLost:Connect(function()
        if spamMsgBox.Text ~= "" then
            Settings.Misc.ChatSpamMessage = spamMsgBox.Text
        end
    end)
    
    -- ========================================
    -- GUN MODS SECTION (replaces Kill Aura / Trigger Bot)
    -- ========================================
    createSectionHeader(generalPage, "Gun Mods", 0, 260)
    
    -- WIP / Lag warning
    local gunModWarnLabel = Instance.new("TextLabel")
    gunModWarnLabel.Size = UDim2.new(0, 210, 0, 14)
    gunModWarnLabel.Position = UDim2.new(0, 0, 0, 278)
    gunModWarnLabel.BackgroundTransparency = 1
    gunModWarnLabel.Text = "⚠ May lead to lag — WIP"
    gunModWarnLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
    gunModWarnLabel.TextSize = 10
    gunModWarnLabel.Font = Enum.Font.SourceSansItalic
    gunModWarnLabel.TextXAlignment = Enum.TextXAlignment.Left
    gunModWarnLabel.Parent = generalPage
    
    createCheckbox(generalPage, "Fast Reload", 0, 295, false, function(e)
        Settings.Combat.FastReload = e
        sendNotification("Gun Mods", e and "Fast Reload enabled" or "Fast Reload disabled", 2)
    end)
    createCheckbox(generalPage, "Fast Fire Rate", 0, 315, false, function(e)
        Settings.Combat.FastFireRate = e
        sendNotification("Gun Mods", e and "Fast Fire Rate enabled" or "Fast Fire Rate disabled", 2)
    end)
    createCheckbox(generalPage, "Always Auto", 0, 335, false, function(e)
        Settings.Combat.AlwaysAuto = e
        sendNotification("Gun Mods", e and "Always Auto enabled" or "Always Auto disabled", 2)
    end)
    createCheckbox(generalPage, "No Spread", 0, 355, false, function(e)
        Settings.Combat.NoSpread = e
        sendNotification("Gun Mods", e and "No Spread enabled" or "No Spread disabled", 2)
    end)
    createCheckbox(generalPage, "No Recoil", 0, 375, false, function(e)
        Settings.Combat.NoRecoil = e
        sendNotification("Gun Mods", e and "No Recoil enabled" or "No Recoil disabled", 2)
    end)
    
    -- Increase canvas size to fit content
    generalPage.CanvasSize = UDim2.new(0, 0, 0, 540)
    
    -- Auto TP Loop with warning + keybind
    local autoTPToggleKey = Enum.KeyCode.T
    local waitingForTPKey = false
    
    local autoTPContainer = Instance.new("Frame")
    autoTPContainer.Size = UDim2.new(0, 220, 0, 16)
    autoTPContainer.Position = UDim2.new(0, 240, 0, 285)
    autoTPContainer.BackgroundTransparency = 1
    autoTPContainer.Parent = generalPage
    
    -- Checkbox box
    local autoTPCheckbox = Instance.new("Frame")
    autoTPCheckbox.Size = UDim2.new(0, 12, 0, 12)
    autoTPCheckbox.Position = UDim2.new(0, 0, 0, 2)
    autoTPCheckbox.BackgroundColor3 = Theme.CheckboxDisabled
    autoTPCheckbox.BorderSizePixel = 1
    autoTPCheckbox.BorderColor3 = Theme.BorderLight
    autoTPCheckbox.Parent = autoTPContainer
    
    -- Label
    local autoTPLabel = Instance.new("TextLabel")
    autoTPLabel.Size = UDim2.new(0, 75, 1, 0)
    autoTPLabel.Position = UDim2.new(0, 18, 0, 0)
    autoTPLabel.BackgroundTransparency = 1
    autoTPLabel.Text = "Auto TP Loop"
    autoTPLabel.TextColor3 = Theme.TextPrimary
    autoTPLabel.TextSize = 12
    autoTPLabel.Font = Enum.Font.SourceSans
    autoTPLabel.TextXAlignment = Enum.TextXAlignment.Left
    autoTPLabel.Parent = autoTPContainer
    
    -- Risky warning label (right next to the text)
    local riskyWarning = Instance.new("TextLabel")
    riskyWarning.Size = UDim2.new(0, 120, 1, 0)
    riskyWarning.Position = UDim2.new(0, 95, 0, 0)
    riskyWarning.BackgroundTransparency = 1
    riskyWarning.Text = "⚠ Risky - May lead to ban"
    riskyWarning.TextColor3 = Color3.fromRGB(255, 80, 80)
    riskyWarning.TextSize = 10
    riskyWarning.Font = Enum.Font.SourceSansItalic
    riskyWarning.TextXAlignment = Enum.TextXAlignment.Left
    riskyWarning.Parent = autoTPContainer
    
    local autoTPEnabled = false
    
    -- Player target dropdown for Auto TP
    local tpTargetDropFrame = Instance.new("Frame")
    tpTargetDropFrame.Size = UDim2.new(0, 220, 0, 38)
    tpTargetDropFrame.Position = UDim2.new(0, 240, 0, 365)
    tpTargetDropFrame.BackgroundTransparency = 1
    tpTargetDropFrame.Parent = generalPage
    
    local tpTargetLabel = Instance.new("TextLabel")
    tpTargetLabel.Size = UDim2.new(0, 70, 0, 14)
    tpTargetLabel.Position = UDim2.new(0, 0, 0, 0)
    tpTargetLabel.BackgroundTransparency = 1
    tpTargetLabel.Text = "TP Target:"
    tpTargetLabel.TextColor3 = Theme.TextSecondary
    tpTargetLabel.TextSize = 11
    tpTargetLabel.Font = Enum.Font.SourceSans
    tpTargetLabel.TextXAlignment = Enum.TextXAlignment.Left
    tpTargetLabel.Parent = tpTargetDropFrame
    
    local tpTargetBtn = Instance.new("TextButton")
    tpTargetBtn.Size = UDim2.new(0, 145, 0, 18)
    tpTargetBtn.Position = UDim2.new(0, 72, 0, 0)
    tpTargetBtn.BackgroundColor3 = Theme.SliderBackground
    tpTargetBtn.BorderSizePixel = 1
    tpTargetBtn.BorderColor3 = Theme.Border
    tpTargetBtn.Text = "Nearest Enemy ▼"
    tpTargetBtn.TextColor3 = Theme.AccentBright
    tpTargetBtn.TextSize = 11
    tpTargetBtn.Font = Enum.Font.SourceSans
    tpTargetBtn.TextTruncate = Enum.TextTruncate.AtEnd
    tpTargetBtn.Parent = tpTargetDropFrame
    
    local tpDropdownOpen = false
    local tpDropdownFrame = nil
    
    local function closeTpDropdown()
        if tpDropdownFrame then
            tpDropdownFrame:Destroy()
            tpDropdownFrame = nil
        end
        tpDropdownOpen = false
    end
    
    local function openTpDropdown()
        closeTpDropdown()
        tpDropdownOpen = true
        
        -- Build player list
        local options = {"Nearest Enemy"}
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= player then
                table.insert(options, p.DisplayName)
            end
        end
        
        tpDropdownFrame = Instance.new("ScrollingFrame")
        tpDropdownFrame.Size = UDim2.new(0, 145, 0, math.min(#options * 18, 108))
        tpDropdownFrame.Position = UDim2.new(0, 72, 0, 19)
        tpDropdownFrame.BackgroundColor3 = Theme.BackgroundDark
        tpDropdownFrame.BorderSizePixel = 1
        tpDropdownFrame.BorderColor3 = Theme.AccentDark
        tpDropdownFrame.ScrollBarThickness = 3
        tpDropdownFrame.ScrollBarImageColor3 = Theme.AccentDark
        tpDropdownFrame.CanvasSize = UDim2.new(0, 0, 0, #options * 18)
        tpDropdownFrame.ScrollingDirection = Enum.ScrollingDirection.Y
        tpDropdownFrame.ZIndex = 50
        tpDropdownFrame.Parent = tpTargetDropFrame
        
        for i, optionName in ipairs(options) do
            local optBtn = Instance.new("TextButton")
            optBtn.Size = UDim2.new(1, 0, 0, 18)
            optBtn.Position = UDim2.new(0, 0, 0, (i - 1) * 18)
            optBtn.BackgroundColor3 = Theme.BackgroundDark
            optBtn.BackgroundTransparency = 0
            optBtn.BorderSizePixel = 0
            optBtn.Text = optionName
            optBtn.TextColor3 = (optionName == Settings.Misc.AutoTPTargetName) and Theme.AccentBright or Theme.TextPrimary
            optBtn.TextSize = 11
            optBtn.Font = Enum.Font.SourceSans
            optBtn.TextTruncate = Enum.TextTruncate.AtEnd
            optBtn.ZIndex = 51
            optBtn.Parent = tpDropdownFrame
            
            optBtn.MouseEnter:Connect(function()
                optBtn.BackgroundColor3 = Theme.AccentDark
            end)
            optBtn.MouseLeave:Connect(function()
                optBtn.BackgroundColor3 = Theme.BackgroundDark
            end)
            optBtn.MouseButton1Click:Connect(function()
                Settings.Misc.AutoTPTargetName = optionName
                tpTargetBtn.Text = optionName .. " ▼"
                closeTpDropdown()
            end)
        end
    end
    
    tpTargetBtn.MouseEnter:Connect(function()
        if not tpDropdownOpen then tpTargetBtn.BackgroundColor3 = Theme.AccentDark end
    end)
    tpTargetBtn.MouseLeave:Connect(function()
        if not tpDropdownOpen then tpTargetBtn.BackgroundColor3 = Theme.SliderBackground end
    end)
    tpTargetBtn.MouseButton1Click:Connect(function()
        if tpDropdownOpen then
            closeTpDropdown()
        else
            openTpDropdown()
        end
    end)
    
    -- Function to toggle auto TP (shared by checkbox and keybind)
    local function toggleAutoTP()
        if isUnloading or _G.BinxixUnloaded then return end
        autoTPEnabled = not autoTPEnabled
        Settings.Misc.AutoTPLoop = autoTPEnabled
        autoTPCheckbox.BackgroundColor3 = autoTPEnabled and Theme.CheckboxEnabled or Theme.CheckboxDisabled
        
        if autoTPEnabled then
            startAutoTPLoop()
            local targetText = Settings.Misc.AutoTPTargetName
            sendNotification("Auto TP", "Enabled — targeting: " .. targetText, 2)
        else
            stopAutoTPLoop()
            sendNotification("Auto TP", "Disabled", 2)
        end
    end
    
    -- Click handler
    local autoTPBtn = Instance.new("TextButton")
    autoTPBtn.Size = UDim2.new(1, 0, 1, 0)
    autoTPBtn.BackgroundTransparency = 1
    autoTPBtn.Text = ""
    autoTPBtn.Parent = autoTPContainer
    
    autoTPBtn.MouseButton1Click:Connect(function()
        toggleAutoTP()
    end)
    
    -- Keybind row for Auto TP
    local tpKeybindRow = Instance.new("Frame")
    tpKeybindRow.Size = UDim2.new(0, 220, 0, 18)
    tpKeybindRow.Position = UDim2.new(0, 240, 0, 303)
    tpKeybindRow.BackgroundTransparency = 1
    tpKeybindRow.Parent = generalPage
    
    local tpKeybindLabel = Instance.new("TextLabel")
    tpKeybindLabel.Size = UDim2.new(0, 70, 1, 0)
    tpKeybindLabel.Position = UDim2.new(0, 0, 0, 0)
    tpKeybindLabel.BackgroundTransparency = 1
    tpKeybindLabel.Text = "TP Keybind:"
    tpKeybindLabel.TextColor3 = Theme.TextSecondary
    tpKeybindLabel.TextSize = 11
    tpKeybindLabel.Font = Enum.Font.SourceSans
    tpKeybindLabel.TextXAlignment = Enum.TextXAlignment.Left
    tpKeybindLabel.Parent = tpKeybindRow
    
    local tpKeybindBtn = Instance.new("TextButton")
    tpKeybindBtn.Size = UDim2.new(0, 80, 0, 18)
    tpKeybindBtn.Position = UDim2.new(0, 72, 0, 0)
    tpKeybindBtn.BackgroundColor3 = Theme.SliderBackground
    tpKeybindBtn.BorderSizePixel = 1
    tpKeybindBtn.BorderColor3 = Theme.Border
    tpKeybindBtn.Text = "T"
    tpKeybindBtn.TextColor3 = Theme.AccentBright
    tpKeybindBtn.TextSize = 11
    tpKeybindBtn.Font = Enum.Font.SourceSansBold
    tpKeybindBtn.Parent = tpKeybindRow
    
    tpKeybindBtn.MouseEnter:Connect(function()
        if not waitingForTPKey then
            tpKeybindBtn.BackgroundColor3 = Theme.AccentDark
        end
    end)
    tpKeybindBtn.MouseLeave:Connect(function()
        if not waitingForTPKey then
            tpKeybindBtn.BackgroundColor3 = Theme.SliderBackground
        end
    end)
    
    tpKeybindBtn.MouseButton1Click:Connect(function()
        waitingForTPKey = true
        tpKeybindBtn.Text = "Press a key..."
        tpKeybindBtn.TextColor3 = Color3.fromRGB(255, 255, 100)
        tpKeybindBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 40)
    end)
    
    -- TP Keybind input listener
    local tpKeybindInputConn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if waitingForTPKey and input.UserInputType == Enum.UserInputType.Keyboard then
            autoTPToggleKey = input.KeyCode
            tpKeybindBtn.Text = input.KeyCode.Name
            tpKeybindBtn.TextColor3 = Theme.AccentBright
            tpKeybindBtn.BackgroundColor3 = Theme.SliderBackground
            waitingForTPKey = false
        end
    end)
    table.insert(allConnections, tpKeybindInputConn)
    
    createSlider(generalPage, "TP Delay (s)", 240, 325, 0.05, 2, 0.2, function(v)
        Settings.Misc.AutoTPLoopDelay = v
    end)
    
    -- Server buttons
    createSectionHeader(generalPage, "Server", 0, 185)
    
    local function createServerButton(text, posY, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 180, 0, 22)
        btn.Position = UDim2.new(0, 0, 0, posY)
        btn.BackgroundColor3 = Theme.SliderBackground
        btn.BorderSizePixel = 1
        btn.BorderColor3 = Theme.Border
        btn.Text = text
        btn.TextColor3 = Theme.TextPrimary
        btn.TextSize = 11
        btn.Font = Enum.Font.SourceSans
        btn.Parent = generalPage
        
        btn.MouseEnter:Connect(function()
            btn.BackgroundColor3 = Theme.AccentDark
        end)
        btn.MouseLeave:Connect(function()
            btn.BackgroundColor3 = Theme.SliderBackground
        end)
        btn.MouseButton1Click:Connect(callback)
        return btn
    end
    
    createServerButton("Rejoin Server", 200, function()
        pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player) end)
    end)
    createServerButton("Server Hop", 226, function()
        pcall(function() TeleportService:Teleport(game.PlaceId, player) end)
    end)
    
    -- AIMBOT TAB
    local aimbotPage = Instance.new("ScrollingFrame")
    aimbotPage.Name = "AimbotPage"
    aimbotPage.Size = UDim2.new(1, 0, 1, 0)
    aimbotPage.BackgroundTransparency = 1
    aimbotPage.Visible = false
    aimbotPage.BorderSizePixel = 0
    aimbotPage.ScrollBarThickness = 4
    aimbotPage.ScrollBarImageColor3 = Theme.AccentDark
    aimbotPage.CanvasSize = UDim2.new(0, 0, 0, 340)
    aimbotPage.ScrollingDirection = Enum.ScrollingDirection.Y
    aimbotPage.Parent = contentArea
    tabPages["Aimbot"] = aimbotPage
    
    -- Left column - Aimbot settings
    createSectionHeader(aimbotPage, "Aimbot Settings", 0, 0)
    createCheckbox(aimbotPage, "Enabled", 0, 20, false, function(e)
        Settings.Aimbot.Enabled = e
        sendNotification("Aimbot", e and "Enabled" or "Disabled", 2)
    end)
    createCheckbox(aimbotPage, "Toggle Mode", 0, 40, false, function(e)
        Settings.Aimbot.Toggle = e
    end)
    createCheckbox(aimbotPage, "Require Line of Sight", 0, 60, true, function(e)
        Settings.Aimbot.RequireLOS = e
    end)
    createCheckbox(aimbotPage, "Prediction", 0, 80, true, function(e)
        Settings.Aimbot.Prediction = e
    end)
    createCheckbox(aimbotPage, "Sticky Aim", 0, 100, true, function(e)
        Settings.Aimbot.StickyAim = e
    end)
    
    createSlider(aimbotPage, "Smoothness", 0, 130, 0.05, 1, 0.15, function(v)
        Settings.Aimbot.Smoothness = v
    end)
    createSlider(aimbotPage, "Prediction Amount", 0, 170, 0.05, 0.3, 0.12, function(v)
        Settings.Aimbot.PredictionAmount = v
    end)
    
    createDropdown(aimbotPage, "Lock Part", 0, 210, {"Head", "HumanoidRootPart", "UpperTorso", "Torso"}, "Head", function(v)
        Settings.Aimbot.LockPart = v
    end)
    
    -- Right column - FOV settings
    createSectionHeader(aimbotPage, "FOV Settings", 240, 0)
    createCheckbox(aimbotPage, "Show FOV Circle", 240, 20, true, function(e)
        Settings.Aimbot.ShowFOV = e
    end)
    createSlider(aimbotPage, "FOV Radius", 240, 50, 50, 400, 150, function(v)
        Settings.Aimbot.FOVRadius = v
    end)
    createSlider(aimbotPage, "FOV Opacity", 240, 90, 0, 100, 50, function(v)
        Settings.Aimbot.FOVOpacity = v / 100
    end)
    createSlider(aimbotPage, "Max Distance", 240, 130, 100, 1000, 500, function(v)
        Settings.Aimbot.MaxDistance = v
    end)
    
    -- ESP TAB
    local espPage = Instance.new("ScrollingFrame")
    espPage.Name = "ESPPage"
    espPage.Size = UDim2.new(1, 0, 1, 0)
    espPage.BackgroundTransparency = 1
    espPage.Visible = false
    espPage.BorderSizePixel = 0
    espPage.ScrollBarThickness = 4
    espPage.ScrollBarImageColor3 = Theme.AccentDark
    espPage.CanvasSize = UDim2.new(0, 0, 0, 540)
    espPage.ScrollingDirection = Enum.ScrollingDirection.Y
    espPage.Parent = contentArea
    tabPages["ESP"] = espPage
    
    if gameConfig.espEnabled then
        -- Left column - ESP Properties
        createSectionHeader(espPage, "ESP Properties", 0, 0)
        createCheckbox(espPage, "Enabled", 0, 20, false, function(e)
            Settings.ESP.Enabled = e
            sendNotification("ESP", e and "Enabled" or "Disabled", 2)
        end)
        
        -- Filter dropdown
        createDropdown(espPage, "Filter", 0, 40, {"Enemies", "Team", "All", "All (No Team Check)"}, "Enemies", function(v)
            Settings.ESP.FilterMode = v
            sendNotification("ESP Filter", v, 2)
        end)
        
        createCheckbox(espPage, "Display Distance", 0, 80, true, function(e)
            Settings.ESP.DistanceEnabled = e
        end)
        createCheckbox(espPage, "Display Display Name", 0, 100, true, function(e)
            Settings.ESP.NameEnabled = e
        end)
        createCheckbox(espPage, "Display Health", 0, 120, true, function(e)
            Settings.ESP.HealthEnabled = e
        end)
        createCheckbox(espPage, "Display Box", 0, 140, true, function(e)
            Settings.ESP.BoxEnabled = e
        end)
        
        -- Chams section
        createCheckbox(espPage, "Chams (Wallhack Glow)", 0, 160, false, function(e)
            Settings.ESP.ChamsEnabled = e
            sendNotification("Chams", e and "Enabled" or "Disabled", 2)
        end)
        createSlider(espPage, "Chams Fill", 0, 180, 0, 100, 50, function(v)
            Settings.ESP.ChamsFillTransparency = v / 100
        end)
        
        createCheckbox(espPage, "Rainbow Outline Color", 0, 210, false, function(e)
            Settings.ESP.RainbowOutline = e
        end)
        createCheckbox(espPage, "Rainbow Color", 0, 230, false, function(e)
            Settings.ESP.RainbowColor = e
        end)
        createCheckbox(espPage, "Outline", 0, 250, true, function(e)
            Settings.ESP.OutlineEnabled = e
        end)
        
        createColorDisplay(espPage, "Color", 0, 275, Theme.AccentPink)
        createColorDisplay(espPage, "Outline Color", 0, 295, Theme.TextPrimary)
        
        createDropdown(espPage, "Text Font", 0, 320, {"System", "UI", "Plex", "Monospace"}, "System", function(v)
            local fontMap = {
                System = Enum.Font.SourceSans,
                UI = Enum.Font.GothamBold,
                Plex = Enum.Font.RobotoMono,
                Monospace = Enum.Font.Code,
            }
            Settings.ESP.Font = fontMap[v] or Enum.Font.SourceSans
        end)
        
        createSlider(espPage, "Transparency", 0, 360, 0, 100, 0, function(v)
            Settings.ESP.Transparency = v / 100
        end)
        createSlider(espPage, "Font Size", 0, 390, 10, 24, 13, function(v)
            Settings.ESP.FontSize = v
        end)
        
        -- Right column - Tracer Properties
        createSectionHeader(espPage, "Tracer Properties", 240, 0)
        createCheckbox(espPage, "Enabled", 240, 20, true, function(e)
            Settings.ESP.TracerEnabled = e
        end)
        createCheckbox(espPage, "Rainbow Outline Color", 240, 40, false, function(e)
            Settings.ESP.TracerRainbowOutline = e
        end)
        createCheckbox(espPage, "Rainbow Color", 240, 60, false, function(e)
            Settings.ESP.TracerRainbowColor = e
        end)
        
        createColorDisplay(espPage, "Outline Color", 240, 85, Theme.AccentPink)
        createColorDisplay(espPage, "Color", 240, 105, Theme.TextPrimary)
        
        createDropdown(espPage, "Position", 240, 130, {"Bottom", "Center", "Mouse"}, "Bottom", function(v)
            Settings.ESP.TracerOrigin = v
        end)
        
        createSlider(espPage, "Transparency", 240, 170, 0, 100, 0, function(v)
            Settings.ESP.TracerTransparency = v / 100
        end)
        createSlider(espPage, "Thickness", 240, 210, 1, 5, 1, function(v)
            Settings.ESP.TracerThickness = v
        end)
        
        -- Skeleton ESP section
        createSectionHeader(espPage, "Skeleton ESP", 240, 240)
        createCheckbox(espPage, "Skeleton Enabled", 240, 260, false, function(e)
            Settings.ESP.SkeletonEnabled = e
        end)
        createSlider(espPage, "Skeleton Thickness", 240, 280, 1, 5, 1, function(v)
            Settings.ESP.SkeletonThickness = v
        end)
        
        -- Offscreen Arrows section  
        createSectionHeader(espPage, "Offscreen Arrows", 0, 420)
        createCheckbox(espPage, "Arrows Enabled", 0, 440, false, function(e)
            Settings.ESP.OffscreenArrows = e
        end)
        createSlider(espPage, "Arrow Size", 0, 460, 10, 40, 20, function(v)
            Settings.ESP.ArrowSize = v
        end)
        createSlider(espPage, "Arrow Distance", 0, 500, 100, 1000, 500, function(v)
            Settings.ESP.ArrowDistance = v
        end)
    else
        -- ESP not officially supported for this game — show override option
        local espOverrideContainer = Instance.new("Frame")
        espOverrideContainer.Size = UDim2.new(1, -16, 0, 100)
        espOverrideContainer.Position = UDim2.new(0, 8, 0, 10)
        espOverrideContainer.BackgroundColor3 = Theme.BackgroundLight
        espOverrideContainer.BorderSizePixel = 1
        espOverrideContainer.BorderColor3 = Theme.Border
        espOverrideContainer.Parent = espPage
        
        local warningIcon = Instance.new("TextLabel")
        warningIcon.Size = UDim2.new(0, 30, 0, 24)
        warningIcon.Position = UDim2.new(0, 10, 0, 10)
        warningIcon.BackgroundTransparency = 1
        warningIcon.Text = "⚠"
        warningIcon.TextSize = 20
        warningIcon.Font = Enum.Font.SourceSans
        warningIcon.TextColor3 = Color3.fromRGB(255, 180, 50)
        warningIcon.Parent = espOverrideContainer
        
        local warningTitle = Instance.new("TextLabel")
        warningTitle.Size = UDim2.new(1, -50, 0, 18)
        warningTitle.Position = UDim2.new(0, 40, 0, 10)
        warningTitle.BackgroundTransparency = 1
        warningTitle.Text = "ESP is not officially supported for " .. currentGameData.name
        warningTitle.TextColor3 = Color3.fromRGB(255, 180, 50)
        warningTitle.TextSize = 12
        warningTitle.Font = Enum.Font.SourceSansBold
        warningTitle.TextXAlignment = Enum.TextXAlignment.Left
        warningTitle.Parent = espOverrideContainer
        
        local warningDesc = Instance.new("TextLabel")
        warningDesc.Size = UDim2.new(1, -20, 0, 16)
        warningDesc.Position = UDim2.new(0, 40, 0, 30)
        warningDesc.BackgroundTransparency = 1
        warningDesc.Text = "You can force-enable it below, but it may be unstable or not work properly."
        warningDesc.TextColor3 = Theme.TextSecondary
        warningDesc.TextSize = 11
        warningDesc.Font = Enum.Font.SourceSans
        warningDesc.TextXAlignment = Enum.TextXAlignment.Left
        warningDesc.Parent = espOverrideContainer
        
        -- Override checkbox
        local overrideBox = Instance.new("Frame")
        overrideBox.Size = UDim2.new(0, 14, 0, 14)
        overrideBox.Position = UDim2.new(0, 40, 0, 58)
        overrideBox.BackgroundColor3 = Theme.CheckboxDisabled
        overrideBox.BorderSizePixel = 1
        overrideBox.BorderColor3 = Theme.BorderLight
        overrideBox.Parent = espOverrideContainer
        
        local overrideLabel = Instance.new("TextLabel")
        overrideLabel.Size = UDim2.new(0, 250, 0, 16)
        overrideLabel.Position = UDim2.new(0, 60, 0, 57)
        overrideLabel.BackgroundTransparency = 1
        overrideLabel.Text = "Enable ESP anyway (may be unstable)"
        overrideLabel.TextColor3 = Theme.TextPrimary
        overrideLabel.TextSize = 12
        overrideLabel.Font = Enum.Font.SourceSans
        overrideLabel.TextXAlignment = Enum.TextXAlignment.Left
        overrideLabel.Parent = espOverrideContainer
        
        local warningTag = Instance.new("TextLabel")
        warningTag.Size = UDim2.new(0, 200, 0, 14)
        warningTag.Position = UDim2.new(0, 60, 0, 76)
        warningTag.BackgroundTransparency = 1
        warningTag.Text = "⚠ Use at your own risk"
        warningTag.TextColor3 = Color3.fromRGB(255, 80, 80)
        warningTag.TextSize = 10
        warningTag.Font = Enum.Font.SourceSansItalic
        warningTag.TextXAlignment = Enum.TextXAlignment.Left
        warningTag.Parent = espOverrideContainer
        
        local espOverrideEnabled = false
        
        local overrideBtn = Instance.new("TextButton")
        overrideBtn.Size = UDim2.new(1, 0, 0, 40)
        overrideBtn.Position = UDim2.new(0, 0, 0, 50)
        overrideBtn.BackgroundTransparency = 1
        overrideBtn.Text = ""
        overrideBtn.Parent = espOverrideContainer
        
        -- The full ESP controls that appear after override
        local overrideESPFrame = Instance.new("Frame")
        overrideESPFrame.Size = UDim2.new(1, 0, 1, -120)
        overrideESPFrame.Position = UDim2.new(0, 0, 0, 120)
        overrideESPFrame.BackgroundTransparency = 1
        overrideESPFrame.Visible = false
        overrideESPFrame.Parent = espPage
        
        overrideBtn.MouseButton1Click:Connect(function()
            espOverrideEnabled = not espOverrideEnabled
            overrideBox.BackgroundColor3 = espOverrideEnabled and Theme.CheckboxEnabled or Theme.CheckboxDisabled
            gameConfig.espEnabled = espOverrideEnabled
            overrideESPFrame.Visible = espOverrideEnabled
            
            if espOverrideEnabled then
                sendNotification("ESP Override", "ESP force-enabled — may be unstable", 3)
            else
                Settings.ESP.Enabled = false
                sendNotification("ESP Override", "ESP disabled", 2)
            end
        end)
        
        -- Add basic ESP controls to the override frame
        createSectionHeader(overrideESPFrame, "ESP (Override Mode)", 0, 0)
        createCheckbox(overrideESPFrame, "Enabled", 0, 20, false, function(e)
            Settings.ESP.Enabled = e
            sendNotification("ESP", e and "Enabled" or "Disabled", 2)
        end)
        createCheckbox(overrideESPFrame, "Display Name", 0, 40, true, function(e) Settings.ESP.NameEnabled = e end)
        createCheckbox(overrideESPFrame, "Display Health", 0, 60, true, function(e) Settings.ESP.HealthEnabled = e end)
        createCheckbox(overrideESPFrame, "Display Distance", 0, 80, true, function(e) Settings.ESP.DistanceEnabled = e end)
        createCheckbox(overrideESPFrame, "Display Box", 0, 100, true, function(e) Settings.ESP.BoxEnabled = e end)
        createCheckbox(overrideESPFrame, "Tracers", 0, 120, true, function(e) Settings.ESP.TracerEnabled = e end)
        createCheckbox(overrideESPFrame, "Rainbow Color", 0, 140, false, function(e) Settings.ESP.RainbowColor = e end)
        
        createSectionHeader(overrideESPFrame, "Tracer Settings", 240, 0)
        createDropdown(overrideESPFrame, "Position", 240, 20, {"Bottom", "Center", "Mouse"}, "Bottom", function(v)
            Settings.ESP.TracerOrigin = v
        end)
        createSlider(overrideESPFrame, "Thickness", 240, 60, 1, 5, 1, function(v) Settings.ESP.TracerThickness = v end)
    end
    
    -- CROSSHAIR TAB
    local crosshairPage = Instance.new("Frame")
    crosshairPage.Name = "CrosshairPage"
    crosshairPage.Size = UDim2.new(1, 0, 1, 0)
    crosshairPage.BackgroundTransparency = 1
    crosshairPage.Visible = false
    crosshairPage.Parent = contentArea
    tabPages["Crosshair"] = crosshairPage
    
    createSectionHeader(crosshairPage, "Crosshair Settings", 0, 0)
    createCheckbox(crosshairPage, "Enabled", 0, 20, false, function(e)
        Settings.Crosshair.Enabled = e
    end)
    createCheckbox(crosshairPage, "Center Dot", 0, 40, false, function(e)
        Settings.Crosshair.CenterDot = e
    end)
    createCheckbox(crosshairPage, "Outline", 0, 60, true, function(e)
        Settings.Crosshair.Outline = e
    end)
    
    createSlider(crosshairPage, "Size", 0, 90, 5, 30, 10, function(v)
        Settings.Crosshair.Size = v
    end)
    createSlider(crosshairPage, "Thickness", 0, 130, 1, 6, 2, function(v)
        Settings.Crosshair.Thickness = v
    end)
    createSlider(crosshairPage, "Gap", 0, 170, 0, 20, 4, function(v)
        Settings.Crosshair.Gap = v
    end)
    
    createColorDisplay(crosshairPage, "Color", 0, 210, Theme.AccentPink)
    
    createDropdown(crosshairPage, "Style", 0, 235, {"Cross", "Cross + Dot", "Dot", "Circle"}, "Cross", function(v)
        Settings.Crosshair.Style = v
    end)
    
    -- ========================================
    -- PLAYERS TAB
    -- ========================================
    local playersPage = Instance.new("Frame")
    playersPage.Name = "PlayersPage"
    playersPage.Size = UDim2.new(1, 0, 1, 0)
    playersPage.BackgroundTransparency = 1
    playersPage.Visible = false
    playersPage.Parent = contentArea
    tabPages["Players"] = playersPage
    
    createSectionHeader(playersPage, "Player List", 0, 0)
    
    -- Scrolling frame for players
    local playerListScroll = Instance.new("ScrollingFrame")
    playerListScroll.Name = "PlayerListScroll"
    playerListScroll.Size = UDim2.new(1, 0, 1, -24)
    playerListScroll.Position = UDim2.new(0, 0, 0, 20)
    playerListScroll.BackgroundTransparency = 1
    playerListScroll.BorderSizePixel = 0
    playerListScroll.ScrollBarThickness = 4
    playerListScroll.ScrollBarImageColor3 = Theme.AccentDark
    playerListScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    playerListScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    playerListScroll.Parent = playersPage
    
    local playerListLayout = Instance.new("UIListLayout")
    playerListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    playerListLayout.Padding = UDim.new(0, 2)
    playerListLayout.Parent = playerListScroll
    
    local playerListEntries = {}
    
    local function createPlayerEntry(target)
        if target == player then return end
        if playerListEntries[target.UserId] then return end
        
        local entry = Instance.new("Frame")
        entry.Size = UDim2.new(1, -4, 0, 40)
        entry.BackgroundColor3 = Theme.BackgroundLight
        entry.BorderSizePixel = 1
        entry.BorderColor3 = Theme.Border
        entry.Parent = playerListScroll
        
        -- Player name
        local nameLabel = Instance.new("TextLabel")
        nameLabel.Size = UDim2.new(0, 130, 0, 16)
        nameLabel.Position = UDim2.new(0, 6, 0, 3)
        nameLabel.BackgroundTransparency = 1
        -- Streamer Mode: hide real names in player list
        if Settings.StreamerMode.Enabled and Settings.StreamerMode.HideNames then
            nameLabel.Text = Settings.StreamerMode.FakeName .. " #" .. tostring(target.UserId):sub(-3)
        else
            nameLabel.Text = target.DisplayName .. " (@" .. target.Name .. ")"
        end
        nameLabel.TextColor3 = Theme.TextPrimary
        nameLabel.TextSize = 11
        nameLabel.Font = Enum.Font.SourceSansBold
        nameLabel.TextXAlignment = Enum.TextXAlignment.Left
        nameLabel.TextTruncate = Enum.TextTruncate.AtEnd
        nameLabel.Parent = entry
        
        -- Info label (health + distance, updated live)
        local infoLabel = Instance.new("TextLabel")
        infoLabel.Size = UDim2.new(0, 200, 0, 14)
        infoLabel.Position = UDim2.new(0, 6, 0, 20)
        infoLabel.BackgroundTransparency = 1
        infoLabel.Text = "..."
        infoLabel.TextColor3 = Theme.TextSecondary
        infoLabel.TextSize = 10
        infoLabel.Font = Enum.Font.SourceSans
        infoLabel.TextXAlignment = Enum.TextXAlignment.Left
        infoLabel.Parent = entry
        
        -- Spectate button
        local spectateBtn = Instance.new("TextButton")
        spectateBtn.Size = UDim2.new(0, 55, 0, 18)
        spectateBtn.Position = UDim2.new(1, -180, 0, 11)
        spectateBtn.BackgroundColor3 = Theme.SliderBackground
        spectateBtn.BorderSizePixel = 1
        spectateBtn.BorderColor3 = Theme.Border
        spectateBtn.Text = "Spectate"
        spectateBtn.TextColor3 = Theme.AccentBright
        spectateBtn.TextSize = 10
        spectateBtn.Font = Enum.Font.SourceSans
        spectateBtn.Parent = entry
        
        local isSpectating = false
        spectateBtn.MouseButton1Click:Connect(function()
            local targetChar = target.Character
            if targetChar then
                local targetHumanoid = targetChar:FindFirstChild("Humanoid")
                if targetHumanoid then
                    if isSpectating then
                        -- Stop spectating (go back to own character)
                        local myChar = player.Character
                        if myChar then
                            local myHumanoid = myChar:FindFirstChild("Humanoid")
                            if myHumanoid then
                                Workspace.CurrentCamera.CameraSubject = myHumanoid
                            end
                        end
                        spectateBtn.Text = "Spectate"
                        spectateBtn.TextColor3 = Theme.AccentBright
                        isSpectating = false
                        sendNotification("Spectate", "Stopped spectating", 2)
                    else
                        Workspace.CurrentCamera.CameraSubject = targetHumanoid
                        spectateBtn.Text = "Stop"
                        spectateBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
                        isSpectating = true
                        sendNotification("Spectate", "Watching " .. target.DisplayName, 2)
                    end
                end
            end
        end)
        
        -- Copy Name button
        local copyBtn = Instance.new("TextButton")
        copyBtn.Size = UDim2.new(0, 50, 0, 18)
        copyBtn.Position = UDim2.new(1, -120, 0, 11)
        copyBtn.BackgroundColor3 = Theme.SliderBackground
        copyBtn.BorderSizePixel = 1
        copyBtn.BorderColor3 = Theme.Border
        copyBtn.Text = "Copy"
        copyBtn.TextColor3 = Theme.TextPrimary
        copyBtn.TextSize = 10
        copyBtn.Font = Enum.Font.SourceSans
        copyBtn.Parent = entry
        
        copyBtn.MouseButton1Click:Connect(function()
            pcall(function()
                setclipboard(target.Name)
            end)
            copyBtn.Text = "Copied!"
            sendNotification("Copied", target.Name .. " copied to clipboard", 2)
            task.delay(1.5, function()
                if copyBtn and copyBtn.Parent then
                    copyBtn.Text = "Copy"
                end
            end)
        end)
        
        -- Team indicator dot
        local teamDot = Instance.new("Frame")
        teamDot.Size = UDim2.new(0, 8, 0, 8)
        teamDot.Position = UDim2.new(1, -60, 0, 16)
        teamDot.BackgroundColor3 = target.Team and target.TeamColor.Color or Theme.TextDim
        teamDot.BorderSizePixel = 0
        teamDot.Parent = entry
        local teamDotCorner = Instance.new("UICorner")
        teamDotCorner.CornerRadius = UDim.new(1, 0)
        teamDotCorner.Parent = teamDot
        
        -- Health bar
        local healthBarBg = Instance.new("Frame")
        healthBarBg.Size = UDim2.new(0, 40, 0, 6)
        healthBarBg.Position = UDim2.new(1, -50, 0, 17)
        healthBarBg.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        healthBarBg.BorderSizePixel = 0
        healthBarBg.Parent = entry
        
        local healthBarFill = Instance.new("Frame")
        healthBarFill.Size = UDim2.new(1, 0, 1, 0)
        healthBarFill.BackgroundColor3 = Color3.fromRGB(80, 255, 80)
        healthBarFill.BorderSizePixel = 0
        healthBarFill.Parent = healthBarBg
        
        playerListEntries[target.UserId] = {
            entry = entry,
            infoLabel = infoLabel,
            healthBarFill = healthBarFill,
            teamDot = teamDot,
        }
    end
    
    local function removePlayerEntry(target)
        local data = playerListEntries[target.UserId]
        if data then
            data.entry:Destroy()
            playerListEntries[target.UserId] = nil
        end
    end
    
    -- Build initial player list
    for _, p in ipairs(Players:GetPlayers()) do
        createPlayerEntry(p)
    end
    
    local plrAddConn = Players.PlayerAdded:Connect(function(p)
        createPlayerEntry(p)
        sendNotification("Player Joined", p.DisplayName .. " joined the server", 2)
    end)
    table.insert(allConnections, plrAddConn)
    
    local plrRemConn = Players.PlayerRemoving:Connect(function(p)
        removePlayerEntry(p)
        sendNotification("Player Left", p.DisplayName .. " left the server", 2)
    end)
    table.insert(allConnections, plrRemConn)
    
    -- Update player info live
    local playerListUpdateConn = RunService.Heartbeat:Connect(function()
        if isUnloading or _G.BinxixUnloaded then return end
        if activeTab ~= "Players" then return end -- Only update when tab is visible
        
        local myChar = player.Character
        local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
        
        for userId, data in pairs(playerListEntries) do
            local target = Players:GetPlayerByUserId(userId)
            if target then
                local targetChar = target.Character
                if targetChar then
                    local targetHumanoid = targetChar:FindFirstChild("Humanoid")
                    local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
                    
                    local healthText = "Dead"
                    local distText = "?"
                    local healthPct = 0
                    
                    if targetHumanoid and targetHumanoid.Health > 0 then
                        healthPct = targetHumanoid.Health / targetHumanoid.MaxHealth
                        healthText = math.floor(targetHumanoid.Health) .. "/" .. math.floor(targetHumanoid.MaxHealth) .. " HP"
                    end
                    
                    if myHRP and targetHRP then
                        local dist = math.floor((myHRP.Position - targetHRP.Position).Magnitude)
                        distText = dist .. "m"
                    end
                    
                    data.infoLabel.Text = healthText .. "  |  " .. distText .. " away"
                    
                    -- Update health bar
                    data.healthBarFill.Size = UDim2.new(math.clamp(healthPct, 0, 1), 0, 1, 0)
                    if healthPct > 0.6 then
                        data.healthBarFill.BackgroundColor3 = Color3.fromRGB(80, 255, 80)
                    elseif healthPct > 0.3 then
                        data.healthBarFill.BackgroundColor3 = Color3.fromRGB(255, 200, 50)
                    else
                        data.healthBarFill.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
                    end
                    
                    -- Update team dot
                    data.teamDot.BackgroundColor3 = target.Team and target.TeamColor.Color or Theme.TextDim
                else
                    data.infoLabel.Text = "Loading..."
                    data.healthBarFill.Size = UDim2.new(0, 0, 1, 0)
                end
            end
        end
    end)
    table.insert(allConnections, playerListUpdateConn)
    
    -- ========================================
    -- CHAT SPY SYSTEM
    -- ========================================
    local chatSpyEnabled = false
    local chatSpyLog = {} -- {timestamp, playerName, message, channel}
    local chatSpyLogLabel = nil -- Reference to the log display
    local MAX_CHAT_LOG = 100
    
    local function addChatLog(playerName, message, channel)
        local timestamp = os.date("%H:%M:%S")
        -- Streamer Mode: mask player names in chat logs
        local displayName = playerName
        if Settings.StreamerMode.Enabled and Settings.StreamerMode.HideNames then
            displayName = Settings.StreamerMode.FakeName .. " #" .. tostring(math.random(100, 999))
        end
        local entry = {time = timestamp, player = displayName, msg = message, channel = channel or "All"}
        table.insert(chatSpyLog, 1, entry) -- Insert at top
        if #chatSpyLog > MAX_CHAT_LOG then
            table.remove(chatSpyLog)
        end
        
        -- Update the log display if visible
        if chatSpyLogLabel and chatSpyLogLabel.Parent then
            local lines = {}
            for i, log in ipairs(chatSpyLog) do
                if i > 50 then break end -- Show last 50
                local channelTag = log.channel ~= "All" and " [" .. log.channel .. "]" or ""
                table.insert(lines, "[" .. log.time .. "]" .. channelTag .. " " .. log.player .. ": " .. log.msg)
            end
            chatSpyLogLabel.Text = table.concat(lines, "\n")
        end
        
        -- Print to console
        if chatSpyEnabled then
            local channelTag = channel and channel ~= "All" and " [" .. channel .. "]" or ""
            print("[ChatSpy]" .. channelTag .. " " .. playerName .. ": " .. message)
        end
    end
    
    -- Hook into TextChatService (modern chat)
    pcall(function()
        local TextChatService = game:GetService("TextChatService")
        if TextChatService then
            -- Listen to all text channels
            local function hookChannel(channel)
                if channel:IsA("TextChannel") then
                    channel.MessageReceived:Connect(function(msgObj)
                        if not chatSpyEnabled then return end
                        local sender = msgObj.TextSource
                        if not sender then return end
                        local senderPlayer = Players:GetPlayerByUserId(sender.UserId)
                        if not senderPlayer then return end
                        local channelName = channel.Name:gsub("RBXGeneral", "All"):gsub("RBXTeam", "Team"):gsub("RBXWhisper", "Whisper")
                        addChatLog(senderPlayer.DisplayName .. " (@" .. senderPlayer.Name .. ")", msgObj.Text, channelName)
                    end)
                end
            end
            
            for _, channel in ipairs(TextChatService:GetDescendants()) do
                hookChannel(channel)
            end
            TextChatService.DescendantAdded:Connect(hookChannel)
        end
    end)
    
    -- Hook into legacy chat (Chatted event — works on all games)
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player then
            pcall(function()
                plr.Chatted:Connect(function(msg)
                    if not chatSpyEnabled then return end
                    addChatLog(plr.DisplayName .. " (@" .. plr.Name .. ")", msg, "All")
                end)
            end)
        end
    end
    
    local chatSpyPlayerConn = Players.PlayerAdded:Connect(function(plr)
        pcall(function()
            plr.Chatted:Connect(function(msg)
                if not chatSpyEnabled then return end
                addChatLog(plr.DisplayName .. " (@" .. plr.Name .. ")", msg, "All")
            end)
        end)
    end)
    table.insert(allConnections, chatSpyPlayerConn)
    
    -- ========================================
    -- REPORT / BUG REPORT TAB
    -- ========================================
    local reportPage = Instance.new("ScrollingFrame")
    reportPage.Name = "ReportPage"
    reportPage.Size = UDim2.new(1, 0, 1, 0)
    reportPage.BackgroundTransparency = 1
    reportPage.Visible = false
    reportPage.BorderSizePixel = 0
    reportPage.ScrollBarThickness = 4
    reportPage.ScrollBarImageColor3 = Theme.AccentDark
    reportPage.CanvasSize = UDim2.new(0, 0, 0, 500)
    reportPage.ScrollingDirection = Enum.ScrollingDirection.Y
    reportPage.Parent = contentArea
    tabPages["Report"] = reportPage
    
    -- Chat Spy section
    createSectionHeader(reportPage, "Chat Spy", 0, 0)
    
    createCheckbox(reportPage, "Enable Chat Spy", 0, 20, false, function(e)
        chatSpyEnabled = e
        sendNotification("Chat Spy", e and "Listening to all chats" or "Disabled", 2)
    end)
    
    local chatSpyInfo = Instance.new("TextLabel")
    chatSpyInfo.Size = UDim2.new(1, -8, 0, 14)
    chatSpyInfo.Position = UDim2.new(0, 0, 0, 40)
    chatSpyInfo.BackgroundTransparency = 1
    chatSpyInfo.Text = "Logs all chat messages including whispers & team chat. Prints to console (F9)."
    chatSpyInfo.TextColor3 = Theme.TextDim
    chatSpyInfo.TextSize = 10
    chatSpyInfo.Font = Enum.Font.SourceSans
    chatSpyInfo.TextXAlignment = Enum.TextXAlignment.Left
    chatSpyInfo.Parent = reportPage
    
    -- ========================================
    -- SUGGESTION BOX SECTION
    -- ========================================
    createSectionHeader(reportPage, "Suggestions", 0, 60)
    
    -- Detect executor name (used by both suggestion and bug report)
    local function getExecutorName()
        local name = "Unknown"
        pcall(function()
            if identifyexecutor then
                name = identifyexecutor()
            elseif getexecutorname then
                name = getexecutorname()
            end
        end)
        return name
    end
    
    local suggestInfo = Instance.new("TextLabel")
    suggestInfo.Size = UDim2.new(1, -8, 0, 14)
    suggestInfo.Position = UDim2.new(0, 0, 0, 80)
    suggestInfo.BackgroundTransparency = 1
    suggestInfo.Text = "Have an idea for a new feature? Let us know!"
    suggestInfo.TextColor3 = Theme.TextDim
    suggestInfo.TextSize = 10
    suggestInfo.Font = Enum.Font.SourceSans
    suggestInfo.TextXAlignment = Enum.TextXAlignment.Left
    suggestInfo.Parent = reportPage
    
    local suggestInputBox = Instance.new("TextBox")
    suggestInputBox.Size = UDim2.new(1, -8, 0, 60)
    suggestInputBox.Position = UDim2.new(0, 0, 0, 98)
    suggestInputBox.BackgroundColor3 = Theme.BackgroundDark
    suggestInputBox.BorderSizePixel = 1
    suggestInputBox.BorderColor3 = Theme.Border
    suggestInputBox.Text = ""
    suggestInputBox.PlaceholderText = "Type your suggestion here..."
    suggestInputBox.PlaceholderColor3 = Theme.TextDim
    suggestInputBox.TextColor3 = Theme.TextPrimary
    suggestInputBox.TextSize = 11
    suggestInputBox.Font = Enum.Font.SourceSans
    suggestInputBox.TextXAlignment = Enum.TextXAlignment.Left
    suggestInputBox.TextYAlignment = Enum.TextYAlignment.Top
    suggestInputBox.TextWrapped = true
    suggestInputBox.MultiLine = true
    suggestInputBox.ClearTextOnFocus = false
    suggestInputBox.Parent = reportPage
    
    local sendSuggestBtn = Instance.new("TextButton")
    sendSuggestBtn.Size = UDim2.new(0, 130, 0, 24)
    sendSuggestBtn.Position = UDim2.new(0, 0, 0, 164)
    sendSuggestBtn.BackgroundColor3 = Color3.fromRGB(40, 100, 60)
    sendSuggestBtn.BorderSizePixel = 1
    sendSuggestBtn.BorderColor3 = Theme.Border
    sendSuggestBtn.Text = "Send Suggestion"
    sendSuggestBtn.TextColor3 = Color3.fromRGB(120, 255, 160)
    sendSuggestBtn.TextSize = 12
    sendSuggestBtn.Font = Enum.Font.SourceSansBold
    sendSuggestBtn.Parent = reportPage
    
    sendSuggestBtn.MouseEnter:Connect(function() sendSuggestBtn.BackgroundColor3 = Color3.fromRGB(50, 130, 75) end)
    sendSuggestBtn.MouseLeave:Connect(function() sendSuggestBtn.BackgroundColor3 = Color3.fromRGB(40, 100, 60) end)
    
    local suggestCooldown = false
    
    sendSuggestBtn.MouseButton1Click:Connect(function()
        if suggestCooldown then
            sendNotification("Suggestion", "Please wait before sending another suggestion", 2)
            return
        end
        
        local suggestion = suggestInputBox.Text
        if suggestion == "" or #suggestion < 5 then
            sendNotification("Suggestion", "Please write at least 5 characters", 2)
            return
        end
        
        suggestCooldown = true
        sendSuggestBtn.Text = "Sending..."
        sendSuggestBtn.TextColor3 = Color3.fromRGB(255, 200, 80)
        
        local executorName = getExecutorName()
        local gameName = currentGameData.name
        local placeId = tostring(currentPlaceId)
        
        local suggestionWebhook = "https://discord.com/api/webhooks/1469598356975124531/2gW0s_svmwzMFNPidKhyOztLVKPVPI3V2g1OT0VN3ownM6Fpzu1UZ1qFl33ojmnfNGbr"
        
        local payload = {
            embeds = {{
                title = "💡 Suggestion — Binxix Hub V6",
                color = 3066993, -- Green
                fields = {
                    {name = "💬 Suggestion", value = suggestion, inline = false},
                    {name = "🎮 Game", value = gameName .. " (" .. placeId .. ")", inline = true},
                    {name = "⚙️ Executor", value = executorName, inline = true},
                },
                footer = {text = "Binxix Hub V6 Suggestion Box"},
                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
            }}
        }
        
        local success, err = pcall(function()
            local jsonPayload = HttpService:JSONEncode(payload)
            local httpRequest = (syn and syn.request) or (http and http.request) or http_request or request or fluxus and fluxus.request
            if httpRequest then
                httpRequest({
                    Url = suggestionWebhook,
                    Method = "POST",
                    Headers = {["Content-Type"] = "application/json"},
                    Body = jsonPayload,
                })
            else
                error("No HTTP request function available")
            end
        end)
        
        if success then
            sendSuggestBtn.Text = "Sent!"
            sendSuggestBtn.TextColor3 = Color3.fromRGB(80, 255, 120)
            suggestInputBox.Text = ""
            sendNotification("Suggestion", "Suggestion sent — thank you!", 3)
        else
            sendSuggestBtn.Text = "Failed"
            sendSuggestBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
            sendNotification("Suggestion", "Could not send: " .. tostring(err), 3)
        end
        
        task.delay(5, function()
            suggestCooldown = false
            if sendSuggestBtn and sendSuggestBtn.Parent then
                sendSuggestBtn.Text = "Send Suggestion"
                sendSuggestBtn.TextColor3 = Color3.fromRGB(120, 255, 160)
            end
        end)
    end)
    
    -- ========================================
    -- BUG REPORT SECTION
    -- ========================================
    createSectionHeader(reportPage, "Bug Report", 0, 200)
    
    -- Disclaimer
    local disclaimerLabel = Instance.new("TextLabel")
    disclaimerLabel.Size = UDim2.new(1, -8, 0, 28)
    disclaimerLabel.Position = UDim2.new(0, 0, 0, 220)
    disclaimerLabel.BackgroundColor3 = Color3.fromRGB(40, 35, 20)
    disclaimerLabel.BorderSizePixel = 1
    disclaimerLabel.BorderColor3 = Color3.fromRGB(80, 70, 30)
    disclaimerLabel.Text = "  ⚠ This will send: your executor name, game name, and your bug description. Nothing else."
    disclaimerLabel.TextColor3 = Color3.fromRGB(255, 200, 80)
    disclaimerLabel.TextSize = 10
    disclaimerLabel.Font = Enum.Font.SourceSans
    disclaimerLabel.TextXAlignment = Enum.TextXAlignment.Left
    disclaimerLabel.Parent = reportPage
    
    -- Bug description input
    local bugInputLabel = Instance.new("TextLabel")
    bugInputLabel.Size = UDim2.new(0, 120, 0, 16)
    bugInputLabel.Position = UDim2.new(0, 0, 0, 255)
    bugInputLabel.BackgroundTransparency = 1
    bugInputLabel.Text = "Describe the bug:"
    bugInputLabel.TextColor3 = Theme.TextSecondary
    bugInputLabel.TextSize = 11
    bugInputLabel.Font = Enum.Font.SourceSans
    bugInputLabel.TextXAlignment = Enum.TextXAlignment.Left
    bugInputLabel.Parent = reportPage
    
    local bugInputBox = Instance.new("TextBox")
    bugInputBox.Size = UDim2.new(1, -8, 0, 60)
    bugInputBox.Position = UDim2.new(0, 0, 0, 275)
    bugInputBox.BackgroundColor3 = Theme.BackgroundDark
    bugInputBox.BorderSizePixel = 1
    bugInputBox.BorderColor3 = Theme.Border
    bugInputBox.Text = ""
    bugInputBox.PlaceholderText = "Type your bug report here..."
    bugInputBox.PlaceholderColor3 = Theme.TextDim
    bugInputBox.TextColor3 = Theme.TextPrimary
    bugInputBox.TextSize = 11
    bugInputBox.Font = Enum.Font.SourceSans
    bugInputBox.TextXAlignment = Enum.TextXAlignment.Left
    bugInputBox.TextYAlignment = Enum.TextYAlignment.Top
    bugInputBox.TextWrapped = true
    bugInputBox.MultiLine = true
    bugInputBox.ClearTextOnFocus = false
    bugInputBox.Parent = reportPage
    
    -- Send report button
    local sendReportBtn = Instance.new("TextButton")
    sendReportBtn.Size = UDim2.new(0, 120, 0, 24)
    sendReportBtn.Position = UDim2.new(0, 0, 0, 342)
    sendReportBtn.BackgroundColor3 = Theme.AccentDark
    sendReportBtn.BorderSizePixel = 1
    sendReportBtn.BorderColor3 = Theme.Border
    sendReportBtn.Text = "Send Report"
    sendReportBtn.TextColor3 = Theme.TextPrimary
    sendReportBtn.TextSize = 12
    sendReportBtn.Font = Enum.Font.SourceSansBold
    sendReportBtn.Parent = reportPage
    
    sendReportBtn.MouseEnter:Connect(function() sendReportBtn.BackgroundColor3 = Theme.AccentBright end)
    sendReportBtn.MouseLeave:Connect(function() sendReportBtn.BackgroundColor3 = Theme.AccentDark end)
    
    local reportCooldown = false
    
    sendReportBtn.MouseButton1Click:Connect(function()
        if reportCooldown then
            sendNotification("Report", "Please wait before sending another report", 2)
            return
        end
        
        local description = bugInputBox.Text
        if description == "" or #description < 5 then
            sendNotification("Report", "Please describe the bug (at least 5 characters)", 2)
            return
        end
        
        reportCooldown = true
        sendReportBtn.Text = "Sending..."
        sendReportBtn.TextColor3 = Color3.fromRGB(255, 200, 80)
        
        local executorName = getExecutorName()
        local gameName = currentGameData.name
        local placeId = tostring(currentPlaceId)
        
        local webhookUrl = "https://discord.com/api/webhooks/1466757772145070080/-3-YwfjgH-yEl8yeS_AmuW4E3jDL2aF4GrQdnl0woOtRd_mTF6J4BezIMNlTvvnieSaP"
        
        local payload = {
            embeds = {{
                title = "🐛 Bug Report — Binxix Hub V6",
                color = 11163135, -- Purple
                fields = {
                    {name = "Executor", value = executorName, inline = true},
                    {name = "Game", value = gameName .. " (" .. placeId .. ")", inline = true},
                    {name = "Description", value = description, inline = false},
                },
                footer = {text = "Binxix Hub V6 Bug Report System"},
                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
            }}
        }
        
        local success, err = pcall(function()
            local jsonPayload = HttpService:JSONEncode(payload)
            local httpRequest = (syn and syn.request) or (http and http.request) or http_request or request or fluxus and fluxus.request
            if httpRequest then
                httpRequest({
                    Url = webhookUrl,
                    Method = "POST",
                    Headers = {["Content-Type"] = "application/json"},
                    Body = jsonPayload,
                })
            else
                error("No HTTP request function available")
            end
        end)
        
        if success then
            sendReportBtn.Text = "Sent!"
            sendReportBtn.TextColor3 = Color3.fromRGB(80, 255, 120)
            bugInputBox.Text = ""
            sendNotification("Report", "Bug report sent — thank you!", 3)
        else
            sendReportBtn.Text = "Failed"
            sendReportBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
            sendNotification("Report", "Could not send: " .. tostring(err), 3)
        end
        
        task.delay(5, function()
            reportCooldown = false
            if sendReportBtn and sendReportBtn.Parent then
                sendReportBtn.Text = "Send Report"
                sendReportBtn.TextColor3 = Theme.TextPrimary
            end
        end)
    end)
    
    -- Report info
    local reportInfoLabel = Instance.new("TextLabel")
    reportInfoLabel.Size = UDim2.new(1, -8, 0, 20)
    reportInfoLabel.Position = UDim2.new(0, 0, 0, 370)
    reportInfoLabel.BackgroundTransparency = 1
    reportInfoLabel.Text = "Pls be descriptive of the bug/problem so we can fix it faster."
    reportInfoLabel.TextColor3 = Color3.fromRGB(255, 200, 80)
    reportInfoLabel.TextSize = 13
    reportInfoLabel.Font = Enum.Font.SourceSansBold
    reportInfoLabel.TextXAlignment = Enum.TextXAlignment.Left
    reportInfoLabel.TextWrapped = true
    reportInfoLabel.Parent = reportPage
    
    -- Discord invite section
    createSectionHeader(reportPage, "Community", 0, 400)
    
    local discordBtn = Instance.new("TextButton")
    discordBtn.Size = UDim2.new(0, 160, 0, 26)
    discordBtn.Position = UDim2.new(0, 0, 0, 420)
    discordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242) -- Discord blurple
    discordBtn.BorderSizePixel = 1
    discordBtn.BorderColor3 = Color3.fromRGB(70, 80, 200)
    discordBtn.Text = "Join Discord Server"
    discordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    discordBtn.TextSize = 12
    discordBtn.Font = Enum.Font.SourceSansBold
    discordBtn.Parent = reportPage
    
    discordBtn.MouseEnter:Connect(function() discordBtn.BackgroundColor3 = Color3.fromRGB(110, 120, 255) end)
    discordBtn.MouseLeave:Connect(function() discordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242) end)
    discordBtn.MouseButton1Click:Connect(function()
        pcall(function()
            if setclipboard then
                setclipboard("https://discord.gg/S4nPV2Rx7F")
                sendNotification("Discord", "Invite link copied to clipboard!", 3)
            end
        end)
        pcall(function()
            if request or http_request or (syn and syn.request) then
                -- Can't open browser directly from most executors, clipboard is the fallback
            end
        end)
    end)

    -- SETTINGS TAB
    local settingsPage = Instance.new("ScrollingFrame")
    settingsPage.Name = "SettingsPage"
    settingsPage.Size = UDim2.new(1, 0, 1, 0)
    settingsPage.BackgroundTransparency = 1
    settingsPage.Visible = false
    settingsPage.BorderSizePixel = 0
    settingsPage.ScrollBarThickness = 4
    settingsPage.ScrollBarImageColor3 = Theme.AccentDark
    settingsPage.CanvasSize = UDim2.new(0, 0, 0, 520)
    settingsPage.ScrollingDirection = Enum.ScrollingDirection.Y
    settingsPage.Parent = contentArea
    tabPages["Settings"] = settingsPage
    
    createSectionHeader(settingsPage, "GUI Settings", 0, 0)
    
    -- Theme Picker
    createDropdown(settingsPage, "Theme", 0, 20, {"Purple", "Blue", "Red", "Green", "Rose"}, "Purple", function(v)
        applyTheme(v)
        sendNotification("Theme", "Switched to " .. v, 2)
    end)
    
    -- Custom Keybind System
    local currentToggleKey = Enum.KeyCode.RightControl
    local waitingForKey = false
    
    local keybindLabel = Instance.new("TextLabel")
    keybindLabel.Size = UDim2.new(0, 100, 0, 20)
    keybindLabel.Position = UDim2.new(0, 0, 0, 58)
    keybindLabel.BackgroundTransparency = 1
    keybindLabel.Text = "Toggle Key:"
    keybindLabel.TextColor3 = Theme.TextSecondary
    keybindLabel.TextSize = 11
    keybindLabel.Font = Enum.Font.SourceSans
    keybindLabel.TextXAlignment = Enum.TextXAlignment.Left
    keybindLabel.Parent = settingsPage
    
    local keybindBtn = Instance.new("TextButton")
    keybindBtn.Size = UDim2.new(0, 120, 0, 22)
    keybindBtn.Position = UDim2.new(0, 100, 0, 58)
    keybindBtn.BackgroundColor3 = Theme.SliderBackground
    keybindBtn.BorderSizePixel = 1
    keybindBtn.BorderColor3 = Theme.Border
    keybindBtn.Text = "RightControl"
    keybindBtn.TextColor3 = Theme.AccentBright
    keybindBtn.TextSize = 11
    keybindBtn.Font = Enum.Font.SourceSansBold
    keybindBtn.Parent = settingsPage
    
    keybindBtn.MouseEnter:Connect(function()
        if not waitingForKey then
            keybindBtn.BackgroundColor3 = Theme.AccentDark
        end
    end)
    keybindBtn.MouseLeave:Connect(function()
        if not waitingForKey then
            keybindBtn.BackgroundColor3 = Theme.SliderBackground
        end
    end)
    
    keybindBtn.MouseButton1Click:Connect(function()
        waitingForKey = true
        keybindBtn.Text = "Press a key..."
        keybindBtn.TextColor3 = Color3.fromRGB(255, 255, 100)
        keybindBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 40)
    end)
    
    -- Keybind input listener
    local keybindInputConn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if waitingForKey and input.UserInputType == Enum.UserInputType.Keyboard then
            currentToggleKey = input.KeyCode
            keybindBtn.Text = input.KeyCode.Name
            keybindBtn.TextColor3 = Theme.AccentBright
            keybindBtn.BackgroundColor3 = Theme.SliderBackground
            waitingForKey = false
        end
    end)
    table.insert(allConnections, keybindInputConn)
    
    createSectionHeader(settingsPage, "Script Info", 0, 95)
    
    local infoLabel = Instance.new("TextLabel")
    infoLabel.Size = UDim2.new(0, 300, 0, 80)
    infoLabel.Position = UDim2.new(0, 0, 0, 115)
    infoLabel.BackgroundTransparency = 1
    infoLabel.Text = "Binxix Hub V6.4\nAirHub V2 Style Edition\n+ Gun Mods / Chat Spammer / Streamer Mode / Profiles\n\nGame: " .. currentGameData.name .. "\nPlace ID: " .. tostring(currentPlaceId)
    infoLabel.TextColor3 = Theme.TextSecondary
    infoLabel.TextSize = 11
    infoLabel.Font = Enum.Font.SourceSans
    infoLabel.TextXAlignment = Enum.TextXAlignment.Left
    infoLabel.TextYAlignment = Enum.TextYAlignment.Top
    infoLabel.Parent = settingsPage
    
    -- Unload button
    local unloadBtn = Instance.new("TextButton")
    unloadBtn.Size = UDim2.new(0, 120, 0, 26)
    unloadBtn.Position = UDim2.new(0, 0, 0, 210)
    unloadBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
    unloadBtn.BorderSizePixel = 1
    unloadBtn.BorderColor3 = Theme.Border
    unloadBtn.Text = "Unload Script"
    unloadBtn.TextColor3 = Theme.TextPrimary
    unloadBtn.TextSize = 12
    unloadBtn.Font = Enum.Font.SourceSans
    unloadBtn.Parent = settingsPage
    
    unloadBtn.MouseButton1Click:Connect(function()
        isUnloading = true
        _G.BinxixUnloaded = true
        Settings.Combat.KillAura = false
        Settings.Combat.TriggerBot = false
        Settings.Misc.ChatSpammer = false
        -- Disable gun mods and restore values
        Settings.Combat.FastReload = false
        Settings.Combat.FastFireRate = false
        Settings.Combat.AlwaysAuto = false
        Settings.Combat.NoSpread = false
        Settings.Combat.NoRecoil = false
        pcall(function()
            if gunModOriginalValues then
                for valueName, entries in pairs(gunModOriginalValues) do
                    for obj, originalVal in pairs(entries) do
                        pcall(function() obj.Value = originalVal end)
                    end
                end
            end
        end)
        stopAutoTPLoop()
        for _, conn in ipairs(allConnections) do
            pcall(function() conn:Disconnect() end)
        end
        screenGui:Destroy()
    end)
    
    -- ========================================
    -- STREAMER MODE SECTION (Right column)
    -- ========================================
    createSectionHeader(settingsPage, "Streamer Mode", 240, 0)
    
    createCheckbox(settingsPage, "Streamer Mode", 240, 20, false, function(e)
        Settings.StreamerMode.Enabled = e
        sendNotification("Streamer Mode", e and "Enabled — names and info hidden" or "Disabled", 2)
    end)
    createCheckbox(settingsPage, "Hide Player Names", 240, 40, true, function(e)
        Settings.StreamerMode.HideNames = e
    end)
    createCheckbox(settingsPage, "Hide Chat (Chat Spy)", 240, 60, false, function(e)
        Settings.StreamerMode.HideChat = e
    end)
    createCheckbox(settingsPage, "Hide Notifications", 240, 80, false, function(e)
        Settings.StreamerMode.HideNotifications = e
    end)
    
    -- Fake name input
    local fakeNameLabel = Instance.new("TextLabel")
    fakeNameLabel.Size = UDim2.new(0, 70, 0, 16)
    fakeNameLabel.Position = UDim2.new(0, 240, 0, 100)
    fakeNameLabel.BackgroundTransparency = 1
    fakeNameLabel.Text = "Fake Name:"
    fakeNameLabel.TextColor3 = Theme.TextSecondary
    fakeNameLabel.TextSize = 11
    fakeNameLabel.Font = Enum.Font.SourceSans
    fakeNameLabel.TextXAlignment = Enum.TextXAlignment.Left
    fakeNameLabel.Parent = settingsPage
    
    local fakeNameBox = Instance.new("TextBox")
    fakeNameBox.Size = UDim2.new(0, 120, 0, 18)
    fakeNameBox.Position = UDim2.new(0, 315, 0, 99)
    fakeNameBox.BackgroundColor3 = Theme.SliderBackground
    fakeNameBox.BorderSizePixel = 1
    fakeNameBox.BorderColor3 = Theme.Border
    fakeNameBox.Text = "Player"
    fakeNameBox.TextColor3 = Theme.TextPrimary
    fakeNameBox.TextSize = 11
    fakeNameBox.Font = Enum.Font.SourceSans
    fakeNameBox.ClearTextOnFocus = false
    fakeNameBox.Parent = settingsPage
    
    fakeNameBox.FocusLost:Connect(function()
        local name = fakeNameBox.Text
        if name == "" then name = "Player" end
        Settings.StreamerMode.FakeName = name
    end)
    
    -- ========================================
    -- PROFILE SYSTEM (Right column, below Streamer Mode)
    -- ========================================
    createSectionHeader(settingsPage, "Profiles", 240, 130)
    
    -- Profile name input
    local profileNameLabel = Instance.new("TextLabel")
    profileNameLabel.Size = UDim2.new(0, 80, 0, 16)
    profileNameLabel.Position = UDim2.new(0, 240, 0, 150)
    profileNameLabel.BackgroundTransparency = 1
    profileNameLabel.Text = "Profile Name:"
    profileNameLabel.TextColor3 = Theme.TextSecondary
    profileNameLabel.TextSize = 11
    profileNameLabel.Font = Enum.Font.SourceSans
    profileNameLabel.TextXAlignment = Enum.TextXAlignment.Left
    profileNameLabel.Parent = settingsPage
    
    local profileNameBox = Instance.new("TextBox")
    profileNameBox.Size = UDim2.new(0, 110, 0, 18)
    profileNameBox.Position = UDim2.new(0, 325, 0, 149)
    profileNameBox.BackgroundColor3 = Theme.SliderBackground
    profileNameBox.BorderSizePixel = 1
    profileNameBox.BorderColor3 = Theme.Border
    profileNameBox.Text = "Default"
    profileNameBox.TextColor3 = Theme.AccentBright
    profileNameBox.TextSize = 11
    profileNameBox.Font = Enum.Font.SourceSansBold
    profileNameBox.ClearTextOnFocus = false
    profileNameBox.Parent = settingsPage
    
    -- Current profile label
    local currentProfileLabel = Instance.new("TextLabel")
    currentProfileLabel.Size = UDim2.new(0, 200, 0, 14)
    currentProfileLabel.Position = UDim2.new(0, 240, 0, 170)
    currentProfileLabel.BackgroundTransparency = 1
    currentProfileLabel.Text = "Active: " .. currentProfileName
    currentProfileLabel.TextColor3 = Theme.TextDim
    currentProfileLabel.TextSize = 10
    currentProfileLabel.Font = Enum.Font.SourceSans
    currentProfileLabel.TextXAlignment = Enum.TextXAlignment.Left
    currentProfileLabel.Parent = settingsPage
    
    -- Save Profile button
    local saveProfileBtn = Instance.new("TextButton")
    saveProfileBtn.Size = UDim2.new(0, 60, 0, 22)
    saveProfileBtn.Position = UDim2.new(0, 240, 0, 188)
    saveProfileBtn.BackgroundColor3 = Theme.SliderBackground
    saveProfileBtn.BorderSizePixel = 1
    saveProfileBtn.BorderColor3 = Theme.Border
    saveProfileBtn.Text = "Save"
    saveProfileBtn.TextColor3 = Color3.fromRGB(80, 255, 120)
    saveProfileBtn.TextSize = 11
    saveProfileBtn.Font = Enum.Font.SourceSansBold
    saveProfileBtn.Parent = settingsPage
    
    saveProfileBtn.MouseEnter:Connect(function() saveProfileBtn.BackgroundColor3 = Theme.AccentDark end)
    saveProfileBtn.MouseLeave:Connect(function() saveProfileBtn.BackgroundColor3 = Theme.SliderBackground end)
    
    saveProfileBtn.MouseButton1Click:Connect(function()
        local name = profileNameBox.Text
        if name == "" then name = "Default" end
        local success, err = saveProfile(name)
        if success then
            saveProfileBtn.Text = "Saved!"
            currentProfileName = name
            currentProfileLabel.Text = "Active: " .. name
            sendNotification("Profile", "Saved profile: " .. name, 2)
        else
            saveProfileBtn.Text = "Error"
            sendNotification("Profile", "Save failed: " .. tostring(err), 3)
        end
        task.delay(1.5, function()
            if saveProfileBtn and saveProfileBtn.Parent then saveProfileBtn.Text = "Save" end
        end)
    end)
    
    -- Load Profile button
    local loadProfileBtn = Instance.new("TextButton")
    loadProfileBtn.Size = UDim2.new(0, 60, 0, 22)
    loadProfileBtn.Position = UDim2.new(0, 305, 0, 188)
    loadProfileBtn.BackgroundColor3 = Theme.SliderBackground
    loadProfileBtn.BorderSizePixel = 1
    loadProfileBtn.BorderColor3 = Theme.Border
    loadProfileBtn.Text = "Load"
    loadProfileBtn.TextColor3 = Theme.AccentBright
    loadProfileBtn.TextSize = 11
    loadProfileBtn.Font = Enum.Font.SourceSansBold
    loadProfileBtn.Parent = settingsPage
    
    loadProfileBtn.MouseEnter:Connect(function() loadProfileBtn.BackgroundColor3 = Theme.AccentDark end)
    loadProfileBtn.MouseLeave:Connect(function() loadProfileBtn.BackgroundColor3 = Theme.SliderBackground end)
    
    loadProfileBtn.MouseButton1Click:Connect(function()
        local name = profileNameBox.Text
        if name == "" then name = "Default" end
        local success, err = loadProfile(name)
        if success then
            loadProfileBtn.Text = "Done!"
            currentProfileLabel.Text = "Active: " .. name
            sendNotification("Profile", "Loaded profile: " .. name .. " — re-toggle features to apply", 3)
        else
            loadProfileBtn.Text = "Error"
            sendNotification("Profile", "Load failed: " .. tostring(err), 3)
        end
        task.delay(1.5, function()
            if loadProfileBtn and loadProfileBtn.Parent then loadProfileBtn.Text = "Load" end
        end)
    end)
    
    -- Delete Profile button
    local deleteProfileBtn = Instance.new("TextButton")
    deleteProfileBtn.Size = UDim2.new(0, 60, 0, 22)
    deleteProfileBtn.Position = UDim2.new(0, 370, 0, 188)
    deleteProfileBtn.BackgroundColor3 = Theme.SliderBackground
    deleteProfileBtn.BorderSizePixel = 1
    deleteProfileBtn.BorderColor3 = Theme.Border
    deleteProfileBtn.Text = "Delete"
    deleteProfileBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
    deleteProfileBtn.TextSize = 11
    deleteProfileBtn.Font = Enum.Font.SourceSansBold
    deleteProfileBtn.Parent = settingsPage
    
    deleteProfileBtn.MouseEnter:Connect(function() deleteProfileBtn.BackgroundColor3 = Color3.fromRGB(100, 30, 30) end)
    deleteProfileBtn.MouseLeave:Connect(function() deleteProfileBtn.BackgroundColor3 = Theme.SliderBackground end)
    
    deleteProfileBtn.MouseButton1Click:Connect(function()
        local name = profileNameBox.Text
        if name == "" then name = "Default" end
        deleteProfile(name)
        deleteProfileBtn.Text = "Gone!"
        sendNotification("Profile", "Deleted profile: " .. name, 2)
        task.delay(1.5, function()
            if deleteProfileBtn and deleteProfileBtn.Parent then deleteProfileBtn.Text = "Delete" end
        end)
    end)
    
    -- List existing profiles
    local profileListLabel = Instance.new("TextLabel")
    profileListLabel.Size = UDim2.new(0, 200, 0, 14)
    profileListLabel.Position = UDim2.new(0, 240, 0, 215)
    profileListLabel.BackgroundTransparency = 1
    profileListLabel.Text = "Saved: " .. table.concat(listProfiles(), ", ")
    profileListLabel.TextColor3 = Theme.TextDim
    profileListLabel.TextSize = 10
    profileListLabel.Font = Enum.Font.SourceSans
    profileListLabel.TextXAlignment = Enum.TextXAlignment.Left
    profileListLabel.TextTruncate = Enum.TextTruncate.AtEnd
    profileListLabel.Parent = settingsPage
    
    -- Refresh profiles list button
    local refreshProfilesBtn = Instance.new("TextButton")
    refreshProfilesBtn.Size = UDim2.new(0, 55, 0, 16)
    refreshProfilesBtn.Position = UDim2.new(0, 240, 0, 232)
    refreshProfilesBtn.BackgroundColor3 = Theme.SliderBackground
    refreshProfilesBtn.BorderSizePixel = 1
    refreshProfilesBtn.BorderColor3 = Theme.Border
    refreshProfilesBtn.Text = "Refresh"
    refreshProfilesBtn.TextColor3 = Theme.TextSecondary
    refreshProfilesBtn.TextSize = 10
    refreshProfilesBtn.Font = Enum.Font.SourceSans
    refreshProfilesBtn.Parent = settingsPage
    
    refreshProfilesBtn.MouseButton1Click:Connect(function()
        profileListLabel.Text = "Saved: " .. table.concat(listProfiles(), ", ")
    end)
    
    -- ========================================
    -- OTHER SCRIPTS SECTION (Left column, below keybind)
    -- ========================================
    createSectionHeader(settingsPage, "Other Scripts", 0, 250)
    
    local function createScriptButton(text, posY, url)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 200, 0, 22)
        btn.Position = UDim2.new(0, 0, 0, posY)
        btn.BackgroundColor3 = Theme.SliderBackground
        btn.BorderSizePixel = 1
        btn.BorderColor3 = Theme.Border
        btn.Text = text
        btn.TextColor3 = Theme.TextPrimary
        btn.TextSize = 11
        btn.Font = Enum.Font.SourceSans
        btn.Parent = settingsPage
        
        btn.MouseEnter:Connect(function()
            btn.BackgroundColor3 = Theme.AccentDark
        end)
        btn.MouseLeave:Connect(function()
            btn.BackgroundColor3 = Theme.SliderBackground
        end)
        btn.MouseButton1Click:Connect(function()
            btn.Text = "Loading..."
            task.spawn(function()
                local success = pcall(function()
                    loadstring(game:HttpGet(url))()
                end)
                btn.Text = success and "Loaded!" or "Failed"
                task.wait(2)
                btn.Text = text
            end)
        end)
    end
    
    createScriptButton("Infinite Yield", 270, "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
    createScriptButton("Nameless Admin", 296, "https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua")
    
    -- Legacy Config section replaced by Profile System above
    -- Keep backward compatibility: auto-load old config if profile dir doesn't exist
    local CONFIG_PATH = "BinxixHubV6_Config.json"
    
    -- Config buttons removed — use Profile System in Settings tab instead
    -- Keep save/load functions for backward compatibility
    
    local function saveConfig()
        return saveProfile(currentProfileName)
    end
    
    local function loadConfig()
        return loadProfile(currentProfileName)
    end
    
    -- Auto-load: try Default profile first, then legacy config
    task.spawn(function()
        task.wait(0.3)
        pcall(function()
            -- Try loading Default profile
            local profilePath = getProfilePath("Default")
            if isfile and isfile(profilePath) then
                local success = loadProfile("Default")
                if success then
                    sendNotification("Profile", "Auto-loaded Default profile", 2)
                    if currentProfileLabel then
                        currentProfileLabel.Text = "Active: Default"
                    end
                    return
                end
            end
            -- Fall back to legacy config
            if isfile and isfile(CONFIG_PATH) then
                local success = pcall(function()
                    local json = readfile(CONFIG_PATH)
                    local saveData = HttpService:JSONDecode(json)
                    if saveData._meta and saveData._meta.theme then
                        applyTheme(saveData._meta.theme)
                    end
                    for category, values in pairs(saveData) do
                        if category ~= "_meta" and Settings[category] then
                            for key, val in pairs(values) do
                                if Settings[category][key] ~= nil then
                                    if type(val) == "table" and val._type == "Color3" then
                                        Settings[category][key] = Color3.fromRGB(val.R, val.G, val.B)
                                    elseif type(val) ~= "table" then
                                        Settings[category][key] = val
                                    end
                                end
                            end
                        end
                    end
                end)
                if success then
                    sendNotification("Config", "Auto-loaded legacy config", 2)
                end
            end
        end)
    end)
    
    -- ========================================
    -- TAB SWITCHING LOGIC
    -- ========================================
    for tabName, tabBtn in pairs(tabButtons) do
        tabBtn.MouseButton1Click:Connect(function()
            if isUnloading or _G.BinxixUnloaded then return end
            activeTab = tabName
            
            -- Update tab colors
            for name, btn in pairs(tabButtons) do
                btn.TextColor3 = name == tabName and Theme.TabActive or Theme.TabInactive
            end
            
            -- Move indicator
            local tabIndex = table.find(tabs, tabName)
            if tabIndex then
                TweenService:Create(tabIndicator, TweenInfo.new(0.2), {
                    Position = UDim2.new(0, (tabIndex - 1) * tabWidth + 6, 1, -2)
                }):Play()
            end
            
            -- Show/hide pages
            for name, page in pairs(tabPages) do
                page.Visible = name == tabName
            end
        end)
    end
    
    -- ========================================
    -- CUSTOM CROSSHAIR
    -- ========================================
    local crosshairFrame = Instance.new("Frame")
    crosshairFrame.Name = "Crosshair"
    crosshairFrame.Size = UDim2.new(0, 50, 0, 50)
    crosshairFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    crosshairFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    crosshairFrame.BackgroundTransparency = 1
    crosshairFrame.Visible = false
    crosshairFrame.Parent = screenGui
    
    local crosshairLines = {}
    for i = 1, 4 do
        local line = Instance.new("Frame")
        line.BackgroundColor3 = Theme.AccentPink
        line.BorderSizePixel = 0
        line.AnchorPoint = Vector2.new(0.5, 0.5)
        line.Parent = crosshairFrame
        crosshairLines[i] = line
    end
    
    local centerDot = Instance.new("Frame")
    centerDot.BackgroundColor3 = Theme.AccentPink
    centerDot.BorderSizePixel = 0
    centerDot.AnchorPoint = Vector2.new(0.5, 0.5)
    centerDot.Position = UDim2.new(0.5, 0, 0.5, 0)
    centerDot.Visible = false
    centerDot.Parent = crosshairFrame
    local dotCorner = Instance.new("UICorner")
    dotCorner.CornerRadius = UDim.new(1, 0)
    dotCorner.Parent = centerDot
    
    local function updateCrosshair()
        local s = Settings.Crosshair
        -- Hide crosshair when Streamer Mode is on
        if Settings.StreamerMode.Enabled then
            crosshairFrame.Visible = false
            return
        end
        crosshairFrame.Visible = s.Enabled
        
        if not s.Enabled then return end
        
        local size, thickness, gap = s.Size, s.Thickness, s.Gap
        local color = s.Color
        
        -- Hide all first
        for _, line in ipairs(crosshairLines) do
            line.Visible = false
        end
        centerDot.Visible = false
        
        if s.Style == "Cross" or s.Style == "Cross + Dot" then
            -- Top
            crosshairLines[1].Size = UDim2.new(0, thickness, 0, size)
            crosshairLines[1].Position = UDim2.new(0.5, 0, 0.5, -(gap + size/2))
            crosshairLines[1].BackgroundColor3 = color
            crosshairLines[1].Visible = true
            
            -- Bottom
            crosshairLines[2].Size = UDim2.new(0, thickness, 0, size)
            crosshairLines[2].Position = UDim2.new(0.5, 0, 0.5, (gap + size/2))
            crosshairLines[2].BackgroundColor3 = color
            crosshairLines[2].Visible = true
            
            -- Left
            crosshairLines[3].Size = UDim2.new(0, size, 0, thickness)
            crosshairLines[3].Position = UDim2.new(0.5, -(gap + size/2), 0.5, 0)
            crosshairLines[3].BackgroundColor3 = color
            crosshairLines[3].Visible = true
            
            -- Right
            crosshairLines[4].Size = UDim2.new(0, size, 0, thickness)
            crosshairLines[4].Position = UDim2.new(0.5, (gap + size/2), 0.5, 0)
            crosshairLines[4].BackgroundColor3 = color
            crosshairLines[4].Visible = true
            
            if s.Style == "Cross + Dot" then
                centerDot.Size = UDim2.new(0, thickness + 2, 0, thickness + 2)
                centerDot.BackgroundColor3 = color
                centerDot.Visible = true
            end
        elseif s.Style == "Dot" then
            centerDot.Size = UDim2.new(0, size, 0, size)
            centerDot.BackgroundColor3 = color
            centerDot.Visible = true
        elseif s.Style == "Circle" then
            centerDot.Size = UDim2.new(0, size * 2, 0, size * 2)
            centerDot.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            centerDot.BackgroundTransparency = 0.8
            centerDot.Visible = true
        end
        
        if s.CenterDot and s.Style ~= "Dot" then
            centerDot.Size = UDim2.new(0, 4, 0, 4)
            centerDot.BackgroundColor3 = color
            centerDot.Visible = true
        end
    end
    
    local crosshairUpdateConn = RunService.RenderStepped:Connect(function()
        if isUnloading or _G.BinxixUnloaded then return end
        updateCrosshair()
    end)
    table.insert(allConnections, crosshairUpdateConn)
    
    -- ========================================
    -- BUNNY HOP WITH FORWARD MOMENTUM (Improved)
    -- ========================================
    local bhopVelocity = nil
    local lastJumpTime = 0
    local currentBhopSpeed = 0 -- For gradual speed ramping
    
    local bunnyHopConn = RunService.RenderStepped:Connect(function(deltaTime)
        if isUnloading or _G.BinxixUnloaded then return end
        if not Settings.Movement.BunnyHop then 
            -- Clean up velocity when disabled
            if bhopVelocity then
                bhopVelocity:Destroy()
                bhopVelocity = nil
            end
            currentBhopSpeed = 0
            return 
        end
        
        local char = player.Character
        if not char then return end
        
        local humanoid = char:FindFirstChild("Humanoid")
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not humanoid or not hrp then return end
        
        local isHoldingSpace = UserInputService:IsKeyDown(Enum.KeyCode.Space)
        local isGrounded = humanoid:GetState() ~= Enum.HumanoidStateType.Jumping and humanoid:GetState() ~= Enum.HumanoidStateType.Freefall
        
        -- Map slider (1-100) to actual speed (16-80 studs/s)
        -- This keeps things playable and prevents clipping through walls
        local targetBhopSpeed = 16 + (Settings.Movement.BunnyHopSpeed / 100) * 64
        
        if isHoldingSpace then
            -- Auto jump when grounded
            if isGrounded then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                lastJumpTime = tick()
            end
            
            -- Apply forward momentum while in air
            if not isGrounded then
                -- Get camera look direction (forward)
                local camera = Workspace.CurrentCamera
                if camera then
                    local lookVector = camera.CFrame.LookVector
                    -- Flatten to horizontal plane
                    local forwardDir = Vector3.new(lookVector.X, 0, lookVector.Z).Unit
                    
                    -- Gradually ramp up speed instead of instant full speed
                    -- This prevents sudden velocity spikes that clip through walls
                    currentBhopSpeed = currentBhopSpeed + (targetBhopSpeed - currentBhopSpeed) * math.min(deltaTime * 5, 1)
                    
                    -- Create or update BodyVelocity for forward momentum
                    if not bhopVelocity or bhopVelocity.Parent ~= hrp then
                        -- Clean up old one if exists
                        if bhopVelocity then bhopVelocity:Destroy() end
                        
                        bhopVelocity = Instance.new("BodyVelocity")
                        bhopVelocity.Name = "BinxixBhopVelocity"
                        bhopVelocity.MaxForce = Vector3.new(8000, 0, 8000) -- Capped force to prevent clipping
                        bhopVelocity.P = 1000
                        bhopVelocity.Parent = hrp
                    end
                    
                    -- Set velocity in forward direction with ramped speed
                    bhopVelocity.Velocity = forwardDir * currentBhopSpeed
                end
            else
                -- Remove velocity when grounded (brief moment before next jump)
                if bhopVelocity and (tick() - lastJumpTime) > 0.08 then
                    bhopVelocity:Destroy()
                    bhopVelocity = nil
                end
                -- Decay speed slightly on ground so next hop starts a bit slower
                currentBhopSpeed = currentBhopSpeed * 0.85
            end
        else
            -- Not holding space, remove velocity and reset speed
            if bhopVelocity then
                bhopVelocity:Destroy()
                bhopVelocity = nil
            end
            currentBhopSpeed = 0
        end
    end)
    table.insert(allConnections, bunnyHopConn)
    
    -- ========================================
    -- FOV MAINTENANCE LOOP (FIX)
    -- ========================================
    local fovMaintainConn = RunService.RenderStepped:Connect(function()
        if isUnloading or _G.BinxixUnloaded then return end
        if Settings.Visuals.CustomFOV then
            local camera = Workspace.CurrentCamera
            if camera and camera.FieldOfView ~= Settings.Visuals.FOVAmount then
                camera.FieldOfView = Settings.Visuals.FOVAmount
            end
        end
    end)
    table.insert(allConnections, fovMaintainConn)
    
    -- ========================================
    -- FLY SYSTEM
    -- ========================================
    local function startFly()
        local char = player.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local humanoid = char:FindFirstChild("Humanoid")
        if not hrp or not humanoid then return end
        
        isFlying = true
        
        -- Create BodyVelocity for movement
        if flyBodyVelocity then flyBodyVelocity:Destroy() end
        flyBodyVelocity = Instance.new("BodyVelocity")
        flyBodyVelocity.Name = "BinxixFlyVelocity"
        flyBodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
        flyBodyVelocity.Parent = hrp
        
        -- Create BodyGyro for rotation stability
        if flyBodyGyro then flyBodyGyro:Destroy() end
        flyBodyGyro = Instance.new("BodyGyro")
        flyBodyGyro.Name = "BinxixFlyGyro"
        flyBodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        flyBodyGyro.P = 9000
        flyBodyGyro.D = 500
        flyBodyGyro.Parent = hrp
        
        humanoid.PlatformStand = true
    end
    
    local function stopFly()
        isFlying = false
        
        local char = player.Character
        if char then
            local humanoid = char:FindFirstChild("Humanoid")
            if humanoid then humanoid.PlatformStand = false end
        end
        
        if flyBodyVelocity then
            flyBodyVelocity:Destroy()
            flyBodyVelocity = nil
        end
        if flyBodyGyro then
            flyBodyGyro:Destroy()
            flyBodyGyro = nil
        end
    end
    
    local flyConn = RunService.RenderStepped:Connect(function()
        if isUnloading or _G.BinxixUnloaded then return end
        
        if Settings.Movement.Fly and isFlying then
            local char = player.Character
            if not char then return end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if not hrp or not flyBodyVelocity or not flyBodyGyro then return end
            
            local camera = Workspace.CurrentCamera
            local flySpeed = Settings.Movement.FlySpeed
            local moveDirection = Vector3.new(0, 0, 0)
            
            -- Get movement input
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                moveDirection = moveDirection + camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                moveDirection = moveDirection - camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                moveDirection = moveDirection - camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                moveDirection = moveDirection + camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                moveDirection = moveDirection + Vector3.new(0, 1, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                moveDirection = moveDirection - Vector3.new(0, 1, 0)
            end
            
            if moveDirection.Magnitude > 0 then
                moveDirection = moveDirection.Unit
            end
            
            flyBodyVelocity.Velocity = moveDirection * flySpeed
            flyBodyGyro.CFrame = camera.CFrame
        elseif not Settings.Movement.Fly and isFlying then
            stopFly()
        end
    end)
    table.insert(allConnections, flyConn)
    
    -- ========================================
    -- ANTI-AFK SYSTEM
    -- ========================================
    local antiAfkConn
    local virtualUser = game:GetService("VirtualUser")
    
    antiAfkConn = player.Idled:Connect(function()
        if Settings.Misc.AntiAFK then
            virtualUser:CaptureController()
            virtualUser:ClickButton2(Vector2.new())
        end
    end)
    table.insert(allConnections, antiAfkConn)
    
    -- ========================================
    -- AUTO-REJOIN SYSTEM
    -- ========================================
    local function autoRejoin()
        if Settings.Misc.AutoRejoin then
            TeleportService:Teleport(game.PlaceId, player)
        end
    end
    
    -- Listen for kick
    local autoRejoinConn
    pcall(function()
        local coreGui = game:GetService("CoreGui")
        local errorPrompt = coreGui:WaitForChild("RobloxPromptGui", 1)
        if errorPrompt then
            local promptOverlay = errorPrompt:WaitForChild("promptOverlay", 1)
            if promptOverlay then
                promptOverlay.ChildAdded:Connect(function(child)
                    if Settings.Misc.AutoRejoin and child.Name == "ErrorPrompt" then
                        task.wait(2)
                        autoRejoin()
                    end
                end)
            end
        end
    end)
    
    -- ========================================
    -- KILL AURA SYSTEM
    -- ========================================
    local lastAuraSwing = 0
    
    local killAuraConn = RunService.Heartbeat:Connect(function()
        if isUnloading or _G.BinxixUnloaded then return end
        if not Settings.Combat.KillAura then return end
        
        local now = tick()
        if now - lastAuraSwing < Settings.Combat.KillAuraSpeed then return end
        
        local myChar = player.Character
        if not myChar then return end
        local myHRP = myChar:FindFirstChild("HumanoidRootPart")
        if not myHRP then return end
        
        local range = Settings.Combat.KillAuraRange
        local method = Settings.Combat.KillAuraMethod
        
        for _, target in ipairs(Players:GetPlayers()) do
            if isValidTarget(player, target) then
                local targetChar = target.Character
                if targetChar then
                    local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
                    local targetHumanoid = targetChar:FindFirstChild("Humanoid")
                    
                    if targetHRP and targetHumanoid and targetHumanoid.Health > 0 then
                        local dist = (myHRP.Position - targetHRP.Position).Magnitude
                        
                        if dist <= range then
                            if method == "Click" then
                                -- Simulate mouse click on the target
                                pcall(function()
                                    -- Try to use the equipped tool
                                    local tool = myChar:FindFirstChildOfClass("Tool")
                                    if tool then
                                        tool:Activate()
                                    else
                                        -- Simulate a click via virtual input
                                        local vu = game:GetService("VirtualUser")
                                        vu:ClickButton1(Vector2.new())
                                    end
                                end)
                            elseif method == "Touch" then
                                -- Fire .Touched on the target's parts
                                pcall(function()
                                    local tool = myChar:FindFirstChildOfClass("Tool")
                                    if tool then
                                        local handle = tool:FindFirstChild("Handle")
                                        if handle then
                                            for _, part in ipairs(targetChar:GetChildren()) do
                                                if part:IsA("BasePart") then
                                                    firetouchinterest(handle, part, 0)
                                                    task.defer(function()
                                                        pcall(function() firetouchinterest(handle, part, 1) end)
                                                    end)
                                                    break
                                                end
                                            end
                                        end
                                    end
                                end)
                            end
                            
                            lastAuraSwing = now
                            break -- Only attack one target per tick
                        end
                    end
                end
            end
        end
    end)
    table.insert(allConnections, killAuraConn)
    
    -- ========================================
    -- TRIGGER BOT SYSTEM (Integrated with Aimbot)
    -- When both Trigger Bot + Aimbot are on:
    --   Aimbot auto-engages (no right-click needed), trigger bot auto-fires
    -- When only Trigger Bot is on:
    --   Auto-fires when crosshair is on an enemy
    -- ========================================
    local lastTriggerFire = 0
    local triggerBotAimlockActive = false -- tracks if trigger bot started the aimbot
    
    local triggerBotConn = RunService.Heartbeat:Connect(function()
        if isUnloading or _G.BinxixUnloaded then return end
        if not Settings.Combat.TriggerBot then
            -- If trigger bot got turned off, clean up any aimlock it started
            if triggerBotAimlockActive then
                triggerBotAimlockActive = false
                if not toggleTrackingActive then -- don't stop if user manually has aimbot on
                    stopAimbotTracking()
                end
            end
            return
        end
        
        local now = tick()
        local camera = Workspace.CurrentCamera
        if not camera then return end
        
        local myChar = player.Character
        if not myChar then return end
        local myHumanoid = myChar:FindFirstChild("Humanoid")
        if not myHumanoid or myHumanoid.Health <= 0 then return end
        
        local screenCenter = camera.ViewportSize / 2
        local triggerFOV = Settings.Combat.TriggerBotFOV
        
        -- ========================================
        -- MODE 1: Trigger Bot + Aimbot combo
        -- Aimbot auto-locks, trigger bot auto-fires
        -- ========================================
        if Settings.Aimbot.Enabled then
            -- Check if aimbot is currently locked onto someone
            if isTracking and currentTarget then
                local targetChar = currentTarget.Character
                if targetChar then
                    local targetHumanoid = targetChar:FindFirstChild("Humanoid")
                    if targetHumanoid and targetHumanoid.Health > 0 then
                        -- Aimbot is locked on a live target — check if crosshair is close enough to fire
                        local lockPart = Settings.Aimbot.LockPart
                        local targetPart = targetChar:FindFirstChild(lockPart) or targetChar:FindFirstChild("Head") or targetChar:FindFirstChild("HumanoidRootPart")
                        
                        if targetPart then
                            local screenPos, onScreen = camera:WorldToViewportPoint(targetPart.Position)
                            
                            if onScreen and screenPos.Z > 0 then
                                local targetScreenPos = Vector2.new(screenPos.X, screenPos.Y)
                                local distFromCenter = (targetScreenPos - screenCenter).Magnitude
                                
                                -- Fire when the aimbot has the crosshair close enough
                                if distFromCenter <= triggerFOV and (now - lastTriggerFire) >= Settings.Combat.TriggerBotDelay then
                                    pcall(function()
                                        local tool = myChar:FindFirstChildOfClass("Tool")
                                        if tool then
                                            tool:Activate()
                                        else
                                            game:GetService("VirtualUser"):ClickButton1(Vector2.new())
                                        end
                                    end)
                                    lastTriggerFire = now
                                end
                            end
                        end
                    else
                        -- Target is dead, aimbot will auto-find new one
                    end
                end
            else
                -- Aimbot is NOT tracking — auto-engage it
                -- Scan for any enemy in the aimbot FOV
                local bestTarget = getNearestValidTarget()
                if bestTarget then
                    -- Start aimbot tracking automatically
                    triggerBotAimlockActive = true
                    startAimbotTracking()
                else
                    -- No targets in FOV, disengage if we started it
                    if triggerBotAimlockActive then
                        triggerBotAimlockActive = false
                        stopAimbotTracking()
                    end
                end
            end
            
            return -- Don't run standalone mode when aimbot is also on
        end
        
        -- ========================================
        -- MODE 2: Trigger Bot standalone (no aimbot)
        -- Just auto-fires when crosshair is naturally on an enemy
        -- ========================================
        if now - lastTriggerFire < Settings.Combat.TriggerBotDelay then return end
        
        for _, target in ipairs(Players:GetPlayers()) do
            if isValidTarget(player, target) then
                local targetChar = target.Character
                if targetChar then
                    local targetHead = targetChar:FindFirstChild("Head")
                    local targetHumanoid = targetChar:FindFirstChild("Humanoid")
                    
                    if targetHead and targetHumanoid and targetHumanoid.Health > 0 then
                        local screenPos, onScreen = camera:WorldToViewportPoint(targetHead.Position)
                        
                        if onScreen and screenPos.Z > 0 then
                            local targetScreenPos = Vector2.new(screenPos.X, screenPos.Y)
                            local distFromCenter = (targetScreenPos - screenCenter).Magnitude
                            
                            if distFromCenter <= triggerFOV then
                                pcall(function()
                                    local tool = myChar:FindFirstChildOfClass("Tool")
                                    if tool then
                                        tool:Activate()
                                    else
                                        game:GetService("VirtualUser"):ClickButton1(Vector2.new())
                                    end
                                end)
                                
                                lastTriggerFire = now
                                break
                            end
                        end
                    end
                end
            end
        end
    end)
    table.insert(allConnections, triggerBotConn)
    
    -- ========================================
    -- GUN MODS SYSTEM
    -- ========================================
    -- Stores original weapon values so they can be restored when toggled off
    local gunModOriginalValues = {
        FireRate = {},
        ReloadTime = {},
        EReloadTime = {},
        Auto = {},
        Spread = {},
        Recoil = {},
    }
    
    local lastGunModCheck = 0
    local GUN_MOD_INTERVAL = 0.5 -- only scan weapons every 0.5s to save performance
    
    local gunModConn = RunService.Heartbeat:Connect(function()
        if isUnloading or _G.BinxixUnloaded then return end
        
        local now = tick()
        if now - lastGunModCheck < GUN_MOD_INTERVAL then return end
        lastGunModCheck = now
        
        -- Check if any gun mod is enabled
        local anyEnabled = Settings.Combat.FastReload or Settings.Combat.FastFireRate
            or Settings.Combat.AlwaysAuto or Settings.Combat.NoSpread or Settings.Combat.NoRecoil
        if not anyEnabled then return end
        
        -- Find weapons folder
        local weapons = game:GetService("ReplicatedStorage"):FindFirstChild("Weapons")
        if not weapons then return end
        
        -- Fast Reload
        if Settings.Combat.FastReload then
            for _, v in pairs(weapons:GetChildren()) do
                if v:FindFirstChild("ReloadTime") then
                    if not gunModOriginalValues.ReloadTime[v] then
                        gunModOriginalValues.ReloadTime[v] = v.ReloadTime.Value
                    end
                    if v.ReloadTime.Value ~= 0.01 then
                        v.ReloadTime.Value = 0.01
                    end
                end
                if v:FindFirstChild("EReloadTime") then
                    if not gunModOriginalValues.EReloadTime[v] then
                        gunModOriginalValues.EReloadTime[v] = v.EReloadTime.Value
                    end
                    if v.EReloadTime.Value ~= 0.01 then
                        v.EReloadTime.Value = 0.01
                    end
                end
            end
        end
        
        -- Fast Fire Rate
        if Settings.Combat.FastFireRate then
            for _, v in pairs(weapons:GetDescendants()) do
                if v.Name == "FireRate" or v.Name == "BFireRate" then
                    if not gunModOriginalValues.FireRate[v] then
                        gunModOriginalValues.FireRate[v] = v.Value
                    end
                    if v.Value ~= 0.02 then
                        v.Value = 0.02
                    end
                end
            end
        end
        
        -- Always Auto
        if Settings.Combat.AlwaysAuto then
            for _, v in pairs(weapons:GetDescendants()) do
                if v.Name == "Auto" or v.Name == "AutoFire" or v.Name == "Automatic" or v.Name == "AutoShoot" or v.Name == "AutoGun" then
                    if not gunModOriginalValues.Auto[v] then
                        gunModOriginalValues.Auto[v] = v.Value
                    end
                    if v.Value ~= true then
                        v.Value = true
                    end
                end
            end
        end
        
        -- No Spread
        if Settings.Combat.NoSpread then
            for _, v in pairs(weapons:GetDescendants()) do
                if v.Name == "MaxSpread" or v.Name == "Spread" or v.Name == "SpreadControl" then
                    if not gunModOriginalValues.Spread[v] then
                        gunModOriginalValues.Spread[v] = v.Value
                    end
                    if v.Value ~= 0 then
                        v.Value = 0
                    end
                end
            end
        end
        
        -- No Recoil
        if Settings.Combat.NoRecoil then
            for _, v in pairs(weapons:GetDescendants()) do
                if v.Name == "RecoilControl" or v.Name == "Recoil" then
                    if not gunModOriginalValues.Recoil[v] then
                        gunModOriginalValues.Recoil[v] = v.Value
                    end
                    if v.Value ~= 0 then
                        v.Value = 0
                    end
                end
            end
        end
    end)
    table.insert(allConnections, gunModConn)
    
    -- Restore values when individual gun mods are toggled off
    local gunModRestoreConn = RunService.Heartbeat:Connect(function()
        if isUnloading or _G.BinxixUnloaded then return end
        
        -- Only restore when a mod was just turned off (check once per second)
        local now = tick()
        if now - lastGunModCheck < GUN_MOD_INTERVAL then return end
        
        if not Settings.Combat.FastReload then
            for obj, val in pairs(gunModOriginalValues.ReloadTime) do
                pcall(function() if obj and obj.Parent then obj.Value = val end end)
            end
            gunModOriginalValues.ReloadTime = {}
            for obj, val in pairs(gunModOriginalValues.EReloadTime) do
                pcall(function() if obj and obj.Parent then obj.Value = val end end)
            end
            gunModOriginalValues.EReloadTime = {}
        end
        
        if not Settings.Combat.FastFireRate then
            for obj, val in pairs(gunModOriginalValues.FireRate) do
                pcall(function() if obj and obj.Parent then obj.Value = val end end)
            end
            gunModOriginalValues.FireRate = {}
        end
        
        if not Settings.Combat.AlwaysAuto then
            for obj, val in pairs(gunModOriginalValues.Auto) do
                pcall(function() if obj and obj.Parent then obj.Value = val end end)
            end
            gunModOriginalValues.Auto = {}
        end
        
        if not Settings.Combat.NoSpread then
            for obj, val in pairs(gunModOriginalValues.Spread) do
                pcall(function() if obj and obj.Parent then obj.Value = val end end)
            end
            gunModOriginalValues.Spread = {}
        end
        
        if not Settings.Combat.NoRecoil then
            for obj, val in pairs(gunModOriginalValues.Recoil) do
                pcall(function() if obj and obj.Parent then obj.Value = val end end)
            end
            gunModOriginalValues.Recoil = {}
        end
    end)
    table.insert(allConnections, gunModRestoreConn)
    
    -- ========================================
    -- CHAT SPAMMER SYSTEM
    -- ========================================
    local lastChatSpam = 0
    
    local chatSpamConn = RunService.Heartbeat:Connect(function()
        if isUnloading or _G.BinxixUnloaded then return end
        if not Settings.Misc.ChatSpammer then return end
        
        local now = tick()
        if now - lastChatSpam < Settings.Misc.ChatSpamDelay then return end
        
        local message = Settings.Misc.ChatSpamMessage
        if message == "" then return end
        
        lastChatSpam = now
        
        pcall(function()
            -- Method 1: TextChatService (modern Roblox chat)
            local textChatService = game:GetService("TextChatService")
            local channels = textChatService:FindFirstChild("TextChannels")
            if channels then
                local rbxGeneral = channels:FindFirstChild("RBXGeneral")
                if rbxGeneral then
                    rbxGeneral:SendAsync(message)
                    return
                end
            end
        end)
        
        pcall(function()
            -- Method 2: Legacy chat system
            local chatService = game:GetService("Chat")
            local myChar = player.Character
            if myChar then
                chatService:Chat(myChar, message, Enum.ChatColor.White)
            end
        end)
        
        pcall(function()
            -- Method 3: ReplicatedStorage SayMessageRequest (legacy)
            local remote = game:GetService("ReplicatedStorage"):FindFirstChild("SayMessageRequest", true)
                or game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents", true)
            if remote then
                local sayMsg = remote:FindFirstChild("SayMessageRequest")
                if sayMsg then
                    sayMsg:FireServer(message, "All")
                end
            end
        end)
    end)
    table.insert(allConnections, chatSpamConn)
    
    -- ========================================
    -- FPS & VELOCITY DISPLAY
    -- ========================================
    -- ========================================
    -- FPS COUNTER (Top-Right Corner)
    -- ========================================
    local fpsContainer = Instance.new("Frame")
    fpsContainer.Name = "FPSContainer"
    fpsContainer.Size = UDim2.new(0, 100, 0, 26)
    fpsContainer.Position = UDim2.new(1, -110, 0, 10)
    fpsContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    fpsContainer.BackgroundTransparency = 0.3
    fpsContainer.BorderSizePixel = 1
    fpsContainer.BorderColor3 = Theme.Border
    fpsContainer.Visible = false
    fpsContainer.Parent = screenGui
    
    local fpsLabel = Instance.new("TextLabel")
    fpsLabel.Name = "FPSLabel"
    fpsLabel.Size = UDim2.new(1, -10, 1, 0)
    fpsLabel.Position = UDim2.new(0, 5, 0, 0)
    fpsLabel.BackgroundTransparency = 1
    fpsLabel.Text = "FPS: 0"
    fpsLabel.TextColor3 = Theme.AccentBright
    fpsLabel.TextSize = 14
    fpsLabel.Font = Enum.Font.SourceSansBold
    fpsLabel.TextXAlignment = Enum.TextXAlignment.Right
    fpsLabel.Parent = fpsContainer
    
    -- ========================================
    -- VELOCITY DISPLAY (Center-Right, Below Crosshair)
    -- ========================================
    local velocityLabel = Instance.new("TextLabel")
    velocityLabel.Name = "VelocityLabel"
    velocityLabel.Size = UDim2.new(0, 160, 0, 20)
    velocityLabel.Position = UDim2.new(0.5, 40, 0.5, 25)
    velocityLabel.BackgroundTransparency = 1
    velocityLabel.Text = "0.0 studs/s"
    velocityLabel.TextColor3 = Theme.AccentPink
    velocityLabel.TextSize = 13
    velocityLabel.Font = Enum.Font.SourceSansBold
    velocityLabel.TextStrokeTransparency = 0.5
    velocityLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    velocityLabel.TextXAlignment = Enum.TextXAlignment.Left
    velocityLabel.Visible = false
    velocityLabel.Parent = screenGui
    
    local lastFpsUpdate = tick()
    local frameCount = 0
    local currentFps = 0
    
    local statsConn = RunService.RenderStepped:Connect(function()
        if isUnloading or _G.BinxixUnloaded then return end
        
        -- FPS container visibility
        fpsContainer.Visible = Settings.Visuals.ShowFPS
        -- Velocity label visibility (separate from FPS)
        velocityLabel.Visible = Settings.Visuals.ShowVelocity
        
        -- FPS calculation
        if Settings.Visuals.ShowFPS then
            frameCount = frameCount + 1
            if tick() - lastFpsUpdate >= 1 then
                currentFps = frameCount
                frameCount = 0
                lastFpsUpdate = tick()
            end
            fpsLabel.Text = "FPS: " .. tostring(currentFps)
        end
        
        -- Velocity calculation
        if Settings.Visuals.ShowVelocity then
            local char = player.Character
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local velocity = hrp.AssemblyLinearVelocity
                    local horizontalSpeed = Vector3.new(velocity.X, 0, velocity.Z).Magnitude
                    velocityLabel.Text = string.format("%.1f studs/s", horizontalSpeed)
                end
            end
        end
    end)
    table.insert(allConnections, statsConn)
    
    -- ========================================
    -- TOGGLE GUI KEYBIND + AIMBOT INPUT
    -- ========================================
    local inputBeganConn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if isUnloading or _G.BinxixUnloaded then return end
        if gameProcessed then return end
        
        -- Skip if waiting for keybind
        if waitingForKey or waitingForTPKey then return end
        
        -- Toggle GUI with custom keybind
        if input.KeyCode == currentToggleKey then
            mainFrame.Visible = not mainFrame.Visible
        end
        
        -- Toggle Fly with F key
        if input.KeyCode == Enum.KeyCode.F then
            if Settings.Movement.Fly then
                if isFlying then
                    stopFly()
                else
                    startFly()
                end
            end
        end
        
        -- Toggle Auto TP Loop with custom keybind
        if input.KeyCode == autoTPToggleKey then
            toggleAutoTP()
        end
        
        -- Aimbot with Right Mouse Button
        if input.UserInputType == Enum.UserInputType.MouseButton2 then
            if Settings.Aimbot.Enabled then
                if Settings.Aimbot.Toggle then
                    -- Toggle mode
                    if toggleTrackingActive then
                        toggleTrackingActive = false
                        stopAimbotTracking()
                    else
                        toggleTrackingActive = true
                        startAimbotTracking()
                    end
                else
                    -- Hold mode
                    startAimbotTracking()
                end
            end
        end
    end)
    table.insert(allConnections, inputBeganConn)
    
    local inputEndedConn = UserInputService.InputEnded:Connect(function(input)
        if isUnloading or _G.BinxixUnloaded then return end
        
        -- Stop aimbot when releasing RMB (hold mode only)
        -- BUT don't stop if trigger bot is managing the aimlock
        if input.UserInputType == Enum.UserInputType.MouseButton2 then
            if Settings.Aimbot.Enabled and not Settings.Aimbot.Toggle then
                if not (Settings.Combat.TriggerBot and triggerBotAimlockActive) then
                    stopAimbotTracking()
                end
            end
        end
    end)
    table.insert(allConnections, inputEndedConn)
    
    return screenGui
end

-- ============================================
-- INITIALIZE
-- ============================================
local gui = createAirHubStyleGUI()

-- Show loaded notification
local loadedNotif = Instance.new("TextLabel")
loadedNotif.Size = UDim2.new(0, 200, 0, 24)
loadedNotif.Position = UDim2.new(0.5, -100, 1, -30)
loadedNotif.BackgroundColor3 = Theme.BackgroundDark
loadedNotif.BorderSizePixel = 1
loadedNotif.BorderColor3 = Theme.Border
loadedNotif.Text = "Binxix Hub V6 Loaded"
loadedNotif.TextColor3 = Theme.AccentPink
loadedNotif.TextSize = 12
loadedNotif.Font = Enum.Font.SourceSans
loadedNotif.Parent = gui

task.spawn(function()
    task.wait(3)
    for i = 0, 1, 0.05 do
        loadedNotif.TextTransparency = i
        loadedNotif.BackgroundTransparency = i
        task.wait(0.02)
    end
    loadedNotif:Destroy()
end)

print("Binxix Hub V6 (AirHub V2 Style) loaded successfully!")
print("Press RightControl to toggle the GUI")

-- Send startup notification
task.delay(0.5, function()
    sendNotification("Binxix Hub V6", "Loaded — press RightControl to toggle", 4)
end)

-- Discord invite on startup
task.delay(2, function()
    pcall(function()
        if setclipboard then
            setclipboard("https://discord.gg/S4nPV2Rx7F")
        end
    end)
    sendNotification("Discord", "Join the Binxix Hub Discord! Invite copied to clipboard", 5)
end)
