-- MainScript.lua

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local targetGameID = 2693023319  -- Ganti dengan ID game yang sesuai

-- Mendapatkan ID game saat ini
local currentGameID = game.PlaceId

-- Mengecek apakah game ID cocok
if currentGameID == targetGameID then
    -- Skrip hanya akan dijalankan jika game ID cocok
    game.StarterGui:SetCore("SendNotification", {
        Title = "Game Check",
        Text = "CORRECT GAME!",
        Duration = 5
    })
    -- Menunggu 5 detik agar notifikasi "Game Check" muncul
    task.wait(5)

    -- Memanggil fungsi untuk membuat Window
    local Window = require(game.ServerScriptService:WaitForChild("CreateWindow"))()

    -- Main Tab
    local MainTab = Window:CreateTab("🏠", nil)
    local MainSection = MainTab:CreateSection("Main")

    -- Menampilkan notifikasi
    Rayfield:Notify({
        Title = "Homies Hub Script",
        Content = "By yugieooh",
        Duration = 5,
        Image = 13047715178,
        Actions = {
            Ignore = {
                Name = "Okay!",
                Callback = function() end
            }
        }
    })

    -- Fungsi untuk Infinite Jump
    require(game.ServerScriptService:WaitForChild("InfiniteJump"))(MainTab, MainSection)

    -- Fungsi untuk Flashlight
    require(game.ServerScriptService:WaitForChild("Flashlight"))(MainTab, MainSection)

    -- Fungsi untuk WalkSpeed
    require(game.ServerScriptService:WaitForChild("WalkSpeed"))(MainTab, MainSection)

    -- Fungsi untuk JumpPower
    require(game.ServerScriptService:WaitForChild("JumpPower"))(MainTab, MainSection)

    -- Fungsi untuk Gravity
    require(game.ServerScriptService:WaitForChild("Gravity"))(MainTab, MainSection)

    -- Other Section
    local OtherSection = MainTab:CreateSection("Other")
    require(game.ServerScriptService:WaitForChild("FreezeCamera"))(MainTab, OtherSection)

    -- Info Tab untuk fitur lainnya
    local InfoTab = Window:CreateTab("🤔", nil)
    require(game.ServerScriptService:WaitForChild("InfoTab"))(InfoTab)
else
    -- Jika game ID tidak cocok, tampilkan notifikasi atau berhenti
    game.StarterGui:SetCore("SendNotification", {
        Title = "Game Check",
        Text = "WRONG GAME!",
        Duration = 5
    })
    return  -- Menyudahi skrip jika game ID tidak cocok
end
