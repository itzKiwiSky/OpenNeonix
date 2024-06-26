return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.2",
  name = "objects",
  class = "",
  tilewidth = 32,
  tileheight = 32,
  spacing = 0,
  margin = 0,
  columns = 17,
  image = "../../../images/objects.png",
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
        ["hitbox"] = false,
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
        ["hitbox"] = false,
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
        ["hitbox"] = false,
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
        ["hitbox"] = false,
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
        ["collidable"] = false,
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
        ["collidable"] = false,
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
        ["collidable"] = false,
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
        ["collidable"] = false,
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
        ["collidable"] = false,
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
        ["collidable"] = false,
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
