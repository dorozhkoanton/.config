-- default/hypr/bindings/clipboard.lua
-- sudo nvim /usr/share/omarchy/default/hypr/bindings/clipboard.lua
--
-- https://github.com/basecamp/omarchy/pull/6419

o.bind("SUPER + C", "Universal copy", universal_clipboard_shortcut("CTRL", "code:54", "CTRL", "Insert"))
o.bind("SUPER + V", "Universal paste", universal_clipboard_shortcut("CTRL", "code:55", "SHIFT", "Insert"))
o.bind("SUPER + X", "Universal cut", send_shortcut_once("CTRL", "code:53"))
