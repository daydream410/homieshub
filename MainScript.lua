local baseURL = "https://raw.githubusercontent.com/daydream410/homieshub/main/"
local ID = game.PlaceId

-- Fungsi untuk memilih skrip berdasarkan ID game
function GetGameScript()
    if ID == 2693023319 then  -- Ganti dengan ID game yang sesuai
        return "EAenc.lua"
    else
        return nil
    end
end

local gameScript = GetGameScript()

if gameScript then
    -- Menampilkan notifikasi "Correct Game"
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Game Check",
        Text = "CORRECT GAME!",
        Duration = 5
    })
    task.wait(5)

    -- Memuat dan menjalankan skrip dari GitHub
    local HttpService = game:GetService("HttpService")
    local scriptURL = baseURL .. gameScript
    local scriptContent = HttpService:GetAsync(scriptURL)

    -- Membuat ModuleScript untuk mengeksekusi kode yang diambil
    local moduleScript = Instance.new("ModuleScript")
    moduleScript.Source = scriptContent  -- Menyisipkan kode dari URL
    moduleScript.Parent = game.ServerScriptService  -- Menempatkannya dalam ServerScriptService

    -- Mengaktifkan ModuleScript
    local module = require(moduleScript)
else
    -- Jika game ID tidak cocok, tampilkan notifikasi atau berhenti
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Game Check",
        Text = "GAME NOT SUPPORTED!",
        Duration = 5
    })
    return  -- Menyudahi skrip jika game ID tidak cocok
end
