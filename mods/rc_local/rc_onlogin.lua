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
