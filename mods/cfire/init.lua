local colors = {
   "black", "blue", "cyan", "frosted", "green", "magenta", "orange", "purple", "red", "yellow",
}

for i = 1, #colors, 1 do
   local node_context = {
      description = colors[i].." flame",
      drawtype = "firelike",
      tiles = {{
            name=colors[i].."_fire_animated.png",
            animation={
               type="vertical_frames", aspect_w=16, aspect_h=16, length=1
            },
      }},
      light_source = 12,
      groups = {dig_immediate=3},
      drop = '',
      walkable = false,
      buildable_to = true,
      damage_per_second = 4,      
   }
   minetest.register_node("cfire:flame_"..colors[i], node_context)
end
