-- Reset priviledges if player has sno static privs

minetest.register_privilege("staticprivs", { description = "Static priviledges", give_to_singleplayer = false})

minetest.register_on_joinplayer(
   function(player)
      local pname = player:get_player_name()
      if not minetest.check_player_privs(pname, { staticprivs = true}) then
         local privs = {}
         privs.interact = true
         privs.fast = true
         privs.home = true
         privs.shout = true
         privs.fly = true
         minetest.set_player_privs(pname, privs)
      end
end)

-- Worldbox restriction

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

minetest.register_globalstep(function(dtime)
      for _, player in pairs(minetest.get_connected_players()) do
         local name = player:get_player_name()
         local pos = player:getpos()
         if math.abs(pos.x) > 2128 then
            pos.x = sign(pos.x)*3250
            player:moveto(pos,false)
            minetest.chat_send_player(name,"Invisible force pulls you back")
         elseif math.abs(pos.z) > 2128 then
            pos.z = sign(pos.z)*3250
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

-- Additional commands

local turbohash={}
local command_context = {
   params = "<person>",
   privs = {bring=true},
   description = "Turbo mode",
   func = function(name, param)
      local player = minetest.get_player_by_name(name)
      turbohash[name] = not turbohash[name]
      if turbohash[name] then
         player:set_physics_override({speed = 16.0})
         minetest.chat_send_player(name, "Turbo on")
      else
         player:set_physics_override({speed = 1.0})
         minetest.chat_send_player(name, "Turbo off")
      end
   end
}
minetest.register_chatcommand("turbo", command_context)

local hiddenhash = {}
local command_context = {
   params = "",
   description = "Hide user",
   func = function(name, param)
      local prop
      local player = minetest.get_player_by_name(name)
      hiddenhash[name] = not hiddenhash[name]
      if hiddenhash[name] then
         prop = {visual_size = {x = 0, y = 0},
                 collisionbox = {0}}
         player:set_nametag_attributes({color = {a = 0, r = 255, g = 255, b = 255}})
         minetest.chat_send_player(name, "Invisibility on")            
      else
         prop = {visual_size = {x = 1, y = 1},
                 collisionbox = {-0.3, -1, -0.3, 0.3, 1, 0.3}}
         player:set_nametag_attributes({color = {a = 255, r = 255, g = 255, b = 255}})
         minetest.chat_send_player(name, "Invisibility off")           
      end
      player:set_properties(prop)
   end
}
minetest.register_chatcommand("hide", command_context)

local commant_context = {
   params = "<user>",
   description = "Toggle user's hiding status",
   privs = {bring = true},
   func = function(name, param)
      local prop
      local player = minetest.get_player_by_name(param)
      if not player then
         minetest.chat_send_player(name, "No such player")
         return
      end
      hiddenhash[name] = not hiddenhash[name]
      if hiddenhash[name] then
         prop = {visual_size = {x = 0, y = 0},
                 collisionbox = {0}}
         player:set_nametag_attributes({color = {a = 0, r = 255, g = 255, b = 255}})
         minetest.chat_send_player(name, "Invisibility on")            
      else
         prop = {visual_size = {x = 1, y = 1},
                 collisionbox = {-0.3, -1, -0.3, 0.3, 1, 0.3}}
         player:set_nametag_attributes({color = {a = 255, r = 255, g = 255, b = 255}})
         minetest.chat_send_player(name, "Invisibility off")           
      end
      player:set_properties(prop)
   end
}
minetest.register_chatcommand("forcehide", commant_context)

minetest.register_on_leaveplayer(function(player)
      local pname = player:get_player_name()
      hiddenhash[pname] = nil
      turbohash[pname] = nil
end)

local commant_context = {
   params = "<msg>",
   description = "man wall",
   privs = {ban = true},
   func = function(name, param)
      minetest.chat_send_all(param)
      minetest.log("action","[wall] "..name..":"..param)
   end
}
minetest.register_chatcommand("wall", commant_context)

local commant_context = {
   params = "",
   description = "Force day",
   privs = {interact = true},
   func = function(name, param)
      minetest.set_timeofday(0.5)
      minetest.log("action",name.." forced day")
   end
}
minetest.register_chatcommand("day", commant_context)

