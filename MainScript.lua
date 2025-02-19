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

    -- Memuat dan mengeksekusi fungsi dari GitHub
    -- Pastikan URL GitHub mengarah ke file raw (gunakan link raw GitHub)
    
    -- Infinite Jump
    local infiniteJumpScript = game:HttpGet('https://raw.githubusercontent.com/daydream410/homieshub/main/InfiniteJump.lua')
    local infiniteJump = loadstring(infiniteJumpScript)
    infiniteJump(MainTab, MainSection)

    -- Flashlight
    local flashlightScript = game:HttpGet('https://raw.githubusercontent.com/daydream410/homieshub/main/Flashlight.lua')
    local flashlight = loadstring(flashlightScript)
    flashlight(MainTab, MainSection)

    -- WalkSpeed
    local walkSpeedScript = game:HttpGet('https://raw.githubusercontent.com/daydream410/homieshub/main/WalkSpeed.lua')
    local walkSpeed = loadstring(walkSpeedScript)
    walkSpeed(MainTab, MainSection)

    -- JumpPower
    local jumpPowerScript = game:HttpGet('https://raw.githubusercontent.com/daydream410/homieshub/main/JumpPower.lua')
    local jumpPower = loadstring(jumpPowerScript)
    jumpPower(MainTab, MainSection)

    -- Gravity
    local gravityScript = game:HttpGet('https://raw.githubusercontent.com/daydream410/homieshub/main/Gravity.lua')
    local gravity = loadstring(gravityScript)
    gravity(MainTab, MainSection)

    -- Other Section
    local OtherSection = MainTab:CreateSection("Other")
    
    -- FreezeCamera
    local freezeCameraScript = game:HttpGet('https://raw.githubusercontent.com/daydream410/homieshub/main/FreezeCamera.lua')
    local freezeCamera = loadstring(freezeCameraScript)
    freezeCamera(MainTab, OtherSection)

    -- Info Tab untuk fitur lainnya
    local InfoTab = Window:CreateTab("🤔", nil)
    local infoTabScript = game:HttpGet('https://raw.githubusercontent.com/daydream410/homieshub/main/InfoTab.lua')
    local infoTab = loadstring(infoTabScript)
    infoTab(InfoTab)
else
    -- Jika game ID tidak cocok, tampilkan notifikasi atau berhenti
    game.StarterGui:SetCore("SendNotification", {
        Title = "Game Check",
        Text = "WRONG GAME!",
        Duration = 5
    })
    return  -- Menyudahi skrip jika game ID tidak cocok
end
