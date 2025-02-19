-- JumpPower.lua

return function(MainTab, MainSection)
    local Slider = MainTab:CreateSlider({
        Name = "JumpPower (No Fall Damage)",
        Range = {1, 350},
        Increment = 1,
        Suffix = "Power",
        CurrentValue = 16,
        Flag = "sliderjp",
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end,
    })
end
