AddCSLuaFile()

ENT.Base = "base_anim"
ENT.Author = "MetaMan"
ENT.PrintName = "FAMAS"

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.AutomaticFrameAdvance = true

ENT.PhysgunDisabled = true
ENT.m_tblToolsAllowed = {}

function ENT:CanConstruct()
	return false
end

function ENT:CanTool()
	return false
end

function ENT:Initialize()
	self:SetModel("models/weapons/w_rif_famas.mdl")
end
