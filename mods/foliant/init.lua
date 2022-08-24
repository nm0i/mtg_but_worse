local foliant_colors = { "red", "gray", "blue", "green", "violet" }

local foliant_edit_hash = {}

local newlines2table = function(str)
   if(type(str)~="string") then
      return "ERROR: No string found!"
   end
   local function convert(s)
      return s:gsub("\n", function(slash, what)
                       return ","
      end)
   end
   return convert(str)
end

local function foliant_receive_form(player, form_name, fields)
   if form_name == "foliant:edit_filename" and fields.save then
      local player_name = player:get_player_name()
      local pos = foliant_edit_hash[player_name].pos
      if not pos then return end
      local meta = minetest.get_meta(pos)
      meta:set_string("filename", fields.filename or "")
      if (fields.filename or "") ~= "" then
         meta:set_string("infotext", fields.filename or "")
      end
      minetest.log("action", player_name.." has set filename"..fields.filename.." to foliant at "..minetest.pos_to_string(player:getpos()))
   end
   if form_name == "foliant:edit_book" and fields.save then
      local player_name = player:get_player_name()
      local pos = foliant_edit_hash[player_name].pos
      if not pos then return end
      local meta = minetest.get_meta(pos)
      meta:set_string("title", fields.title or "")
      meta:set_string("text", fields.text or "")
      meta:set_string("owner", player_name)
      if (fields.title or "") ~= "" then
         meta:set_string("infotext", fields.title)
      end
      minetest.log("action", player_name.." has written in a book (title: \""..fields.title.."\"): \""..fields.text..
                      "\" at location: "..minetest.pos_to_string(player:getpos()))
   end
   
end

local function register_foliant(color)
   minetest.register_node("foliant:"..color, {
                             description = "Foliant ("..color..")",
                             tiles = {
                                "foliant_"..color.."_top.png",
                                "foliant_"..color.."_bottom.png",
                                "foliant_"..color.."_right.png",
                                "foliant_left.png",
                                "foliant_"..color.."_back.png",
                                "foliant_"..color.."_front.png"
                             },
                             inventory_image = "foliant_"..color.."_top.png",
                             sounds = default.node_sound_wood_defaults(),
                             drawtype = "nodebox",
                             paramtype = "light",
                             paramtype2 = "facedir",
                             groups = {choppy=1,dig_immediate=1},
                             node_box = {
                                type = "fixed",
                                fixed = {
                                   {-0.25, -0.5, -0.3125, 0.25, -0.375, 0.3125}, -- NodeBox1
                                }
                             },
                             on_place = function(itemstack, player, pointed_at)
                                local pos = pointed_at.under
                                local node = minetest.get_node_or_nil(pos)
                                local def = node and minetest.registered_nodes[node.name]
                                if not def or not def.buildable_to then
                                   pos = pointed_at.above
                                   node = minetest.get_node_or_nil(pos)
                                   def = node and minetest.registered_nodes[node.name]
                                   if not def or not def.buildable_to then return itemstack end
                                end
                                if minetest.is_protected(pos, player:get_player_name()) then return itemstack end
                                local fdir = minetest.dir_to_facedir(player:get_look_dir())
                                minetest.set_node(pos, {
                                                     name = "foliant:"..color,
                                                     param2 = fdir,
                                                       })
                                
                                local text = itemstack:get_metadata() or ""
                                local data = minetest.deserialize(text) or {}
                                local meta = minetest.get_meta(pos)
                                
                                meta:set_string("title", data.title or "")
                                meta:set_string("text", data.text or "")
                                meta:set_string("owner", data.owner or "")
                                
                                itemstack:take_item()
                                return itemstack
                             end,
                             on_dig = function(pos, node, player)
                                if minetest.is_protected(pos, player:get_player_name()) then return end
                                local meta = minetest.get_meta(pos)
                                local data = minetest.serialize({
                                                                   title = meta:get_string("title") or "",
                                                                   text = meta:get_string("text") or "",
                                                                   owner = meta:get_string("owner") or ""
                                                                })
                                local stack = ItemStack({
                                                           name = "foliant:"..color,
                                                           metadata = data,
                                                        })
                                stack = player:get_inventory():add_item("main", stack)
                                if not stack:is_empty() then
                                   minetest.item_drop(stack, player, pos)
                                end
                                minetest.remove_node(pos)
                             end,
                             on_rightclick = function(pos, node, player)
                                local meta = minetest.get_meta(pos)
                                local player_name = player:get_player_name()
                                local title = meta:get_string("title") or ""
                                local text = meta:get_string("text") or ""
                                local owner = meta:get_string("owner") or ""
                                local formspec
                                if owner == "" or owner == player_name then
                                   formspec = "size[12,8]"..default.gui_bg..default.gui_bg_img..
                                      "field[0.5,1;11.5,0;title;Title:;"..
                                      minetest.formspec_escape(title).."]"..
                                      "textarea[0.5,1.5;11.5,7;text;Contents:;"..
                                      minetest.formspec_escape(text).."]"..
                                      "button_exit[0.25,7.5;3,1;save;Save]"
                                else
                                   formspec = "size[12,8]"..default.gui_bg..default.gui_bg_img..
                                      "label[0.25,0.5;by "..owner.."]"..
                                      "label[0.25,0;"..minetest.formspec_escape(title).."]"..
                                         "tablecolumns[text]"..
                                         "tableoptions[background=#000000;highlight=#000000;border=false]"..
                                         "table[0.25,1.25;11.25,6.25;text;"..newlines2table(minetest.formspec_escape(text)).."]"..
                                      "button_exit[0.25,7.5;3,1;exit;Close]"
                                end
                                foliant_edit_hash[player_name] = {}
                                foliant_edit_hash[player_name].pos = pos
                                minetest.show_formspec(player_name, "foliant:edit_book",formspec)
                             end
                                             })
   minetest.register_node("foliant:file_"..color, {
                             description = "Foliant file ("..color..")",
                             tiles = {
                                "foliant_"..color.."_top.png",
                                "foliant_"..color.."_bottom.png",
                                "foliant_"..color.."_right.png",
                                "foliant_left.png",
                                "foliant_"..color.."_back.png",
                                "foliant_"..color.."_front.png"
                             },
                             inventory_image = "foliant_"..color.."_top.png",                             
                             sounds = default.node_sound_wood_defaults(),
                             drawtype = "nodebox",
                             paramtype = "light",
                             paramtype2 = "facedir",
                             groups = {choppy=1,dig_immediate=1,not_in_creative_inventory=1},
                             node_box = {
                                type = "fixed",
                                fixed = {
                                   {-0.25, -0.5, -0.3125, 0.25, -0.375, 0.3125}, -- NodeBox1
                                }
                             },
                             on_rightclick = function(pos, node, player)
                                local meta = minetest.get_meta(pos)
                                local player_name = player:get_player_name()

                                local filename = meta:get_string("filename")
                                local formspec
                                if filename == "" then
                                   formspec = "size[7.8,1.6;]"..
                                      "field[0.2,0.4;8,1;filename;File name;]"..
                                      "button_exit[5.9,1.0;2,1;save;Save]"
                                else
                                   local fname = "foliant_"..filename..".txt"
                                   local worldpath = minetest.get_worldpath()
                                   local foliantfile = io.open(worldpath.."/"..fname,"r")
                                   formspec = "size[12,8]"..default.gui_bg..default.gui_bg_img
                                   if foliantfile ~= nil then
                                      local text = foliantfile:read("*a")
                                      formspec = formspec..
                                         "label[0.25,0.25;"..minetest.formspec_escape(filename).."]"..
                                         "tablecolumns[text]"..
                                         "tableoptions[background=#000000;highlight=#000000;border=false]"..
                                         "table[0.25,0.75;11.5,6.75;text;"..newlines2table(minetest.formspec_escape(text)).."]"
                                   else            
                                      formspec = formspec.."label[.25,.25;File does not exist]"
                                   end             
                                   formspec = formspec.."button_exit[0.25,7.5;3,1;exit;Close]"
                                   if ( foliantfile ~= nil ) then
                                      foliantfile:close()
                                   end
                                end
                                foliant_edit_hash[player_name] = {}
                                foliant_edit_hash[player_name].pos = pos
                                minetest.show_formspec(player_name, "foliant:edit_filename",formspec)
                             end
                                             })

end

for k in pairs(foliant_colors) do
   register_foliant(foliant_colors[k])
end

minetest.register_on_player_receive_fields(foliant_receive_form)

