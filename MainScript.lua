local baseURL = "https://raw.githubusercontent.com/daydream410/homieshub/main/"
local ID = game.PlaceId

-- Fungsi untuk memilih skrip berdasarkan ID game
function GetGameScript()
    if ID == 2693023319 then  -- Ganti dengan ID game yang sesuai
        return "EA.lua"
    else
        -- print("Game not supported")
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
else
    -- Jika game ID tidak cocok, tampilkan notifikasi atau berhenti
    game.StarterGui:SetCore("SendNotification", {
        Title = "Game Check",
        Text = "WRONG GAME!",
        Duration = 5
    })
    return  -- Menyudahi skrip jika game ID tidak cocok
end
