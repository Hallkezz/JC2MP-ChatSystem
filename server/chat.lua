---------------
--By Hallkezz--
---------------

-----------------------------------------------------------------------------------
--Settings
local variations = {"Unsuccessful", "Successfully"} -- Random /try variations
local localPrefix = "[Local]" -- Local chat prefix
---------------------
local msgColor = Color.White -- Main message text color
local localColor = Color.Gray -- Local chat prefix color
local msgActionColor = Color.Magenta -- Action messages color
---------------------
local distance = 30 -- Messages distance
-----------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
--Script
class 'ChatSystem'

function ChatSystem:__init(args)
    Events:Subscribe("PlayerChat", self, self.PlayerChat)
end

function ChatSystem:PlayerChat(args)
    local cmd_args = args.text:split(" ")

    if cmd_args[1] == "/l" then
        local pName = args.player:GetName()
        local pPos = args.player:GetPosition()
        local pColor = args.player:GetColor()

        table.remove(cmd_args, 1)

        local fText = tostring(table.concat(cmd_args, " "))
        for p in Server:GetPlayers() do
            local dist = pPos:Distance(p:GetPosition())

            if p and dist < distance then
                p:SendChatMessage(localPrefix .. " ", localColor, pName, pColor, ": " .. fText, msgColor)
            end
        end

        return false
    elseif cmd_args[1] == "/me" then
        local pName = args.player:GetName()
        local pPos = args.player:GetPosition()

        table.remove(cmd_args, 1)

        local fText = tostring(table.concat(cmd_args, " "))
        for p in Server:GetPlayers() do
            local dist = pPos:Distance(p:GetPosition())

            if dist < distance then
                p:SendChatMessage(pName .. " " .. fText, msgActionColor)
            end
        end

        return false
    elseif cmd_args[1] == "/try" then
        local pName = args.player:GetName()
        local pPos = args.player:GetPosition()

        table.remove(cmd_args, 1)

        local fText = tostring(table.concat(cmd_args, " "))
        for p in Server:GetPlayers() do
            local dist = pPos:Distance(p:GetPosition())

            if dist < distance then
                p:SendChatMessage(pName .. " " .. fText, msgActionColor, " | ", msgColor, table.randomvalue(variations), msgActionColor, " |", msgColor)
            end
        end

        return false
    end
end

local chatsystem = ChatSystem()
-----------------------------------------------------------------------------------
--Script Version
--v1.0--

--Release Date
--12.07.25--
-----------------------------------------------------------------------------------