---------------
--By Hallkezz--
---------------

class 'ChatSystem'

function ChatSystem:__init()
	Events:Subscribe( "ModulesLoad", self, self.ModulesLoad )
	Events:Subscribe( "ModuleUnload", self, self.ModuleUnload )
end

function ChatSystem:ModulesLoad()
	Events:Fire( "HelpAddItem",
		{
			name = "Chat",
			text = 
				"Type /l <text> - It's Local Chat.\n" ..
				"Type /me <text> - It's express Emotions/Action.\n" ..
				"Type /try <text> - It's solution to disputable situations.\n" ..
				"\n::By Hallkezz!"
		} )
end

function ChatSystem:ModuleUnload()
	Events:Fire( "HelpRemoveItem",
		{
			name = "Chat"
		} )
end

chatsystem = ChatSystem()

--v0.1--
--08.11.18--