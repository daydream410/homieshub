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

   local Window = Rayfield:CreateWindow({
   Name = "Homies Hub",
   LoadingTitle = "Apa kek udah gede",
   LoadingSubtitle = "by yugieooh",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "homies",
      FileName = "Homies Hub"
   },
    Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "WMNPSwKgQ8", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = false -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true,
   KeySettings = {
      Title = "Key | Homies Hub",
      Subtitle = "Key System",
      Note = "Key In Discord Server",
      FileName = "HomiesHubKey1",
      SaveKey = false,
      GrabKeyFromSite = false,
    --   GrabKeyFromSite = true,
      Key = {"homies"}
    --   Key = {"https://pastebin.com/raw/AtgzSPWK"}
   }
})

local MainTab = Window:CreateTab("🏠", nil)
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "Homies Hub Script",
   Content = "By yugieooh",
   Duration = 5,
   Image = 13047715178,
   Actions = {
      Ignore = {
         Name = "Okay!",
         Callback = function()
         end
      }
   },
})

-- Infinite Jump Toggle
local infiniteJumpToggle = MainTab:CreateToggle({
   Name = "Infinite Jump (Fall Damage)",
   CurrentValue = false,
   Flag = "InfJumpFlag",
   Callback = function(Value)
       -- Mengatur _G.infinjump berdasarkan nilai Value dari toggle
       _G.infinjump = Value

       -- Fungsi untuk mengatur Infinite Jump pada karakter pemain
       local function setupInfiniteJump(character)
           local humanoid = character:WaitForChild("Humanoid")
           local UserInputService = game:GetService('UserInputService')

           -- Menghubungkan event untuk mendeteksi ketika pemain menekan tombol space
           UserInputService.InputBegan:Connect(function(input, gameProcessed)
               -- Memastikan input bukan untuk UI atau lainnya
               if not gameProcessed and input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Space then
                   if _G.infinjump then
                       -- Mengaktifkan Infinite Jump
                       humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                       task.wait(0.1) -- Menunggu sedikit sebelum kembali ke kondisi duduk
                       humanoid:ChangeState(Enum.HumanoidStateType.Seated)
                   end
               end
           end)
       end

       -- Menunggu karakter pemain siap atau direspawn
       local plr = game:GetService('Players').LocalPlayer
       local character = plr.Character or plr.CharacterAdded:Wait()
       setupInfiniteJump(character)

       -- Menunggu respawn dan mengatur ulang Infinite Jump
       plr.CharacterAdded:Connect(function(newCharacter)
           setupInfiniteJump(newCharacter)
       end)

       -- Mengirim notifikasi saat Infinite Jump diaktifkan atau dimatikan
       if Value then
           game.StarterGui:SetCore("SendNotification", {
               Title = "Homies Hub",
               Text = "Infinite Jump Activated!",
               Duration = 5
           })
           Rayfield:Notify({
            Title = "WARNING",
            Content = "Fall Damage still affected if u using Infinite Jump!",
            Duration = 10,
            Image = "message-square-warning",
            })
       else
           game.StarterGui:SetCore("SendNotification", {
               Title = "Homies Hub",
               Text = "Infinite Jump Deactivated!",
               Duration = 5
           })
       end
   end,
})

-- Flashlight Toggle
local flashlightToggle = MainTab:CreateToggle({
   Name = "Flashlight",
   CurrentValue = false,
   Flag = "FlashlightFlag",
   Callback = function(Value)
       local player = game.Players.LocalPlayer
       local character = player.Character or player.CharacterAdded:Wait()

       -- Pastikan HumanoidRootPart ada sebelum melanjutkan
       local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)  -- Menunggu selama 5 detik

       -- Jika HumanoidRootPart tidak ditemukan, hentikan eksekusi
       if not humanoidRootPart then
           game.StarterGui:SetCore("SendNotification", {
               Title = "Error",
               Text = "HumanoidRootPart not found!",
               Duration = 5
           })
           return
       end

       -- Fungsi untuk menambah Spotlight
       local function addSpotLightAroundPlayer()
           -- Membuat SpotLight
           local light = Instance.new("SpotLight")
           light.Parent = humanoidRootPart  -- Lampu ditempatkan di HumanoidRootPart
           light.Range = 30  -- Jarak cahaya
           light.Brightness = 7  -- Kecerahan cahaya
           light.Color = Color3.fromRGB(255, 255, 255)  -- Warna cahaya putih
           light.Enabled = true  -- Lampu menyala
           light.Angle = 45  -- Sudut cahaya yang lebih terfokus
           light.Direction = humanoidRootPart.CFrame.LookVector  -- Arah cahaya mengikuti arah pandang karakter

           -- Menambahkan sedikit offset untuk posisi lampu
           local offset = Instance.new("Attachment")
           offset.Parent = humanoidRootPart
           offset.Position = Vector3.new(0, 3, 0)  -- Menempatkan sedikit di atas karakter
           light.Attachment0 = offset
       end

       -- Notifikasi saat toggle diaktifkan atau dinonaktifkan
       if Value then
           game.StarterGui:SetCore("SendNotification", {
               Title = "Homies Hub",
               Text = "Flashlight Activated!",
               Duration = 5
           })

           -- Menambahkan lampu saat toggle dinyalakan
           addSpotLightAroundPlayer()
       else
           game.StarterGui:SetCore("SendNotification", {
               Title = "Homies Hub",
               Text = "Flashlight Deactivated!",
               Duration = 5
           })

           -- Menghentikan Spotlight saat toggle dimatikan
           local existingLight = humanoidRootPart:FindFirstChildOfClass("SpotLight")
           if existingLight then
               existingLight.Enabled = false  -- Mematikan lampu
               existingLight:Destroy()  -- Menghapus lampu dari permainan
           end
       end
   end,
})

-- WalkSpeed Slider
local Slider = MainTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderws",
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

-- JumpPower Slider
local Slider = MainTab:CreateSlider({
   Name = "JumpPower (No Fall Damage)",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Power",
   CurrentValue = 16,
   Flag = "sliderjp",
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})

-- Gravity Slider
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

-- Other Section untuk fitur lainnya
local OtherSection = MainTab:CreateSection("Other")

local FreezeCameraToggle = MainTab:CreateToggle({
    Name = "Freeze Camera",
    CurrentValue = false,
    Flag = "FreezeCameraFlag",
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local camera = game.Workspace.CurrentCamera

        -- Fungsi untuk membekukan gerakan kamera (freeze camera)
        local function setFreezeCamera(enable)
            if enable then
                -- Membuat kamera tidak bergerak atau berputar secara otomatis
                camera.FieldOfView = 70  -- Mengatur FOV ke nilai standar
                camera.CameraType = Enum.CameraType.Scriptable  -- Menonaktifkan pergerakan otomatis kamera
                camera.CFrame = camera.CFrame  -- Menjaga posisi dan rotasi tetap stabil

                -- Loop untuk menjaga agar kamera tetap stabil pada posisi dan orientasi yang sama
                local function updateCamera()
                    while enable do
                        -- Menjaga CFrame agar tetap sama, memastikan kamera tidak bergerak
                        camera.CFrame = camera.CFrame
                        wait(0.1)  -- Memperbarui posisi kamera setiap 0.1 detik
                    end
                end

                -- Mulai loop untuk memastikan kamera tetap stabil
                coroutine.wrap(updateCamera)()
                
                -- Notifikasi untuk pemain
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Freeze Camera",
                    Text = "Camera movement is interrupted.",
                    Duration = 5
                })
            else
                -- Mengembalikan pengaturan kamera ke default
                camera.CameraType = Enum.CameraType.Custom
                camera.FieldOfView = 70  -- Reset FOV ke nilai semula

                -- Notifikasi untuk pemain
                game.StarterGui:SetCore("SendNotification", {
                    Title = "UnFreeze Camera",
                    Text = "Camera movement is free.",
                    Duration = 5
                })
            end
        end

        -- Terapkan freeze camera berdasarkan nilai toggle
        setFreezeCamera(Value)
    end,
})

-- Info Tab untuk fitur lainnya
local InfoTab = Window:CreateTab("🤔", nil)

-- Menambahkan label untuk menampilkan informasi pembuat dan versi
local infoLabel = InfoTab:CreateLabel("Homies Hub by yugieooh")  -- Ganti [Your Name] dengan nama pembuat
local versionLabel = InfoTab:CreateLabel("Version: 1.0")  -- Ganti 1.0 dengan versi saat ini

-- Atur posisi atau layout jika perlu
infoLabel.Position = UDim2.new(0, 0, 0, 20)  -- Sesuaikan posisi label pertama
versionLabel.Position = UDim2.new(0, 0, 0, 40)  -- Sesuaikan posisi label kedua

else
    -- Jika game ID tidak cocok, tampilkan notifikasi atau berhenti
    game.StarterGui:SetCore("SendNotification", {
        Title = "Game Check",
        Text = "WRONG GAME!",
        Duration = 5
    })
    return  -- Menyudahi skrip jika game ID tidak cocok
end
