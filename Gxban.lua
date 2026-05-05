local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local YTLabel = Instance.new("TextLabel")
local UIBox = Instance.new("UICorner")
local ScrollFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local ToggleButton = Instance.new("TextButton")

ScreenGui.Name = "GxUltimateV4_Clean"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 250, 0, 350)
MainFrame.Active = true
MainFrame.Draggable = true
UIBox.CornerRadius = UDim.new(0, 15)
UIBox.Parent = MainFrame

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 45)
Title.Text = "GX ULTIMATE V4"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20
Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 15)

YTLabel.Parent = MainFrame
YTLabel.Position = UDim2.new(0, 0, 0.13, 0)
YTLabel.Size = UDim2.new(1, 0, 0, 20)
YTLabel.Text = "YT: @gxgrafix"
YTLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
YTLabel.BackgroundTransparency = 1
YTLabel.TextSize = 14

ScrollFrame.Parent = MainFrame
ScrollFrame.Position = UDim2.new(0.05, 0, 0.22, 0)
ScrollFrame.Size = UDim2.new(0.9, 0, 0.75, 0)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.ScrollBarThickness = 3
ScrollFrame.CanvasSize = UDim2.new(0, 0, 3, 0)

UIListLayout.Parent = ScrollFrame
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local function createToggle(name, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.95, 0, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.Text = name .. " : OFF"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.Parent = ScrollFrame
    Instance.new("UICorner", btn)

    local state = false
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = name .. " : " .. (state and "ON" or "OFF")
        btn.BackgroundColor3 = state and Color3.fromRGB(0, 100, 0) or Color3.fromRGB(40, 40, 40)
        callback(state)
    end)
end

local function createInput(name, placeholder, callback)
    local box = Instance.new("TextBox")
    box.Size = UDim2.new(0.95, 0, 0, 35)
    box.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    box.PlaceholderText = name .. " (" .. placeholder .. ")"
    box.Text = ""
    box.TextColor3 = Color3.fromRGB(255, 215, 0)
    box.Font = Enum.Font.SourceSansBold
    box.Parent = ScrollFrame
    Instance.new("UICorner", box)
    box.FocusLost:Connect(function() callback(tonumber(box.Text) or tonumber(placeholder)) end)
end

local lp = game.Players.LocalPlayer
local noclip = false
local infJump = false

createToggle("Noclip", function(val)
    noclip = val
    game:GetService("RunService").Stepped:Connect(function()
        if noclip and lp.Character then
            for _, v in pairs(lp.Character:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end
    end)
end)

createToggle("Fly", function(val)
    local flying = val
    local speed = 50
    if flying then
        local bv = Instance.new("BodyVelocity", lp.Character.HumanoidRootPart)
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Velocity = Vector3.new(0, 0.1, 0)
        task.spawn(function()
            while flying do
                bv.Velocity = lp.Character.Humanoid.MoveDirection * speed + Vector3.new(0, 0.1, 0)
                task.wait()
            end
            bv:Destroy()
        end)
    end
end)

createInput("Set Speed", "16", function(val) lp.Character.Humanoid.WalkSpeed = val end)
createInput("Set Jump", "50", function(val) lp.Character.Humanoid.JumpPower = val end)

createToggle("God Mode", function(val)
    if val then
        lp.Character.Humanoid.MaxHealth = math.huge
        lp.Character.Humanoid.Health = math.huge
    else
        lp.Character.Humanoid.MaxHealth = 100
    end
end)

createToggle("Infinity Jump", function(val)
    infJump = val
    game:GetService("UserInputService").JumpRequest:Connect(function()
        if infJump then
            lp.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end)
end)

createToggle("Low Graphic", function(state)
    if state then
        settings().Rendering.QualityLevel = 1
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("Part") or v:IsA("MeshPart") then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Enabled = false
            end
        end
    else
        settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
    end
end)

createToggle("Super High Graphic", function(state)
    if state then
        settings().Rendering.QualityLevel = 21
        local lighting = game:GetService("Lighting")
        lighting.GlobalShadows = true
        lighting.Brightness = 2
        if not lighting:FindFirstChild("Bloom") then
            local bloom = Instance.new("BloomEffect", lighting)
            bloom.Intensity = 1
        end
    end
end)

createToggle("Hide Player", function(state)
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= lp and player.Character then
            for _, part in pairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("Decal") then
                    part.Transparency = state and 1 or 0
                end
            end
        end
    end
end)

createToggle("Hide UI", function()
    MainFrame.Visible = false
    ToggleButton.Visible = true
end)

ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 80, 0, 30)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.Text = "OPEN GX"
ToggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Visible = false
Instance.new("UICorner", ToggleButton)

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    ToggleButton.Visible = false
end)
