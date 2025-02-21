
local Window = Rayfield:CreateWindow({
   Name = "Homies Hub",
   LoadingTitle = "Apa kek udah gede",
   LoadingSubtitle = "by yugieooh",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "homies",
      FileName = "Homies Hub"
   },
    Discord = {
      Enabled = true,
      Invite = "WMNPSwKgQ8",
      RememberJoins = false
   },
   KeySystem = true,
   KeySettings = {
      Title = "Homies Hub",
      Subtitle = "Key System",
      Note = "Join The Discord For Key",
      FileName = "HomiesHubKey1",
      SaveKey = false,
      GrabKeyFromSite = true,
      Key = {"https://pastebin.com/raw/5wrVW0LY"}
   }
})

local MainTab = Window:CreateTab("🏠Home", nil)
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "Homies Hub Script",
   Content = "By yugieooh",
   Duration = 5,
   Image = 13047715178,
   Actions = {
      Ignore = {
         Name = "Okay!",
         Callback = function()
         end
      }
   },
})

local infiniteJumpToggle = MainTab:CreateToggle({
   Name = "Infinite Jump (Fall Damage)",
   CurrentValue = false,
   Flag = "InfJumpFlag",
   Callback = function(Value)
       _G.infinjump = Value

       local function setupInfiniteJump(character)
           local humanoid = character:WaitForChild("Humanoid")
           local UserInputService = game:GetService('UserInputService')

           UserInputService.InputBegan:Connect(function(input, gameProcessed)
               if not gameProcessed and input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Space then
                   if _G.infinjump then
                       humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                       task.wait(0.1)
                       humanoid:ChangeState(Enum.HumanoidStateType.Seated)
                   end
               end
           end)
       end

       local plr = game:GetService('Players').LocalPlayer
       local character = plr.Character or plr.CharacterAdded:Wait()
       setupInfiniteJump(character)

       plr.CharacterAdded:Connect(function(newCharacter)
           setupInfiniteJump(newCharacter)
       end)

       if Value then
           game.StarterGui:SetCore("SendNotification", {
               Title = "Homies Hub",
               Text = "Infinite Jump Activated!",
               Duration = 5
           })
           Rayfield:Notify({
            Title = "WARNING",
            Content = "Fall Damage still affected if u using Infinite Jump!",
            Duration = 10,
            Image = "message-square-warning",
            })
       else
           game.StarterGui:SetCore("SendNotification", {
               Title = "Homies Hub",
               Text = "Infinite Jump Deactivated!",
               Duration = 5
           })
       end
   end,
})

local flashlightToggle = MainTab:CreateToggle({
   Name = "Flashlight",
   CurrentValue = false,
   Flag = "FlashlightFlag",
   Callback = function(Value)
       local player = game.Players.LocalPlayer
       local character = player.Character or player.CharacterAdded:Wait()

       local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)

       if not humanoidRootPart then
           game.StarterGui:SetCore("SendNotification", {
               Title = "Error",
               Text = "HumanoidRootPart not found!",
               Duration = 5
           })
           return
       end

       local function addSpotLightAroundPlayer()
           local light = Instance.new("SpotLight")
           light.Parent = humanoidRootPart
           light.Range = 50
           light.Brightness = 7
           light.Color = Color3.fromRGB(255, 255, 255)
           light.Enabled = true
           light.Angle = 90
           
       end

       if Value then
           game.StarterGui:SetCore("SendNotification", {
               Title = "Homies Hub",
               Text = "Flashlight Activated!",
               Duration = 5
           })

           addSpotLightAroundPlayer()
       else
           game.StarterGui:SetCore("SendNotification", {
               Title = "Homies Hub",
               Text = "Flashlight Deactivated!",
               Duration = 5
           })

           local existingLight = humanoidRootPart:FindFirstChildOfClass("SpotLight")
           if existingLight then
               existingLight:Destroy()
           end
       end
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderws",
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "JumpPower (No Fall Damage)",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Power",
   CurrentValue = 16,
   Flag = "sliderjp",
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "Gravity (No Fall Damage)",
   Range = {1, 500},
   Increment = 1,
   Suffix = "Gravity",
   CurrentValue = game.Workspace.Gravity,
   Flag = "slidergravity",
   Callback = function(Value)
        game.Workspace.Gravity = Value
   end,
})

local OtherSection = MainTab:CreateSection("Other")

local FreezeCameraToggle = MainTab:CreateToggle({
    Name = "Freeze Camera",
    CurrentValue = false,
    Flag = "FreezeCameraFlag",
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local camera = game.Workspace.CurrentCamera

        local function setFreezeCamera(enable)
            if enable then
                camera.FieldOfView = 70
                camera.CameraType = Enum.CameraType.Scriptable 

                local function updateCamera()
                    while enable do
                        camera.CFrame = camera.CFrame
                        wait(0.1)
                    end
                end

                coroutine.wrap(updateCamera)()
                
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Freeze Camera",
                    Text = "Camera movement is interrupted.",
                    Duration = 5
                })
            else
                camera.CameraType = Enum.CameraType.Custom 
            end
        end

        setFreezeCamera(Value)
    end,
})

local highlightToggle = MainTab:CreateToggle({
    Name = "Highlight All Player",
    CurrentValue = false,
    Flag = "highlightFlag",
    Callback = function(Value)
        local players = game:GetService("Players")

        local function addHighlight(player)
            if player ~= players.LocalPlayer and player.Character then 
                local character = player.Character
                if character and character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("Head") then
                    local existingHighlight = character:FindFirstChildOfClass("Highlight")
                    if not existingHighlight then
                        local highlight = Instance.new("Highlight")
                        highlight.Parent = character
                        highlight.FillColor = Color3.fromRGB(255, 255, 0)
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255) 
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        highlight.FillTransparency = 0.5 
                        highlight.OutlineTransparency = 0 
                    end

                    local nameLabel = character:FindFirstChildOfClass("BillboardGui")

                    if not nameLabel then
                        nameLabel = Instance.new("BillboardGui")
                        nameLabel.Adornee = character.Head
                        nameLabel.Size = UDim2.new(0, 100, 0, 30)
                        nameLabel.StudsOffset = Vector3.new(0, 3, 0)
                        nameLabel.AlwaysOnTop = true

                        local textLabel = Instance.new("TextLabel")
                        textLabel.Parent = nameLabel
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.BackgroundTransparency = 1
                        textLabel.Text = player.Name
                        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                        textLabel.TextStrokeTransparency = 0.5
                        textLabel.TextSize = 14

                        nameLabel.Parent = character
                    end
                end
            end
        end
        
        local function removeHighlight(player)
            if player.Character then
                local existingHighlight = player.Character:FindFirstChildOfClass("Highlight")
                if existingHighlight then
                    existingHighlight:Destroy()
                end

                local nameLabel = player.Character:FindFirstChildOfClass("BillboardGui")
                if nameLabel then
                    nameLabel:Destroy()
                end
            end
        end

        if Value then
            game.StarterGui:SetCore("SendNotification", {
                Title = "Homies Hub",
                Text = "Player Highlight Activated!",
                Duration = 5
            })

            for _, player in pairs(players:GetPlayers()) do
                addHighlight(player)
            end

            players.PlayerAdded:Connect(addHighlight)

        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "Homies Hub",
                Text = "Player Highlight Deactivated!",
                Duration = 5
            })
            
            for _, player in pairs(players:GetPlayers()) do
                removeHighlight(player)
            end
        end
    end,
})

local InfoTab = Window:CreateTab("🤔 Info", nil)

local infoLabel = InfoTab:CreateLabel("Homies Hub by yugieooh")
local versionLabel = InfoTab:CreateLabel("Version: 1.0")
local textLabel = InfoTab:CreateLabel("More Features Are Coming!")

infoLabel.Position = UDim2.new(0, 0, 0, 20)  
versionLabel.Position = UDim2.new(0, 0, 0, 40) 
textLabel.Position = UDim2.new(0, 0, 0, 60) 
