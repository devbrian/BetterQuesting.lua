-- Copyright � 2016 g0ld <g0ld@tuta.io>
-- This work is free. You can redistribute it and/or modify it under the
-- terms of the Do What The Fuck You Want To Public License, Version 2,
-- as published by Sam Hocevar. See the COPYING file for more details.
-- Quest: @WiWi__33[NetPapa]


local sys    = require "Libs/syslib"
local game   = require "Libs/gamelib"
local Quest  = require "Quests/Quest"
local Dialog = require "Quests/Dialog"

local name		  = 'To Lavaridge Town'
local description = 'Will go to the Mt. Pyre and defeat Max'
local level = 40

local dialogs = {
	jacksonMete = Dialog:new({ 
		"First you pester me in Kanto"
	}),
}

local ToLavaridgeTown = Quest:new()

function ToLavaridgeTown:new()
	return Quest.new(ToLavaridgeTown, name, description, level, dialogs)
end

function ToLavaridgeTown:isDoable()
	if self:hasMap() and hasItem("Dynamo Badge") and not hasItem("Heat Badge")  then
		return true
	end
	return false
end

function ToLavaridgeTown:isDone()
	if getMapName() == "Lavaridge Town" then
		return true
	else
		return false
	end
end

function ToLavaridgeTown:MauvilleCityGym()
	sys.debug("quest", "Going to Lavaridge Town.")
	return moveToCell(7, 25)
end

function ToLavaridgeTown:MauvilleCity()
	if self:needPokecenter() or not game.isTeamFullyHealed() or self.registeredPokecenter ~= "Pokecenter Mauville City" then
		sys.debug("quest", "Going to heal Pokemon.")
		return moveToCell(28, 13)
	elseif self:needPokemart() then
		sys.debug("quest", "Going to buy Pokeballs.")
		return moveToCell(29, 23)
	else
		sys.debug("quest", "Going to Lavaridge Town.")
		return moveToCell(22, 4)
	end
end

function ToLavaridgeTown:PokecenterMauvilleCity()
	return self:pokecenter("Mauville City")
end

function ToLavaridgeTown:MartMauvilleCity()
	return self:pokemart()
end

function ToLavaridgeTown:MauvilleCityStopHouse3()
	sys.debug("quest", "Going to Lavaridge Town.")
	return moveToCell(4, 2)
end

function ToLavaridgeTown:Route111South()
	if isNpcOnCell(23,51) then
		sys.debug("quest", "Going to talk to NPC Hiker.")
		return talkToNpcOnCell(23,51)
	else
		sys.debug("quest", "Going to Lavaridge Town.")
		return moveToCell(0, 23)
	end
end

function ToLavaridgeTown:Route112()
	if isNpcOnCell(29, 34) and not game.inRectangle(14, 7, 45, 19) then
		sys.debug("quest", "Going to Lavaridge Town.")
		return moveToCell(8, 43)

	elseif game.inRectangle(14, 7, 45, 19) then 
		sys.debug("quest", "Going to Lavaridge Town.")
		return moveToCell(45, 9)

	elseif game.inRectangle(0, 54, 14, 74) then 
		sys.debug("quest", "Going to Lavaridge Town.")
		return moveToCell(0, 59)

	else
		sys.debug("quest", "Going to Lavaridge Town.")
		return moveToCell(30, 33)

	end
end

function ToLavaridgeTown:FieryPath()
	sys.debug("quest", "Going to Lavaridge Town.")
	return moveToCell(38,8)
end

function ToLavaridgeTown:Route111North()
	sys.debug("quest", "Going to Lavaridge Town.")
	return moveToCell(0, 23)
end

function ToLavaridgeTown:Route113()
	if not self:isTrainingOver() and not self:needPokecenter() and self.registeredPokecenter == "Pokecenter Fallarbor Town"  then
		sys.debug("quest", "Going to level Pokemon until Level " .. self.level .. ".")
		return moveToRectangle(49, 23, 58, 24)
	else
		sys.debug("quest", "Going to Lavaridge Town.")
		return moveToCell(0, 18)
	end
end

function ToLavaridgeTown:FallarborTown()
	if self:needPokecenter() or not game.isTeamFullyHealed() or self.registeredPokecenter ~= "Pokecenter Fallarbor Town" then
		sys.debug("quest", "Going to heal Pokemon.")
		return moveToCell(30, 12)
	elseif not self:isTrainingOver() then
		sys.debug("quest", "Going to level Pokemon until Level " .. self.level .. ".")
		return moveToCell(40, 13)
	else
		sys.debug("quest", "Going to Lavaridge Town.")
		return moveToCell(0, 18)
	end
end

function ToLavaridgeTown:PokecenterFallarborTown()
	return self:pokecenter("Fallarbor Town")
end

function ToLavaridgeTown:Route114()
	sys.debug("quest", "Going to Lavaridge Town.")
	return moveToCell(12, 119)
end

function ToLavaridgeTown:Meteorfalls1F1R()
	if isNpcOnCell(31, 23) then
		sys.debug("quest", "Going to fight Jackson.")
		return talkToNpcOnCell(31, 23)

	elseif not isNpcOnCell(31, 23) and not dialogs.jacksonMete.state then
		dialogs.jacksonMete.state = true	

	elseif dialogs.jacksonMete.state then 
		sys.debug("quest", "Going to Lavaridge Town.")
		return moveToCell(19, 46)
	end	
end	

function ToLavaridgeTown:Route115()
	sys.debug("quest", "Going to Lavaridge Town.")
	return moveToCell(60, 150)
end

function ToLavaridgeTown:RustboroCity()
	sys.debug("quest", "Going to Lavaridge Town.")
	return moveToCell(78, 8)
end

function ToLavaridgeTown:Route116()
	sys.debug("quest", "Going to Lavaridge Town.")
	return moveToCell(62, 19)
end

function ToLavaridgeTown:RusturfTunnel()
	if isNpcOnCell(25, 9) then
		sys.debug("quest", "Going to talk to NPC.")
		return talkToNpcOnCell(25, 9)
	else
		sys.debug("quest", "Going to Lavaridge Town.")
		return moveToCell(35, 26)
	end
end

function ToLavaridgeTown:VerdanturfTown()
	sys.debug("quest", "Going to Lavaridge Town.")
	return moveToCell(35, 12)
end

function ToLavaridgeTown:Route117()
	sys.debug("quest", "Going to Lavaridge Town.")
	return moveToCell(101, 32)
end

function ToLavaridgeTown:MauvilleCityStopHouse2()
	sys.debug("quest", "Going to Lavaridge Town.")
	return moveToCell(10, 7)
end

function ToLavaridgeTown:CableCarStation1()
	sys.debug("quest", "Going to Lavaridge Town.")
	return talkToNpcOnCell(10, 6)
end

function ToLavaridgeTown:CableCarStation2()
	sys.debug("quest", "Going to Lavaridge Town.")
	return moveToCell(3, 9)
end

function ToLavaridgeTown:MtChimney()
	if isNpcOnCell(26, 9) then
		sys.debug("quest", "Going to fight Maxie.")
		return talkToNpcOnCell(26, 9)
	else 
		sys.debug("quest", "Going to Lavaridge Town.")
		return moveToCell(34, 50)
	end
end

function ToLavaridgeTown:JaggedPass()
	sys.debug("quest", "Going to Lavaridge Town.")
	return moveToCell(22, 110)
end

return ToLavaridgeTown