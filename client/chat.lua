---------------
--By Hallkezz--
---------------

-----------------------------------------------------------------------------------
--Script
class 'ChatSystem'

function ChatSystem:__init()
    Events:Subscribe("ModulesLoad", self, self.ModulesLoad)
    Events:Subscribe("ModuleUnload", self, self.ModuleUnload)
end

function ChatSystem:ModulesLoad()
	Events:Fire("HelpAddItem",
		{
			name = "Chat",
			text = 
				"/l <text> - send message to local chat\n" ..
				"/me <text> - send action message\n" ..
				"/try <text> - send action message with solution to disputable situations\n" ..
				"\n- Created by Hallkezz"
		})
end

function ChatSystem:ModuleUnload()
    Events:Fire("HelpRemoveItem", {name = "Chat"})
end

local chatsystem = ChatSystem()
-----------------------------------------------------------------------------------
--Script Version
--v1.0--

--Release Date
--12.07.25--
-----------------------------------------------------------------------------------