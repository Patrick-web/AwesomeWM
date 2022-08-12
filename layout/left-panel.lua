local wibox = require('wibox')
local dpi = require('beautiful').xresources.apply_dpi

local WIDTH = 50;

local LeftPanel = function(s)

    local panel =
    wibox(
    {
      ontop = true,
      screen = s,
      height = s.geometry.height,
      width = dpi(WIDTH),
      x = s.geometry.x,
      y = s.geometry.y,
      stretch = false,
      bg = "#00000000",
      fg = "#ffffff",
      struts = {
        left = dpi(WIDTH)
      }
    }
    )

    panel:struts(
      {
        left = dpi(WIDTH)
      }
    )

    panel:setup {
      layout = wibox.layout.align.horizontal,
    }

  return panel
end

return LeftPanel
