-- See current bindings and descriptions:
--   omarchy menu keybindings --print

hl.bind("SUPER + SUPER_L", hl.dsp.exec_raw("hyprctl switchxkblayout all 1"), { release = true })
hl.bind("SUPER + SUPER_R", hl.dsp.exec_raw("hyprctl switchxkblayout all 0"), { release = true })
