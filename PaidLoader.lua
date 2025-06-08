getgenv().script_key = getgenv()['script_key']

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()

local GamesTable = {
    [4777817887] = "https://api.luarmor.net/files/v3/loaders/0f66ccdb8f14d7fe0e363f0a178def1d.lua", 
    [6931042565] = "https://api.luarmor.net/files/v3/loaders/a87a227e3c56f160f20e224c1f4ada84.lua",
}

local GameId = game.GameId
local Executor = identifyexecutor()
local Link = GamesTable[GameId]
local HorribleExploits = {"Solara", "Xeno"}

if not script_key then
    LocalPlayer:Kick("No identified Key")
elseif game.PlaceId == 132756651286184 or game.PlaceId == 124842177627298 then
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/cb930180d28b181b0cf87d0efe29a784.lua"))()
end

loadstring(game:HttpGet(Link))()
