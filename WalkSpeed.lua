-- WalkSpeed.lua

return function(MainTab, MainSection)
    local Slider = MainTab:CreateSlider({
        Name = "WalkSpeed",
        Range = {1, 350},
        Increment = 1,
        Suffix = "Speed",
        CurrentValue = 16,
        Flag = "sliderws",
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end,
    })
end
