ENT.Base = "base_nextbot"
ENT.Author = "MetaMan"
ENT.PrintName = "Genome Soldier"

ENT.Spawnable = true
ENT.AdminSpawnable = true

ENT.AutomaticFrameAdvance = true

ENT.FOV = 70
ENT.MaxVisionRange = 350

if not game.SinglePlayer() then
	ENT.PhysgunDisabled = true
	ENT.m_tblToolsAllowed = {}

	function ENT:CanConstruct()
		return false
	end

	function ENT:CanTool()
		return false
	end
end
