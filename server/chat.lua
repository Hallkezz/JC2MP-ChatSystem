---------------
--By Hallkezz--
---------------

-----------------------------------------------------------------------------------
--Settings
local Logs = false -- Save text /l /try /me in logs? (Use: true/false )
---------------------
local Valueses = { "Failed", "Successfully", "Failed" } -- You can change "Successfully" "Failed" to your version. ( Example: "MyTextBad", "MyTextGood", "MyTextBad" )
--																			or ( Example: "Failed", "Successfully", "Unsuccessfully", "MyTextVeryBad", "MyTextVeryGood" )
local LocalColor = Color.Gray -- It's local chat prefix color ( [Local] ).
local LocalPrefix = "[Local]" -- It's prefix name.
local Distance = 25 -- It's distance for local chat :D 	(Default value: 25)
-----------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
--Script
class 'ChatSystem'

function ChatSystem:__init( args )
    Events:Subscribe( "PlayerChat", self, self.PlayerChat )
end

function ChatSystem:PlayerChat( args )
    local msg = args.text
    if ( msg:sub ( 1, 1 ) ~= "/" ) then
        return true
    end

    local msg = msg:sub( 2 )
    local cmd_args = msg:split( " " )
    local cmd_name = cmd_args [ 1 ]:lower()
	if ( cmd_name == "me" ) then
		table.remove( cmd_args, 1 )
		local pName = args.player:GetName()
		for player in Server:GetPlayers() do
		if (player:GetWorld() == args.player:GetWorld()) then
			local dist = args.player:GetValue("loc_dist")
			if dist != nil then
				if ( Vector3.Distance( args.player:GetPosition(), player:GetPosition() ) <= args.player:GetValue("loc_dist") ) then
					player:SendChatMessage( tostring ( pName ) .. " " .. tostring( table.concat ( cmd_args, " " ) ), Color.Magenta )
					if Logs then
						print( tostring ( pName ) .. " " .. tostring( table.concat ( cmd_args, " " ) ) )
					end
				end
			else
				if ( Vector3.Distance( args.player:GetPosition(), player:GetPosition() ) <= Distance ) then
					player:SendChatMessage( tostring ( pName ) .." ".. tostring( table.concat ( cmd_args, " " ) ), Color.Magenta )
					if Logs then
						print( tostring ( pName ) .. " " .. tostring( table.concat ( cmd_args, " " ) ) )
					end
					end
				end
			end
		end
	end

	if ( cmd_name == "l" ) then
		table.remove( cmd_args, 1 )
		local pName = args.player:GetName()
		for player in Server:GetPlayers() do
		if (player:GetWorld() == args.player:GetWorld()) then
			local dist = args.player:GetValue("loc_dist")
			if dist != nil then
				if ( Vector3.Distance( args.player:GetPosition(), player:GetPosition() ) <= args.player:GetValue("loc_dist") ) then
					player:SendChatMessage( LocalPrefix .. " ", LocalColor, tostring ( pName ), args.player:GetColor(), ": ".. tostring( table.concat ( cmd_args, " " ) ), Color.White )
					if Logs then
						print( LocalPrefix .. " " .. tostring ( pName ) .. " " .. tostring( table.concat ( cmd_args, " " ) ) )
					end
				end
			else
				if ( Vector3.Distance( args.player:GetPosition(), player:GetPosition() ) <= Distance ) then
					player:SendChatMessage( LocalPrefix .. " ", LocalColor, tostring ( pName ), args.player:GetColor(), ": ".. tostring( table.concat ( cmd_args, " " ) ), Color.White )
					if Logs then
						print( LocalPrefix .. " " .. tostring ( pName ) .. " " .. tostring( table.concat ( cmd_args, " " ) ) )
					end
					end
				end
			end
		end
	end

	if ( cmd_name == "try" ) then
		wtf = Valueses[math.random(#Valueses)]
		table.remove( cmd_args, 1 )
		local pName = args.player:GetName()
		for player in Server:GetPlayers() do
			if (player:GetWorld() == args.player:GetWorld()) then
			local dist = args.player:GetValue("loc_dist")
			if dist != nil then
				if ( Vector3.Distance( args.player:GetPosition(), player:GetPosition() ) <= args.player:GetValue("loc_dist") ) then
					player:SendChatMessage( tostring ( pName ) .. " " .. tostring( table.concat ( cmd_args, " " ) ), Color.Magenta, " | ", Color.White, wtf, Color.Magenta, " | ", Color.White )
					if Logs then
						print( tostring ( pName ) .. " " .. tostring( table.concat ( cmd_args, " " ) ), " | ", wtf, " | " )
					end
				end
			else
				if ( Vector3.Distance( args.player:GetPosition(), player:GetPosition() ) <= Distance ) then
					player:SendChatMessage( tostring ( pName ) .. " " .. tostring( table.concat ( cmd_args, " " ) ), Color.Magenta, " | ", Color.White, wtf, Color.Magenta, " | ", Color.White )
					if Logs then
						print( tostring ( pName ) .. " " .. tostring( table.concat ( cmd_args, " " ) ), " | ", wtf, " | " )
					end
					end
				end
			end
		end
	end
end

chatsystem = ChatSystem()

--v0.1--
--08.11.18--