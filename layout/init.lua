local awful = require('awful')
local top_panel = require('layout.top-panel')
local left_panel = require('layout.left-panel')
local bottom_panel = require('layout.bottom-panel')

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(
  function(s)
    -- Create the Top bar
    s.top_panel = top_panel(s)
    s.left_panel = left_panel(s)
    s.bottom_panel = bottom_panel(s)
  end
)

-- Hide bars when app go fullscreen
function updateBarsVisibility(screen)
  for s in screen do
    if s.selected_tag then
      local fullscreen = s.selected_tag.fullscreenMode
      -- Order matter here for shadow
      s.top_panel.visible = not fullscreen
      s.left_panel.visible = not fullscreen
      s.bottom_panel.visible = not fullscreen
    end
  end
end

_G.tag.connect_signal(
  'property::selected',
  function(t)
    updateBarsVisibility()
  end
)

_G.client.connect_signal(
  'property::fullscreen',
  function(c)
    c.screen.selected_tag.fullscreenMode = c.fullscreen
    updateBarsVisibility()
  end
)

_G.client.connect_signal(
  'unmanage',
  function(c)
    if c.fullscreen then
      c.screen.selected_tag.fullscreenMode = false
      updateBarsVisibility()
    end
  end
)
