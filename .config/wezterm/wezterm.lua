local wezterm = require 'wezterm'
local config = {}

local function file_exists(path)
    local f = io.open(path, "r")
    if f~=nil then io.close(f) return true else return false end
end

config.font = wezterm.font('Pragmasevka Nerd Font')
config.color_scheme = 'Tokyo Night'
config.font_size = 24

if file_exists("/opt/homebrew/bin/bash") then
    config.default_prog = { '/opt/homebrew/bin/bash', '-l' }
elseif file_exists("/bin/bash") then
    config.default_prog = { '/bin/bash', '-l' }
end

return config
