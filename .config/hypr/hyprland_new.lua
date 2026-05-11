-- IMPORT



-- CONTEXT VARIABLES

local terminal = "kitty"
local fileManager = "dolphin"
local menu = "wofi --show drun"
local scriptsDir = "~/.config/hypr/scripts"
local mainMod = "SUPER"

-- ENVIRONMENT VARIABLES

hl.env("p__NV_PRIME_RENDER_OFFLOAD", "0")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "mesa")
hl.env("XDG_CURRENT_DESKTOP","Hyprland")
hl.env("XDG_MENU_PREFIX", "arch-")
hl.env("GDK_BACKEND", "wayland")
hl.env("SDL_VIDE0DRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("MOZ_ENABLE_WAYLAND", "1")

hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("XCURSOR_THEME", "rose-pine-cursor")
hl.env("XCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("GTK_THEME", "Graphite-Dark")

-- INPUT
  
-- STARTUP
hl.on("hyprland.start", function ()
  hl.exec_cmd(waybar)
  hl.exec_cmd(hyprsunset)
  hl.exec_cmd(hyprsession)
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  -- hl.exec_cmd("jamesdsp -t")
  hl.exec_cmd("nm-applet --indicator")
  hl.exec_cmd(blueman-applet)
  hl.exec_cmd("env DRI_PRIME=0 __NV_PRIME_RENDER_OFFLOAD=0 __GLX_VENDOR_LIBRARY_NAME=mesa VK_ICD_FILENAMES='' VK_LAYER_PATH='' swaync")
  hl.exec_cmd(hypridle)
  hl.exec_cmd(awww-daemon)
  hl.exec_cmd("nwg-look -a")
  hl.exec_cmd(fcitx5)
  hl.exec_cmd("hyprpm reload -n")
  -- hl.exec_cmd("hyprdynamicmonitors run")
  hl.exec_cmd("quickshell -p ~/.config/quickshell/qs-hyprview/")
  hl.exec_cmd("wpctl settings --save bluetooth.autoswtich-to-headset-profile false")
  hl.exec_cmd("cat ~/.cache/wal/sequences")
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("dbus-update-activation-environment --systemd --all")
  hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)
-- WINDOWRULES

-- BINDS
-- BINDS -- WINDOWS
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("hyprctl dispatch togglefloating && hyprctl dispatch resizeactive exact 900 600 && hyprctl dispatch centerwindow"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("hyprctl dispatch fullscreen 1"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd("hyprctl dispatch fullscreenstate 3"))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + ALT + TAB", hl.dsp.exec_cmd("quickshell ipc -p ~/.config/quickshell/qs-hyprview/ call expose toggle bands"))
hl.bind(mainMod .. " + S", hl.dsp.layoutmsg("swapwithmaster master"))
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + up", hl.window.move({ workspace = u }))
hl.bind(mainMod .. " + SHIFT + down", hl.window.move({ workspace = d }))
hl.bind(mainMod .. " + SHIFT + left", hl.window.move({ monitor = "+1" }))
hl.bind(mainMod .. " + SHIFT + right", hl.window.move({ monitor = "-1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + CTRL + mouse:272", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })



-- BINDS -- APPLICATIONS
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + CTRL + SHIFT + escape", hl.dsp.exec_cmd("killall tux-manager || tux-manager"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("killall rofi || rofi -modi "calc,drun" -show drun"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(obsidian))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("kill $(hyprctl -j clients | jq -r '.[] | select(.title|test("^.*hyprdynamicmonitors$")) | .pid') || kitty --title hyprdynamicmonitors --class hyprdynamicmonitors --detach -e hyprdynamicmonitors tui"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("killall waybar || waybar"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("killall waypaper || waypaper"))
hl.bind(mainMod .. " + ALT + SHIFT + S", hl.dsp.exec_cmd("pkill -x slurp || hyprshot -m region -o ~/Pictures/Screenshots -z"))

-- BINDS -- FUNCTIONS
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("waypaper --random"))
hl.bind("escape", hl.dsp.exec_cmd("killall waypaper"))
hl.bind("escape", hl.dsp.exec_cmd("hyprswitch close --kill"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("wlogout -b 5 -T 500 -B 500"))
hl.bind("XF86PowerOff", hl.dsp.exec_cmd("wlogout -b 5 -T 500 -B 500"))
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("systemctl suspend"))

-- BINDS -- KEYS
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 5 @DEFAULT_SINK@"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 5 @DEFAULT_SINK@"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("pamixer -t @DEFAULT_SINK@"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("bash -c 'pamixer -t --default-source; state=$pamixer --default-source --get-mute); notify-send 'Mic: $( [ '$state' = true ] && echo Muted || echo On)'"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- VISUALS
hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 4,
		border_size = 2,

		active_border = { colors = { "color4", "color5" }, angle = 45 },
		inactive_border = "color1",

		layout = "master",

		allow_tearing = false,
	},
	decoration = {
		rounding = 5,
		dim_around = 0.5,

		blur = {
			enabled = true,
			popups = true,
			size = 10,
			passes = 3,
			new_optimizations = true,
			ignore_opacity = true,
			noise = 0.10,
			brightness = 0.90,
		},

		shadow = {
			enabled = true,
			range = 14,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		animations = {
			enabled = true,
		},
	},
})

hl.gesture({
  fingers = 3, 
  direction = "horizontal",
  action = "workspace",
})

hl.cursor({
  no_warps = false,
  persistant_warps = true,
})

-- MONITORS
hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = "1.25",
})

-- PLUGINS
local hs = require("hyprsplit")
hs.config({ num_workspaces = 10 })
for i = 1, 10 do
  hl.bind("SUPER + " .. i, hs.dsp.focus({ workspace = i }))
  hl.bind("SUPER + SHIFT + " .. i, hs.dsp.window.move({ workspace = i, follow = false}))
end
