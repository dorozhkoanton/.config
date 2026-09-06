-- List current monitors and supported resolutions with: hyprctl monitors all

local omarchy_gdk_scale = 1
local omarchy_monitor_scale = 1

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))

hl.monitor({ output = "HDMI-A-1", mode = "2560x1440@120", position = "0x0", scale = omarchy_monitor_scale })
hl.monitor({ output = "DP-1", mode = "2560x1440@120", position = "2560x0", scale = omarchy_monitor_scale })
