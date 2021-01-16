AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

DEFINE_BASECLASS("base_nextbot")

local pathopts = {draw = true, repath = 1}

function ENT:Initialize()
	self:SetModel("models/MGS1/genome_soldier.mdl")
	self:SetHealth(100)
	self:SetCollisionGroup(COLLISION_GROUP_NPC)
	self:SetSolidMask(MASK_NPCSOLID)
	self:SetFOV(self.FOV)
	self:SetMaxVisionRange(self.MaxVisionRange)

	self.weapon = ents.Create("lua_weapon_famas")
	self.weapon:SetParent(self)
	self.weapon:AddEffects(EF_BONEMERGE)
	self.weapon:Spawn()

	self.loco:SetDesiredSpeed(64)
	self.loco:SetDeathDropHeight(2048)
	self.loco:SetJumpHeight(256)
	self.loco:SetStepHeight(32)

	self:IsAbleToSee(self)
end

function ENT:RunBehaviour()
	while true do
		self:StartActivity(ACT_HL2MP_WALK_PASSIVE)

		local maxheight = self.loco:GetJumpHeight()
		local walktable = navmesh.Find(self:GetPos(), 2048, maxheight, maxheight)
		if #walktable == 0 then
			coroutine.wait(1)
			continue
		end

		local area = table.Random(walktable)
		if area == nil then
			coroutine.wait(1)
			continue
		end

		local pos = area:GetRandomPoint()
		self:MoveToPos(pos, pathopts)

		self:StartActivity(ACT_HL2MP_IDLE_PASSIVE)
		coroutine.wait(3)
	end
end

function ENT:BodyUpdate()
	local act = self:GetActivity()
	if act == ACT_HL2MP_WALK_PASSIVE or act == ACT_HL2MP_WALK_SMG1 or act == ACT_HL2MP_RUN_SMG1 then
		self:BodyMoveXY()
		return
	end

	self:FrameAdvance()
end

function ENT:OnContact(ent)
end

function ENT:OnInjured(dmginfo)
end

function ENT:OnEntitySight(subject)
end

function ENT:OnEntitySightLost(subject)
end

function ENT:OnKilled(dmginfo)
	if IsValid(self.weapon) then
		self.weapon:Remove()
	end

	BaseClass.OnKilled(self, dmginfo)
end
