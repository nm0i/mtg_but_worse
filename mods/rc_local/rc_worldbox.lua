local sign = function(x)
   if x<0 then
      return -1
   elseif x>0 then
      return 1
   else
      return 0
   end
end

local config_setting  = "alt_spawnpoint"
local spawnpoint = minetest.setting_get_pos(config_setting)

local worldbox_limit = 2048
minetest.register_globalstep(function(dtime)
      for _, player in pairs(minetest.get_connected_players()) do
         local name = player:get_player_name()
         local pos = player:get_pos()
         if math.abs(pos.x) > worldbox_limit then
            pos.x = sign(pos.x)*(worldbox_limit - 4)
            player:moveto(pos,false)
            minetest.chat_send_player(name,"Invisible force pulls you back")
         elseif math.abs(pos.z) > worldbox_limit then
            pos.z = sign(pos.z)*(worldbox_limit - 4)
            player:moveto(pos,false)
            minetest.chat_send_player(name,"Invisible force pulls you back")
         elseif pos.y < -1024 then
            pos.z =0
            pos.y=2100
            pos.x=0
            player:setpos(spawnpoint,false)
            minetest.chat_send_player(name,"You went too deep and died...")
         end
      end
end)
