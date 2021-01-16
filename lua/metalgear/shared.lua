if CLIENT then
	include("client.lua")
else
	include("server.lua")
end
