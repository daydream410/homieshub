-- Flashlight.lua

return function(MainTab, MainSection)
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
                light.Range = 30
                light.Brightness = 7
                light.Color = Color3.fromRGB(255, 255, 255)
                light.Enabled = true
                light.Angle = 45
                light.Direction = humanoidRootPart.CFrame.LookVector

                local offset = Instance.new("Attachment")
                offset.Parent = humanoidRootPart
                offset.Position = Vector3.new(0, 3, 0)
                light.Attachment0 = offset
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
                    existingLight.Enabled = false
                    existingLight:Destroy()
                end
            end
        end,
    })
end
