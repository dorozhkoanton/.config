-- See current bindings and descriptions:
--   omarchy menu keybindings --print

hl.bind("SUPER + SUPER_L", hl.dsp.exec_raw("hyprctl switchxkblayout all 1"), { release = true })
hl.bind("SUPER + SUPER_R", hl.dsp.exec_raw("hyprctl switchxkblayout all 0"), { release = true })

hl.unbind("SUPER + J")
hl.unbind("SUPER + K")
hl.unbind("SUPER + L")

o.bind("SUPER + code:43", "Focus on left window", hl.dsp.focus({ direction = "l" }))
o.bind("SUPER + code:44", "Focus on below window", hl.dsp.focus({ direction = "d" }))
o.bind("SUPER + code:45", "Focus on above window", hl.dsp.focus({ direction = "u" }))
o.bind("SUPER + code:46", "Focus on right window", hl.dsp.focus({ direction = "r" }))
