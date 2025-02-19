-- Gravity.lua

return function(MainTab, MainSection)
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
end
