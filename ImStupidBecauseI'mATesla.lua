getgenv().script_key = getgenv()['script_key']

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua"))()
local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
local Window = Library:CreateWindow({Title = "Azure ", Footer = "Key System", Icon = 112280917739514, NotifySide = "Left", ShowCustomCursor = false})
local Tabs = {Key = Window:AddKeyTab("Azure Keysystem")}

if not game:GetService("Players").LocalPlayer then
    game:GetService("Players").PlayerAdded:Wait()
end

api.script_id = "f5ec84cb8ff1b58ef725bbcc589fac55"

if isfile("savedazurekey") then
    local savedKey = readfile("savedazurekey")
    local status = api.check_key(savedKey)
    if status.code == "KEY_VALID" then
        getgenv().script_key = "\"" .. savedKey .. "\""
        loadstring('script_key="' .. savedKey .. '"\nloadstring(game:HttpGet("https://raw.githubusercontent.com/Forexium/Azure/refs/heads/main/Loader.lua"))()')()
        Library:Notify({Title = "Azure Keysystem", Description = "Loaded saved key: " .. savedKey, Time = 4})
        Library:Unload()
    end
end

Tabs.Key:AddKeyBox("AzureKey", function(Success, ReceivedKey)
    local status = api.check_key(ReceivedKey)
    if status.code == "KEY_VALID" then
        getgenv().script_key = "\"" .. ReceivedKey .. "\""
        writefile("savedazurekey", ReceivedKey)
        loadstring('script_key="' .. ReceivedKey .. '"\nloadstring(game:HttpGet("https://raw.githubusercontent.com/Forexium/Azure/refs/heads/main/Loader.lua"))()')()
        Library:Notify({Title = "Azure Keysystem", Description = "Welcome! Key: " .. ReceivedKey .. " accepted and saved.", Time = 4})
        Library:Unload()
    elseif status.code == "KEY_HWID_LOCKED" then
        Library:Notify({Title = "Azure Keysystem", Description = "Key linked to a different HWID. Please reset it using our bot.", Time = 4})
    elseif status.code == "KEY_INCORRECT" then
        Library:Notify({Title = "Azure Keysystem", Description = "Key is wrong or deleted!", Time = 4})
    else
        Library:Notify({Title = "Azure Keysystem", Description = "Key is invalid! " .. status.message .. " (Code: " .. status.code .. ")", Time = 4})
    end
end)

Tabs.Key:AddButton({Text = "Linkvertise", Func = function()
    setclipboard("https://ads.luarmor.net/get_key?for=Azure_Hub_KEY-otfjcauwUgdh")
    Library:Notify({Title = "Azure Keysystem", Description = "Linkvertise link copied to clipboard!", Time = 2})
end})

Tabs.Key:AddButton({Text = "Lootlabs", Func = function()
    setclipboard("https://ads.luarmor.net/get_key?for=Azure_Hub_Lootlabs-nRjyMTOmyBby")
    Library:Notify({Title = "Azure Keysystem", Description = "Lootlabs link copied to clipboard!", Time = 2})
end})
