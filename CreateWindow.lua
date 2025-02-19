-- CreateWindow.lua

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

return function()
    return Rayfield:CreateWindow({
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
            Title = "Key | Homies Hub",
            Subtitle = "Key System",
            Note = "Key In Discord Server",
            FileName = "HomiesHubKey1",
            SaveKey = false,
            GrabKeyFromSite = false,
            Key = {"homies"}
        }
    })
end
