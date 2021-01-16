include("shared.lua")

if game.SinglePlayer() then
	local red = Color(255, 0, 0, 255)
	function ENT:Draw()
		self:DrawModel()

		local eyes_attachment = self:LookupAttachment("eyes")
		if not eyes_attachment then
			return
		end

		local info = self:GetAttachment(eyes_attachment)
		local forward = info.Pos + info.Ang:Forward() * self.MaxVisionRange
		local forward_left_outer = info.Pos + Angle(info.Ang.p, info.Ang.y + self.FOV / 2, info.Ang.r):Forward() * self.MaxVisionRange
		local forward_left_inner = info.Pos + Angle(info.Ang.p, info.Ang.y + self.FOV / 2 / 2, info.Ang.r):Forward() * self.MaxVisionRange
		local forward_right_outer = info.Pos + Angle(info.Ang.p, info.Ang.y - self.FOV / 2, info.Ang.r):Forward() * self.MaxVisionRange
		local forward_right_inner = info.Pos + Angle(info.Ang.p, info.Ang.y - self.FOV / 2 / 2, info.Ang.r):Forward() * self.MaxVisionRange
		debugoverlay.Line(info.Pos, forward, 0.1, red)
		debugoverlay.Line(info.Pos, forward_left_outer, 0.1, red)
		debugoverlay.Line(info.Pos, forward_left_inner, 0.1, red)
		debugoverlay.Line(info.Pos, forward_right_outer, 0.1, red)
		debugoverlay.Line(info.Pos, forward_right_inner, 0.1, red)
	end
end
