return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 20,
  height = 15,
  tilewidth = 32,
  tileheight = 32,
  nextlayerid = 5,
  nextobjectid = 1,
  properties = {
    ["background id"] = 1,
    ["level color"] = "#ff62a635",
    ["room height"] = 2000,
    ["room width"] = 2000
  },
  tilesets = {
    {
      name = "blocks",
      firstgid = 1,
      class = "",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 7,
      image = "../../images/blocks.png",
      imagewidth = 224,
      imageheight = 64,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      wangsets = {},
      tilecount = 14,
      tiles = {
        {
          id = 0,
          properties = {
            ["h"] = 4,
            ["hitbox"] = true,
            ["objName"] = "tile_horizontal",
            ["offsetX"] = 0,
            ["offsetY"] = 14,
            ["visible"] = true,
            ["w"] = 32
          }
        },
        {
          id = 1,
          properties = {
            ["h"] = 18,
            ["hitbox"] = true,
            ["objName"] = "tile_corner_down_right",
            ["offsetX"] = 14,
            ["offsetY"] = 14,
            ["visible"] = true,
            ["w"] = 18
          }
        },
        {
          id = 2,
          properties = {
            ["h"] = 18,
            ["hitbox"] = true,
            ["objName"] = "tile_corner_up_right",
            ["offsetX"] = 14,
            ["offsetY"] = 0,
            ["visible"] = true,
            ["w"] = 18
          }
        },
        {
          id = 3,
          properties = {
            ["h"] = 32,
            ["hitbox"] = true,
            ["objName"] = "tile_bif_right",
            ["offsetX"] = 14,
            ["offsetY"] = 0,
            ["visible"] = true,
            ["w"] = 18
          }
        },
        {
          id = 4,
          properties = {
            ["h"] = 32,
            ["hitbox"] = true,
            ["objName"] = "tile_bif_left",
            ["offsetX"] = 0,
            ["offsetY"] = 0,
            ["visible"] = true,
            ["w"] = 18
          }
        },
        {
          id = 5,
          properties = {
            ["h"] = 8,
            ["hitbox"] = true,
            ["objName"] = "tile_point_left",
            ["offsetX"] = 0,
            ["offsetY"] = 12,
            ["visible"] = true,
            ["w"] = 8
          }
        },
        {
          id = 6,
          properties = {
            ["h"] = 8,
            ["hitbox"] = true,
            ["objName"] = "tile_point_right",
            ["offsetX"] = 24,
            ["offsetY"] = 12,
            ["visible"] = true,
            ["w"] = 8
          }
        },
        {
          id = 7,
          properties = {
            ["h"] = 32,
            ["hitbox"] = true,
            ["objName"] = "tile_vertical",
            ["offsetX"] = 14,
            ["offsetY"] = 0,
            ["visible"] = true,
            ["w"] = 4
          }
        },
        {
          id = 8,
          properties = {
            ["h"] = 18,
            ["hitbox"] = true,
            ["objName"] = "tile_corner_left_up",
            ["offsetX"] = 0,
            ["offsetY"] = 14,
            ["visible"] = true,
            ["w"] = 18
          }
        },
        {
          id = 9,
          properties = {
            ["h"] = 18,
            ["hitbox"] = true,
            ["objName"] = "tile_corner_left_up",
            ["offsetX"] = 0,
            ["offsetY"] = 0,
            ["visible"] = true,
            ["w"] = 18
          }
        },
        {
          id = 10,
          properties = {
            ["h"] = 18,
            ["hitbox"] = true,
            ["objName"] = "tile_bif_down",
            ["offsetX"] = 0,
            ["offsetY"] = 14,
            ["visible"] = true,
            ["w"] = 32
          }
        },
        {
          id = 11,
          properties = {
            ["h"] = 18,
            ["hitbox"] = true,
            ["objName"] = "tile_bif_up",
            ["offsetX"] = 0,
            ["offsetY"] = 0,
            ["visible"] = true,
            ["w"] = 32
          }
        },
        {
          id = 12,
          properties = {
            ["h"] = 8,
            ["hitbox"] = true,
            ["objName"] = "tile_point_up",
            ["offsetX"] = 12,
            ["offsetY"] = 0,
            ["visible"] = true,
            ["w"] = 8
          }
        },
        {
          id = 13,
          properties = {
            ["h"] = 8,
            ["hitbox"] = true,
            ["objName"] = "tile_point_down",
            ["offsetX"] = 12,
            ["offsetY"] = 24,
            ["visible"] = true,
            ["w"] = 8
          }
        }
      }
    },
    {
      name = "objects",
      firstgid = 15,
      class = "",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 17,
      image = "../../images/objects.png",
      imagewidth = 544,
      imageheight = 32,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      wangsets = {},
      tilecount = 17,
      tiles = {
        {
          id = 0,
          properties = {
            ["collidable"] = true,
            ["h"] = 6,
            ["hitbox"] = true,
            ["objname"] = "obj_spike_up",
            ["offsetX"] = 0,
            ["offsetY"] = 13,
            ["special"] = false,
            ["visible"] = true,
            ["w"] = 32
          }
        },
        {
          id = 1,
          properties = {
            ["collidable"] = true,
            ["h"] = 6,
            ["hitbox"] = true,
            ["objname"] = "obj_spike_down",
            ["offsetX"] = 0,
            ["offsetY"] = 13,
            ["special"] = false,
            ["visible"] = true,
            ["w"] = 32
          }
        },
        {
          id = 2,
          properties = {
            ["collidable"] = true,
            ["h"] = 32,
            ["hitbox"] = true,
            ["objname"] = "obj_spike_left",
            ["offsetX"] = 13,
            ["offsetY"] = 0,
            ["special"] = false,
            ["visible"] = true,
            ["w"] = 6
          }
        },
        {
          id = 3,
          properties = {
            ["collidable"] = true,
            ["h"] = 32,
            ["hitbox"] = true,
            ["objname"] = "obj_spike_right",
            ["offsetX"] = 13,
            ["offsetY"] = 0,
            ["special"] = false,
            ["visible"] = true,
            ["w"] = 6
          }
        },
        {
          id = 4,
          properties = {
            ["collidable"] = true,
            ["h"] = 40,
            ["hitbox"] = true,
            ["objname"] = "obj_jump_orb",
            ["offsetX"] = -4,
            ["offsetY"] = -4,
            ["special"] = false,
            ["visible"] = true,
            ["w"] = 40
          }
        },
        {
          id = 5,
          properties = {
            ["collidable"] = true,
            ["h"] = 16,
            ["hitbox"] = true,
            ["objname"] = "obj_saw",
            ["offsetX"] = 8,
            ["offsetY"] = 8,
            ["special"] = false,
            ["visible"] = true,
            ["w"] = 16
          }
        },
        {
          id = 6,
          properties = {
            ["collidable"] = false,
            ["h"] = 0,
            ["hitbox"] = true,
            ["objname"] = "speed_up",
            ["offsetX"] = 0,
            ["offsetY"] = 0,
            ["special"] = true,
            ["visible"] = false,
            ["w"] = 0
          }
        },
        {
          id = 7,
          properties = {
            ["collidable"] = false,
            ["h"] = 0,
            ["hitbox"] = true,
            ["objname"] = "speed_down",
            ["offsetX"] = 0,
            ["offsetY"] = 0,
            ["special"] = true,
            ["visible"] = false,
            ["w"] = 0
          }
        },
        {
          id = 8,
          properties = {
            ["collidable"] = false,
            ["h"] = 0,
            ["hitbox"] = true,
            ["objname"] = "start_pos",
            ["offsetX"] = 0,
            ["offsetY"] = 0,
            ["special"] = true,
            ["visible"] = false,
            ["w"] = 0
          }
        },
        {
          id = 9,
          properties = {
            ["collidable"] = false,
            ["h"] = 0,
            ["hitbox"] = true,
            ["objname"] = "end_pos",
            ["offsetX"] = 0,
            ["offsetY"] = 0,
            ["special"] = true,
            ["visible"] = false,
            ["w"] = 0
          }
        },
        {
          id = 10,
          properties = {
            ["collidable"] = true,
            ["h"] = 32,
            ["hitbox"] = true,
            ["objname"] = "killzone",
            ["offsetX"] = 0,
            ["offsetY"] = 0,
            ["special"] = true,
            ["visible"] = false,
            ["w"] = 32
          }
        },
        {
          id = 11,
          properties = {
            ["collidable"] = true,
            ["h"] = 0,
            ["hitbox"] = false,
            ["objname"] = "obj_hide",
            ["offsetX"] = 0,
            ["offsetY"] = 0,
            ["special"] = true,
            ["visible"] = false,
            ["w"] = 0
          }
        },
        {
          id = 12,
          properties = {
            ["collidable"] = true,
            ["h"] = 0,
            ["hitbox"] = false,
            ["objname"] = "obj_show",
            ["offsetX"] = 0,
            ["offsetY"] = 0,
            ["special"] = true,
            ["visible"] = false,
            ["w"] = 0
          }
        },
        {
          id = 13,
          properties = {
            ["collidable"] = true,
            ["direction"] = 0,
            ["h"] = 0,
            ["hitbox"] = false,
            ["lifetime"] = -1,
            ["objname"] = "particle_emitter",
            ["offsetX"] = 0,
            ["offsetY"] = 0,
            ["special"] = true,
            ["visible"] = false,
            ["w"] = 0
          }
        },
        {
          id = 14,
          properties = {
            ["collidable"] = true,
            ["h"] = 0,
            ["hitbox"] = false,
            ["objname"] = "obj_gamemode_cube",
            ["offsetX"] = 0,
            ["offsetY"] = 0,
            ["special"] = true,
            ["visible"] = false,
            ["w"] = 0
          }
        },
        {
          id = 15,
          properties = {
            ["collidable"] = true,
            ["h"] = 0,
            ["hitbox"] = false,
            ["objname"] = "obj_gamemode_float",
            ["offsetX"] = 0,
            ["offsetY"] = 0,
            ["special"] = true,
            ["visible"] = false,
            ["w"] = 0
          }
        },
        {
          id = 16,
          properties = {
            ["collidable"] = true,
            ["h"] = 0,
            ["hitbox"] = false,
            ["objname"] = "obj_gamemode_dart",
            ["offsetX"] = 0,
            ["offsetY"] = 0,
            ["special"] = true,
            ["visible"] = false,
            ["w"] = 0
          }
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 20,
      height = 15,
      id = 1,
      name = "tiles",
      class = "primary",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      chunks = {
        {
          x = 0, y = 0, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 1, 0, 2, 0, 3, 0, 4, 0, 5, 0, 6, 0, 7, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 8, 0, 9, 0, 10, 0, 11, 0, 12, 0, 13, 0, 14, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 15, 0, 16, 0, 17, 0, 18, 0, 19, 0, 20, 0, 21, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 22, 0, 23, 0, 24, 0, 25, 0, 26, 0, 27, 0, 28, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 29, 0, 30, 0, 31, 0, 31, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 1, 1, 1, 1, 11, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 8, 0,
            1, 1, 1, 1, 15, 15, 1, 1, 10, 0, 0, 0, 0, 0, 8, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        }
      }
    }
  }
}
