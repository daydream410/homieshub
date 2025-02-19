local baseURL = "https://raw.githubusercontent.com/daydream410/homieshub/main/"
local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local ID = game.PlaceId

-- Fungsi untuk memilih skrip berdasarkan ID game
function GetGameScript()
    if ID == 2693023319 then  -- Ganti dengan ID game yang sesuai
        return "HomiesHub.lua"
    elseif ID == 10450270085 then
        return "JujutsuInfinite.lua"
    elseif ID == 16379688837 then
        return "HaikyuLegends.lua"
    -- Tambahkan kondisi ID game lainnya di sini
    else
        print("Game not supported")
        return nil
    end
end

local gameScript = GetGameScript()

if gameScript then
    -- Menampilkan notifikasi "Correct Game"
    game.StarterGui:SetCore("SendNotification", {
        Title = "Game Check",
        Text = "CORRECT GAME!",
        Duration = 5
    })
    task.wait(5)

    -- Memuat dan menjalankan skrip dari GitHub
    local scriptURL = baseURL .. gameScript
    local scriptContent = game:HttpGet(scriptURL)
    loadstring(scriptContent)()

    -- Misalnya, jika skrip ini memuat Rayfield
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

    -- Menampilkan notifikasi untuk Rayfield
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

    -- Menambahkan skrip fitur lainnya (contohnya Infinite Jump, WalkSpeed, dll)
    local function LoadFeature(url, section)
        local featureScript = game:HttpGet(url)
        local feature = loadstring(featureScript)
        feature(section)
    end

    -- Mengambil dan menjalankan skrip untuk berbagai fitur
    local MainTab = Rayfield:CreateTab("🏠", nil)
    local MainSection = MainTab:CreateSection("Main")

    LoadFeature('https://raw.githubusercontent.com/daydream410/homieshub/main/InfiniteJump.lua', MainSection)
    LoadFeature('https://raw.githubusercontent.com/daydream410/homieshub/main/Flashlight.lua', MainSection)
    LoadFeature('https://raw.githubusercontent.com/daydream410/homieshub/main/WalkSpeed.lua', MainSection)
    LoadFeature('https://raw.githubusercontent.com/daydream410/homieshub/main/JumpPower.lua', MainSection)
    LoadFeature('https://raw.githubusercontent.com/daydream410/homieshub/main/Gravity.lua', MainSection)

    -- Tambahkan section lain jika perlu
    local OtherSection = MainTab:CreateSection("Other")
    LoadFeature('https://raw.githubusercontent.com/daydream410/homieshub/main/FreezeCamera.lua', OtherSection)

    -- Info Tab untuk fitur lainnya
    local InfoTab = Rayfield:CreateTab("🤔", nil)
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

-- Menghentikan efek Blur jika ada
spawn(function()
    while wait(1) do
        pcall(function()
            for _, v in pairs(game:GetService("Lighting"):GetChildren()) do
                if v.Name == "Blur" then
                    v:Destroy()
                end
            end
        end)
    end
end)

-- Menonaktifkan idling
for _, v in next, getconnections(plr.Idled) do
    v:Disable()
end

-- Mencegah status AFK
local VirtualUser = game:GetService("VirtualUser")
local status = getgenv().afk_toggle
if status == nil then
    getgenv().afk_toggle = false
end

if not plr then
    error("Failed to get LocalPlayer reference")
end

plr.Idled:Connect(function()
    if not getgenv().afk_toggle then return end
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)

-- Mengatur FPS cap
spawn(function()
    while wait(0.1) do
        pcall(function()
            setfpscap(1000)
        end)
    end
end)
