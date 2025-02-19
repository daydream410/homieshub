-- FreezeCamera.lua

return function(MainTab, OtherSection)
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
                    camera.CFrame = camera.CFrame

                    local function updateCamera()
                        while enable do
                            camera.CFrame = camera.CFrame
                            wait(0.1)
                        end
                    end
                    spawn(updateCamera)
                else
                    camera.CameraType = Enum.CameraType.Custom
                end
            end

            setFreezeCamera(Value)
        end,
    })
end
