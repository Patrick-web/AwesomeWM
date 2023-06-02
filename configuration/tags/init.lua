local awful = require('awful')
local gears = require('gears')
local icons = require('theme.icons')
local apps = require('configuration.apps')

local tags = {
  {
    icon = icons.code,
    type = 'code',
    defaultApp = apps.default.editor,
    screen = 1
  },
  {
    icon = icons.browser,
    type = 'browser',
    defaultApp = apps.default.browser,
    screen = 1
  },
  {
    icon = icons.folder,
    type = 'files',
    defaultApp = apps.default.files,
    screen = 1
  },
  {
    icon = icons.music,
    type = 'music',
    defaultApp = apps.default.music,
    screen = 1
  },
  {
    icon = icons.obsidian,
    type = "obsidian",
    defaultApp = apps.default.obsidian,
    screen = 1
  },
  {
    icon = icons.six,
    type = 'any',
    defaultApp = apps.default.applications,
    screen = 1
  },
  {
    icon = icons.seven,
    type = 'any',
    defaultApp = apps.default.applications,
    screen = 1
  }

}

awful.layout.layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.max,
  awful.layout.suit.floating
}

awful.screen.connect_for_each_screen(
  function(s)
    for i, tag in pairs(tags) do
      awful.tag.add(
        i,
        {
          icon = tag.icon,
          icon_only = true,
          layout = awful.layout.suit.tile,
          gap_single_client = false,
          gap = 0,
          screen = s,
          defaultApp = tag.defaultApp,
          selected = i == 1
        }
      )
    end
  end
)

_G.tag.connect_signal(
  'property::layout',
  function(t)
    local currentLayout = awful.tag.getproperty(t, 'layout')
    if (currentLayout == awful.layout.suit.max) then
      t.gap = 0
    else
      t.gap = 0
    end
  end
)
