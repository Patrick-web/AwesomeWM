local wibox = require('wibox')
local dpi = require('beautiful').xresources.apply_dpi

local HEIGHT = 10;

local BottomPanel = function(s)

    local panel =
    wibox(
    {
      ontop = true,
      screen = s,
      height = dpi(HEIGHT),
      width = s.geometry.widht,
      x = s.geometry.x,
      y = s.geometry.y,
      stretch = false,
      bg = "#00000000",
      fg = "#ffffff",
      struts = {
        bottom = dpi(HEIGHT)
      }
    }
    )

    panel:struts(
      {
        bottom = dpi(HEIGHT)
      }
    )

    panel:setup {
      layout = wibox.layout.align.horizontal,
    }

  return panel
end

return BottomPanel
