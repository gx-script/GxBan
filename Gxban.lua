local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GxBanSystem"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

local bannedUser = ""
local banMessage = "You Banned By Yt @gxgrafix"

local function createPanel()
    local Panel = Instance.new("Frame")
    local UIStroke = Instance.new("UIStroke")
    local UICorner = Instance.new("UICorner")
    local Header = Instance.new("TextLabel")
    local YTInfo = Instance.new("TextLabel")
    local InputBox = Instance.new("TextBox")
    local BanButton = Instance.new("TextButton")
    local StatusLabel = Instance.new("TextLabel")
    local HideButton = Instance.new("TextButton")
    local OpenButton = Instance.new("TextButton")

    Panel.Name = "MainPanel"
    Panel.Parent = ScreenGui
    Panel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Panel.Position = UDim2.new(0.5, -110, 0.4, -75)
    Panel.Size = UDim2.new(0, 220, 0, 200)
    Panel.Active = true
    Panel.Draggable = true
    Panel.Visible = false

    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = Panel

    UIStroke.Thickness = 2
    UIStroke.Color = Color3.fromRGB(255, 215, 0)
    UIStroke.Parent = Panel

    Header.Parent = Panel
    Header.Size = UDim2.new(1, 0, 0, 40)
    Header.Text = "GX BAN"
    Header.TextColor3 = Color3.fromRGB(255, 215, 0)
    Header.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Header.Font = Enum.Font.SourceSansBold
    Header.TextSize = 24
    Instance.new("UICorner", Header)

    YTInfo.Parent = Panel
    YTInfo.Position = UDim2.new(0, 0, 0.22, 0)
    YTInfo.Size = UDim2.new(1, 0, 0, 20)
    YTInfo.Text = "YT: @gxgrafix"
    YTInfo.TextColor3 = Color3.fromRGB(150, 150, 150)
    YTInfo.BackgroundTransparency = 1
    YTInfo.TextSize = 14

    InputBox.Parent = Panel
    InputBox.Position = UDim2.new(0.1, 0, 0.4, 0)
    InputBox.Size = UDim2.new(0.8, 0, 0, 35)
    InputBox.PlaceholderText = "Username Target..."
    InputBox.Text = ""
    InputBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", InputBox)

    BanButton.Parent = Panel
    BanButton.Position = UDim2.new(0.1, 0, 0.65, 0)
    BanButton.Size = UDim2.new(0.8, 0, 0, 35)
    BanButton.Text = "BAN PLAYER"
    BanButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    BanButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    BanButton.Font = Enum.Font.SourceSansBold
    Instance.new("UICorner", BanButton)

    StatusLabel.Parent = Panel
    StatusLabel.Position = UDim2.new(0, 0, 0.85, 0)
    StatusLabel.Size = UDim2.new(1, 0, 0, 25)
    StatusLabel.Text = "System Online"
    StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.TextSize = 12

    HideButton.Parent = Panel
    HideButton.Position = UDim2.new(0.85, 0, 0.02, 0)
    HideButton.Size = UDim2.new(0, 25, 0, 25)
    HideButton.Text = "X"
    HideButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    HideButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", HideButton)

    OpenButton.Parent = ScreenGui
    OpenButton.Size = UDim2.new(0, 80, 0, 30)
    OpenButton.Position = UDim2.new(0, 10, 0, 10)
    OpenButton.Text = "Open GX"
    OpenButton.Visible = false
    OpenButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    OpenButton.TextColor3 = Color3.fromRGB(255, 215, 0)
    Instance.new("UICorner", OpenButton)

    BanButton.MouseButton1Click:Connect(function()
        local targetName = InputBox.Text
        if targetName ~= "" then
            bannedUser = targetName
            StatusLabel.Text = "Banned: " .. targetName
            StatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    end)

    HideButton.MouseButton1Click:Connect(function()
        Panel.Visible = false
        OpenButton.Visible = true
    end)

    OpenButton.MouseButton1Click:Connect(function()
        Panel.Visible = true
        OpenButton.Visible = false
    end)

    Panel.Visible = true
end

local TermsFrame = Instance.new("Frame")
TermsFrame.Name = "TermsFrame"
TermsFrame.Parent = ScreenGui
TermsFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TermsFrame.Position = UDim2.new(0.5, -150, 0.3, 0)
TermsFrame.Size = UDim2.new(0, 300, 0, 250)
Instance.new("UICorner", TermsFrame)
Instance.new("UIStroke", TermsFrame).Color = Color3.fromRGB(255, 215, 0)

local TermsTitle = Instance.new("TextLabel")
TermsTitle.Parent = TermsFrame
TermsTitle.Size = UDim2.new(1, 0, 0, 40)
TermsTitle.Text = "TERMS & CONDITIONS"
TermsTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
TermsTitle.BackgroundTransparency = 1
TermsTitle.Font = Enum.Font.SourceSansBold
TermsTitle.TextSize = 18

local TermsContent = Instance.new("TextLabel")
TermsContent.Parent = TermsFrame
TermsContent.Position = UDim2.new(0.05, 0, 0.2, 0)
TermsContent.Size = UDim2.new(0.9, 0, 0.6, 0)
TermsContent.Text = "1. How it works: This is a Client-Side Auto-Kick. It removes players from YOUR current server.\n2. Limit: Target can still join OTHER public servers.\n3. Safe: Use at your own risk. This script does not permanently delete Roblox accounts.\n4. Author: Yt @gxgrafix"
TermsContent.TextColor3 = Color3.fromRGB(200, 200, 200)
TermsContent.BackgroundTransparency = 1
TermsContent.TextWrapped = true
TermsContent.TextXAlignment = Enum.TextXAlignment.Left
TermsContent.TextYAlignment = Enum.TextYAlignment.Top
TermsContent.Font = Enum.Font.SourceSans
TermsContent.TextSize = 14

local AcceptButton = Instance.new("TextButton")
AcceptButton.Parent = TermsFrame
AcceptButton.Position = UDim2.new(0.1, 0, 0.8, 0)
AcceptButton.Size = UDim2.new(0.8, 0, 0, 35)
AcceptButton.Text = "I AGREE & START"
AcceptButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
AcceptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AcceptButton.Font = Enum.Font.SourceSansBold
Instance.new("UICorner", AcceptButton)

AcceptButton.MouseButton1Click:Connect(function()
    TermsFrame:Destroy()
    createPanel()
end)

task.spawn(function()
    while task.wait(1) do
        if bannedUser ~= "" then
            for _, player in pairs(game.Players:GetPlayers()) do
                if (player.Name == bannedUser or player.DisplayName == bannedUser) and player ~= game.Players.LocalPlayer then
                    player:Kick(banMessage)
                end
            end
        end
    end
end)
