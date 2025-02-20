local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield', true))()

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
      GrabKeyFromSite = true,
      Key = {"https://pastebin.com/raw/5wrVW0LY"}
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
                -- Mengembalikan kamera ke pengaturan default
                camera.CameraType = Enum.CameraType.Custom  -- Mengaktifkan kembali pergerakan otomatis kamera
            end
        end

        -- Mengaktifkan atau menonaktifkan freeze camera
        setFreezeCamera(Value)
    end,
})

-- highlight Toggle untuk Highlight Semua Player
local highlightToggle = MainTab:CreateToggle({
    Name = "Highlight All Player",
    CurrentValue = false,
    Flag = "highlightFlag",
    Callback = function(Value)
        local players = game:GetService("Players")

        -- Fungsi untuk menambahkan highlight
        local function addHighlight(player)
            if player ~= players.LocalPlayer and player.Character then -- Hindari menyorot diri sendiri
                -- Periksa apakah player memiliki HumanoidRootPart dan Head
                local character = player.Character
                if character and character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("Head") then
                    -- Menambahkan highlight jika belum ada
                    local existingHighlight = character:FindFirstChildOfClass("Highlight")
                    if not existingHighlight then
                        local highlight = Instance.new("Highlight")
                        highlight.Parent = character
                        highlight.FillColor = Color3.fromRGB(255, 255, 0) -- Warna kuning
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255) -- Warna putih
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        highlight.FillTransparency = 0.5 -- Transparansi isi
                        highlight.OutlineTransparency = 0 -- Transparansi outline
                    end

                    -- Menambahkan nama pemain (tanpa pengecekan jarak)
                    local nameLabel = character:FindFirstChildOfClass("BillboardGui")

                    if not nameLabel then
                        -- Menambahkan label nama jika belum ada
                        nameLabel = Instance.new("BillboardGui")
                        nameLabel.Adornee = character.Head
                        nameLabel.Size = UDim2.new(0, 100, 0, 30)
                        nameLabel.StudsOffset = Vector3.new(0, 3, 0)
                        nameLabel.AlwaysOnTop = true

                        local textLabel = Instance.new("TextLabel")
                        textLabel.Parent = nameLabel
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.BackgroundTransparency = 1
                        textLabel.Text = player.Name
                        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                        textLabel.TextStrokeTransparency = 0.5
                        textLabel.TextSize = 14

                        nameLabel.Parent = character
                    end
                end
            end
        end
        
        -- Fungsi untuk menghapus highlight
        local function removeHighlight(player)
            if player.Character then
                local existingHighlight = player.Character:FindFirstChildOfClass("Highlight")
                if existingHighlight then
                    existingHighlight:Destroy()
                end

                -- Menghapus label nama
                local nameLabel = player.Character:FindFirstChildOfClass("BillboardGui")
                if nameLabel then
                    nameLabel:Destroy()
                end
            end
        end

        -- Callback ketika toggle diaktifkan
        if Value then
            game.StarterGui:SetCore("SendNotification", {
                Title = "Homies Hub",
                Text = "Player Highlight Activated!",
                Duration = 5
            })

            -- Menambahkan highlight ke semua pemain saat ini
            for _, player in pairs(players:GetPlayers()) do
                addHighlight(player)
            end

            -- Menambahkan highlight untuk pemain yang bergabung setelah toggle diaktifkan
            players.PlayerAdded:Connect(addHighlight)

        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "Homies Hub",
                Text = "Player Highlight Deactivated!",
                Duration = 5
            })
            
            -- Menghapus highlight dari semua pemain saat toggle dimatikan
            for _, player in pairs(players:GetPlayers()) do
                removeHighlight(player)
            end
        end
    end,
})

-- Water Walking Toggle
local waterWalkingToggle = MainTab:CreateToggle({
    Name = "Water Walking",
    CurrentValue = false,
    Flag = "WaterWalkingFlag",
    Callback = function(Value)
        -- Mengatur _G.waterwalking berdasarkan nilai Value dari toggle
        _G.waterwalking = Value

        -- Fungsi untuk mengatur Water Walking pada karakter pemain
        local function setupWaterWalking(character)
            local humanoid = character:WaitForChild("Humanoid")
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            local UserInputService = game:GetService('UserInputService')
            local workspace = game:GetService('Workspace')

            -- Fungsi untuk memeriksa apakah karakter berada di atas air
            local function checkWaterWalk()
                local position = humanoidRootPart.Position
                local ray = Ray.new(position + Vector3.new(0, 5, 0), Vector3.new(0, -10, 0)) -- Raycast ke bawah
                local hit, position = workspace:FindPartOnRay(ray, character)

                -- Memeriksa apakah permukaan yang terkena ray adalah air
                return hit and hit.Material == Enum.Material.Water
            end

            -- Fungsi untuk menjaga karakter tetap berada di atas air
            local function handleWaterWalking()
                while _G.waterwalking do
                    if checkWaterWalk() then
                        humanoid.PlatformStand = true  -- Menghentikan gerakan normal agar karakter tetap di atas air
                        humanoidRootPart.Anchored = true  -- Menahan posisi karakter agar tidak tenggelam
                    else
                        humanoid.PlatformStand = false
                        humanoidRootPart.Anchored = false
                    end
                    wait(0.1)
                end
            end

            -- Mulai handleWaterWalking jika toggle aktif
            if _G.waterwalking then
                handleWaterWalking()
            end
        end

        -- Menunggu karakter siap atau direspawn
        local plr = game:GetService('Players').LocalPlayer
        local character = plr.Character or plr.CharacterAdded:Wait()
        setupWaterWalking(character)

        -- Menunggu respawn dan mengatur ulang Water Walking
        plr.CharacterAdded:Connect(function(newCharacter)
            setupWaterWalking(newCharacter)
        end)

        -- Mengirim notifikasi saat Water Walking diaktifkan atau dimatikan
        if Value then
            game.StarterGui:SetCore("SendNotification", {
                Title = "Homies Hub",
                Text = "Water Walking Activated!",
                Duration = 5
            })
            Rayfield:Notify({
                Title = "INFO",
                Content = "You can now walk on water!",
                Duration = 10,
                -- Image = "message-square-info",
            })
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "Homies Hub",
                Text = "Water Walking Deactivated!",
                Duration = 5
            })
        end
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
