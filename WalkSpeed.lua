"-- WalkSpeed.lua\r\n\r\nreturn function(MainTab, MainSection)\r\n    local Slider = MainTab:CreateSlider({\r\n        Name = \"WalkSpeed\",\r\n        Range = {1, 350},\r\n        Increment = 1,\r\n        Suffix = \"Speed\",\r\n        CurrentValue = 16,\r\n        Flag = \"sliderws\",\r\n        Callback = function(Value)\r\n            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value\r\n        end,\r\n    })\r\nend\r\n"