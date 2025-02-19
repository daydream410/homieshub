"-- Flashlight.lua\r\n\r\nreturn function(MainTab, MainSection)\r\n    local flashlightToggle = MainTab:CreateToggle({\r\n        Name = \"Flashlight\",\r\n        CurrentValue = false,\r\n        Flag = \"FlashlightFlag\",\r\n        Callback = function(Value)\r\n            local player = game.Players.LocalPlayer\r\n            local character = player.Character or player.CharacterAdded:Wait()\r\n            local humanoidRootPart = character:WaitForChild(\"HumanoidRootPart\", 5)\r\n\r\n            if not humanoidRootPart then\r\n                game.StarterGui:SetCore(\"SendNotification\", {\r\n                    Title = \"Error\",\r\n                    Text = \"HumanoidRootPart not found!\",\r\n                    Duration = 5\r\n                })\r\n                return\r\n            end\r\n\r\n            local function addSpotLightAroundPlayer()\r\n                local light = Instance.new(\"SpotLight\")\r\n                light.Parent = humanoidRootPart\r\n                light.Range = 30\r\n                light.Brightness = 7\r\n                light.Color = Color3.fromRGB(255, 255, 255)\r\n                light.Enabled = true\r\n                light.Angle = 45\r\n                light.Direction = humanoidRootPart.CFrame.LookVector\r\n\r\n                local offset = Instance.new(\"Attachment\")\r\n                offset.Parent = humanoidRootPart\r\n                offset.Position = Vector3.new(0, 3, 0)\r\n                light.Attachment0 = offset\r\n            end\r\n\r\n            if Value then\r\n                game.StarterGui:SetCore(\"SendNotification\", {\r\n                    Title = \"Homies Hub\",\r\n                    Text = \"Flashlight Activated!\",\r\n                    Duration = 5\r\n                })\r\n                addSpotLightAroundPlayer()\r\n            else\r\n                game.StarterGui:SetCore(\"SendNotification\", {\r\n                    Title = \"Homies Hub\",\r\n                    Text = \"Flashlight Deactivated!\",\r\n                    Duration = 5\r\n                })\r\n                local existingLight = humanoidRootPart:FindFirstChildOfClass(\"SpotLight\")\r\n                if existingLight then\r\n                    existingLight.Enabled = false\r\n                    existingLight:Destroy()\r\n                end\r\n            end\r\n        end,\r\n    })\r\nend\r\n"