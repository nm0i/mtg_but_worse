local sign = function(x)
   if x<0 then
      return -1
   elseif x>0 then
      return 1
   else
      return 0
   end
end


local worldbox_flat_limit = 2048
local worldbox_vertical_limit = 1024
local func_context = function(dtime)
   for _, player in pairs(minetest.get_connected_players()) do
      local name = player:get_player_name()
      local pos = player:get_pos()
      if math.abs(pos.x) > worldbox_flat_limit then
         pos.x = sign(pos.x)*(worldbox_flat_limit - 4)
         player:moveto(pos,false)
         minetest.chat_send_player(name,"Invisible force pulls you back")
      elseif math.abs(pos.z) > worldbox_flat_limit then
         pos.z = sign(pos.z)*(worldbox_flat_limit - 4)
         player:moveto(pos,false)
         minetest.chat_send_player(name,"Invisible force pulls you back")
      elseif math.abs(pos.y) > worldbox_vertical_limit then
         local spawnpoint = minetest.setting_get_pos("static_spawnpoint")
         if spawnpoint then
            player:setpos(spawnpoint,false)
            minetest.chat_send_player(name,"You went too deep and died...")
         end
      end
   end
end
minetest.register_globalstep(func_context)
