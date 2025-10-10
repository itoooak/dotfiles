local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({
  { family = 'Cica' },
})
config.font_size = 16

config.color_scheme = 'iceberg-dark'
config.window_background_opacity = 0.9

config.use_fancy_tab_bar = false

if string.find(wezterm.target_triple, 'windows') then
  config.default_prog = {
    'C:/Program Files/PowerShell/7/pwsh.exe',
    '-WorkingDirectory',
    '~'
  }

  config.keys = {
    { key = 'm', mods = 'CTRL', action = wezterm.action.ShowLauncher },
  }
else
  -- TODO
end

return config
