-- InfoTab.lua

return function(InfoTab)
    local infoSection = InfoTab:CreateSection("Info")

    -- Menambahkan label untuk menampilkan informasi pembuat dan versi
    local infoLabel = InfoTab:CreateLabel("Homies Hub by yugieooh")  -- Ganti [Your Name] dengan nama pembuat
    local versionLabel = InfoTab:CreateLabel("Version: 1.0")  -- Ganti 1.0 dengan versi saat ini
    
    -- Atur posisi atau layout jika perlu
    infoLabel.Position = UDim2.new(0, 0, 0, 20)  -- Sesuaikan posisi label pertama
    versionLabel.Position = UDim2.new(0, 0, 0, 40)  -- Sesuaikan posisi label kedua
end
