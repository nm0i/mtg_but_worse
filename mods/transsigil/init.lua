-- Settings
local sigil = {}

sigil.worldbox = 4000

local sigil_edit_hash = {}

local function sigil_receive_form(player, form_name, fields)

   if form_name == "transsigil:editor" and fields.private ~= nil then
      sigil_edit_hash[player:get_player_name()].private = fields.private
   elseif form_name == "transsigil:editor" and fields.link_button ~= nil then

      local player_name = player:get_player_name()
      local pos = sigil_edit_hash[player_name].pos
      local facedir = minetest.dir_to_facedir(player:get_look_dir())
      local private = sigil_edit_hash[player_name].private

      if not pos then return end
      
      local coords={}
      coords.x, coords.y, coords.z = string.match(fields.location, "^([%d.-]+)[, ] *([%d.-]+)[, ] *([%d.-]+)$")
      coords.x=tonumber(coords.x)
      coords.y=tonumber(coords.y)
      coords.z=tonumber(coords.z)
      if not (coords.x and coords.y and coords.z) then
         minetest.chat_send_player(player_name, 'Incorrect coordinates. Use x,y,z format.')
         return
      end

      if ((coords.x>math.abs(sigil.worldbox) or
           coords.y>math.abs(sigil.worldbox) or
           coords.z>math.abs(sigil.worldbox))) then
         minetest.chat_send_player(player_name, 'Out of range. Maximum is '..sigil.worldbox..' in any direction')
         return
      end

      local meta = minetest.get_meta(pos)

      meta:set_string("owner", player_name)
      meta:set_string("location", fields.location)
      meta:set_string("sigilname",fields.sigilname)
      if private == "true" then
         meta:set_string("private","true")
         minetest.swap_node(pos, {name = "transsigil:sigil_f", param2=facedir})
         meta:set_string("infotext", "Portal sigil:\n"..fields.sigilname.."\nowned by "..player_name)
      else
         meta:set_string("private","false")
         minetest.swap_node(pos, {name = "transsigil:sigil_p", param2=facedir})
         meta:set_string("infotext", "Portal sigil:\n"..fields.sigilname)      
      end
   end   
end

local function sigil_rightclick(pos, node, player)
   local player_name = player:get_player_name()
   local meta = minetest.get_meta(pos)
   if player_name ~= meta:get_string("owner") then
      minetest.chat_send_player(player_name, 'Only owner can edit sigil.')
      return
   end
   local location = meta:get_string("location")
   local name = meta:get_string("sigilname")
   local private = meta:get_string("private")
   local formspec = "size[7.8,2.8;]"..
      "field[0.2,0.4;8,1;sigilname;Sigil name;"..name.."]"..
      "field[0.2,1.6;8,1;location;Destination x,y,z;"..location.."]"..
      "checkbox[0,2.2;private;Private;"..private.."]"..
      "button_exit[5.8,2.2;2,1;link_button;Link]"
   sigil_edit_hash[player_name] = {}
   sigil_edit_hash[player_name].pos = pos
   sigil_edit_hash[player_name].private = "false"
   
   minetest.show_formspec(player_name, "transsigil:editor",formspec)
end

local function sigil_onpunch(pos,node,puncher)
   if puncher:get_wielded_item():get_name() == "" then
      local meta = minetest.get_meta(pos)
      if puncher:get_player_name() ~= meta:get_string("owner") and meta:get_string("private") == "true" then
         minetest.chat_send_player(puncher:get_player_name(), 'You don\' belong to sigil.')
         return
      end
      local p = {}
      p.x, p.y, p.z = string.match(meta:get_string("location"), "^([%d.-]+)[, ] *([%d.-]+)[, ] *([%d.-]+)$")
      if p.x and p.y and p.z then
         p.x = tonumber(p.x)
         p.y = tonumber(p.y)
         p.z = tonumber(p.z)
         local ppos = puncher:get_pos()
         local minp = {x= ppos.x+0.5, y= ppos.y, z= ppos.z+0.5}
         local maxp = {x= ppos.x-0.5,  y= ppos.y, z= ppos.z-0.5}
         local vel = {x=0, y=2, z=0}
         local acc = {x=0, y=0, z=0}
         minetest.add_particlespawner({amount=4,
                                       time=1,
                                       minpos=minp,
                                       maxpos=maxp,
                                       minvel=vel,
                                       maxvel=vel,
                                       minacc=acc,
                                       maxacc=acc,
                                       minexptime=0.5,
                                       maxexptime=1,
                                       minsize=8,
                                       maxsize=16,
                                       collisiondetection=false,
                                       vertical=true,
                                       texture="transsigil_particles.png"})         
         minetest.sound_play({name = "transsigil_portal", gain=0.3}, {pos=pos, loop=false})
         puncher:move_to(p,false)
         minp = {x= p.x+0.5, y= p.y, z= p.z+0.5}
         maxp = {x= p.x-0.5,  y= p.y, z= p.z-0.5}
         minetest.add_particlespawner({amount=4,
                                       time=1,
                                       minpos=minp,
                                       maxpos=maxp,
                                       minvel=vel,
                                       maxvel=vel,
                                       minacc=acc,
                                       maxacc=acc,
                                       minexptime=0.5,
                                       maxexptime=1,
                                       minsize=6,
                                       maxsize=16,
                                       collisiondetection=false,
                                       vertical=true,
                                       texture="transsigil_particles.png"})         
         minetest.sound_play({name = "transsigil_portal", gain=0.3}, {pos=p, loop=false})
      end
   end
end


minetest.register_node("transsigil:sigil_blank", {
                          description = "Empty portal sigil",
                          tiles = {
                             "transsigil_top.png",
                             "transsigil_top.png",
                             "transsigil_side.png"
                          },
                          drawtype = "nodebox",
                          paramtype = "light",
                          paramtype2 = "facedir",
                          node_box = {
                             type = "fixed",
                             fixed = {
                                {-0.3125, -0.5, -0.3125, 0.3125, -0.375, 0.3125}, -- NodeBox1
                             }
                          },
                          groups = {choppy=2,dig_immediate=2},
                          sounds = default.node_sound_stone_defaults(),
                          on_rightclick = function(pos, node, player)
                             local player_name = player:get_player_name()
                             local formspec = "size[7.8,2.8;]"..
                                "field[0.2,0.4;8,1;sigilname;Sigil name;]"..
                                "field[0.2,1.6;8,1;location;Destination x,y,z;]"..
                                "checkbox[0,2.2;private;Private;false]"..
                                "button_exit[5.8,2.2;2,1;link_button;Link]"
                             sigil_edit_hash[player_name] = {}
                             sigil_edit_hash[player_name].pos = pos
                             sigil_edit_hash[player_name].private = "false"
                             minetest.show_formspec(player_name, "transsigil:editor",formspec)
                          end
})

minetest.register_node("transsigil:sigil_f", {
                          description = "Portal sigil",
                          tiles = {
                             "transsigil_top_f.png",
                             "transsigil_top.png",
                             "transsigil_side.png"
                          },
                          drawtype = "nodebox",
                          paramtype = "light",
                          paramtype2 = "facedir",
                          node_box = {
                             type = "fixed",
                             fixed = {
                                {-0.3125, -0.5, -0.3125, 0.3125, -0.375, 0.3125}, -- NodeBox1
                             }
                          },
                          groups = {choppy=2,dig_immediate=2,not_in_creative_inventory=1},
                          sounds = default.node_sound_stone_defaults(),
                          on_rightclick = sigil_rightclick,
                          on_punch = sigil_onpunch
})

minetest.register_node("transsigil:sigil_p", {
                          description = "Portal sigil",
                          tiles = {
                             "transsigil_top_p.png",
                             "transsigil_top.png",
                             "transsigil_side.png"
                          },
                          drawtype = "nodebox",
                          paramtype = "light",
                          paramtype2 = "facedir",
                          node_box = {
                             type = "fixed",
                             fixed = {
                                {-0.3125, -0.5, -0.3125, 0.3125, -0.375, 0.3125}, -- NodeBox1
                             }
                          },
                          groups = {choppy=2,dig_immediate=2,not_in_creative_inventory=1},
                          sounds = default.node_sound_stone_defaults(),
                          on_rightclick = sigil_rightclick,
                          on_punch = sigil_onpunch                          
})

minetest.register_on_player_receive_fields(sigil_receive_form)



