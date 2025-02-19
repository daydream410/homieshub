-- InfiniteJump.lua

return function(MainTab, MainSection)
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
            else
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Homies Hub",
                    Text = "Infinite Jump Deactivated!",
                    Duration = 5
                })
            end
        end,
    })
end
