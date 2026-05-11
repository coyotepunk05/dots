-- IMPORT
local home = os.getenv("HOME")
local wal = dofile(home .. "/.cache/wal/colorsHyprland.lua")

-- check for hyprdynamicmonitors update and add import or whatever here.

-- CONTEXT VARIABLES
local terminal = "kitty"
local fileManager = "dolphin"
local menu = "wofi --show drun"
local scriptsDir = "~/.config/hypr/scripts"
local mainMod = "SUPER"

-- ENVIRONMENT VARIABLES
hl.env("p__NV_PRIME_RENDER_OFFLOAD", "0")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "mesa")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
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

-- STARTUP
hl.on("hyprland.start", function()
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprsunset")
	hl.exec_cmd("hyprsession")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	-- hl.exec_cmd("jamesdsp -t")
	hl.exec_cmd("nm-applet --indicator")
	hl.exec_cmd("blueman - applet")
	hl.exec_cmd(
		"env DRI_PRIME=0 __NV_PRIME_RENDER_OFFLOAD=0 __GLX_VENDOR_LIBRARY_NAME=mesa VK_ICD_FILENAMES='' VK_LAYER_PATH='' swaync"
	)
	hl.exec_cmd("hypridle")
	hl.exec_cmd("nwg-look -a")
	hl.exec_cmd("fcitx5")
	hl.exec_cmd("hyprpm reload -n")
	-- hl.exec_cmd("hyprdynamicmonitors run")
	hl.exec_cmd("quickshell -p ~/.config/quickshell/qs-hyprview/")
	hl.exec_cmd("wpctl settings --save bluetooth.autoswtich-to-headset-profile false")
	hl.exec_cmd("cat ~/.cache/wal/sequences")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

-- BINDS
-- BINDS -- WINDOWS
hl.bind(mainMod .. " + G", function()
	hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
	hl.dispatch(hl.dsp.window.resize({ x = 900, y = 600, type = "exact" }))
	hl.dispatch(hl.dsp.window.center())
end)
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(
	mainMod .. " + ALT + TAB",
	hl.dsp.exec_cmd("quickshell ipc -p ~/.config/quickshell/qs-hyprview/ call expose toggle bands")
)
hl.bind(mainMod .. " + S", hl.dsp.layout("swapwithmaster master"))
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + Up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.move({ monitor = "+1" }))
hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.window.move({ monitor = "-1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + ALT + mouse:272", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- BINDS -- APPLICATIONS
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind("CTRL + SHIFT + escape", hl.dsp.exec_cmd("killall tux-manager || tux-manager"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("killall rofi || rofi -modi 'calc,drun' -show drun"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("obsidian"))
-- hl.bind(
-- mainMod .. " + M",
-- hl.dsp.exec_cmd(
-- 	"kill $(hyprctl -j clients | jq -r '.[] | select(.title|test('^.*hyprdynamicmonitors$')) | .pid') || kitty --title hyprdynamicmonitors --class hyprdynamicmonitors --detach -e hyprdynamicmonitors tui"
-- )
--  )
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("killall waybar || waybar"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("killall waypaper || waypaper"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("pkill -x slurp || hyprshot -m region -o ~/Pictures/Screenshots -z"))

-- BINDS -- FUNCTIONS
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("waypaper --random"))
hl.bind("escape", hl.dsp.exec_cmd("killall waypaper"), { non_consuming = true })
hl.bind("escape", hl.dsp.exec_cmd("hyprswitch close --kill"), { non_consuming = true })
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("wlogout -b 5 -T 500 -B 500"))
hl.bind("XF86PowerOff", hl.dsp.exec_cmd("wlogout -b 5 -T 500 -B 500"))
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("systemctl suspend"))

-- BINDS -- KEYS
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 5 @DEFAULT_SINK@"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 5 @DEFAULT_SINK@"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pamixer -t @DEFAULT_SINK@"), { locked = true, repeating = true })
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd(
		"bash -c 'pamixer -t --default-source; state=$pamixer --default-source --get-mute); notify-send 'Mic: $( [ '$state' = true ] && echo Muted || echo On)'"
	),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- VISUALS
hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 4,
		border_size = 2,

		col = {
			active_border = { colors = { wal.color4, wal.color5 }, angle = 45 },
			inactive_border = wal.color1,
		},

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
			enabled = false,
			range = 14,
			render_power = 3,
			color = 0xee1a1a1a,
		},
	},

	animations = {
		enabled = true,
	},
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		vrr = 3,
	},
})

-- hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "slide" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "slide" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-- LAYERRULES

-- quickshell
hl.layer_rule({
	match = { namespace = "quickshell:expose" },
	dim_around = 1,
	blur = true,
	animation = "fadeIn",
})
-- wofi
hl.layer_rule({
	match = { namespace = "wofi" },
	blur = true,
	ignore_alpha = 0.1,
	animation = "slide top",
})

-- hyprswitch
hl.layer_rule({ match = { namespace = "hyprswitch" }, blur = true })

-- logout_dialog
hl.layer_rule({ match = { namespace = "logout_dialog" }, blur = true })

-- swaync
hl.layer_rule({
	match = { namespace = "swaync-control-center" },
	blur = true,
	ignore_alpha = 0.1,
	animation = "slide right",
})

hl.layer_rule({
	match = { namespace = "swaync-notification-window" },
	blur = true,
	ignore_alpha = 0.1,
	animation = "slide right",
	order = 1,
})

-- rofi
hl.layer_rule({
	match = { namespace = "rofi" },
	blur = true,
	ignore_alpha = 0.1,
	animation = "popin",
})

-- waybar & hyprpanel
hl.layer_rule({ match = { namespace = "bar-0" }, blur = true })
hl.layer_rule({ match = { namespace = "bar-1" }, blur = true })
hl.layer_rule({ match = { namespace = "bar-2" }, blur = true })
hl.layer_rule({ match = { namespace = "waybar" }, blur = true, order = 0 })

--WINDOWRULES

--- waypaper
hl.window_rule({
	name = "waypaper",
	match = { initial_class = "waypaper" },
	opacity = 0.8,
	float = true,
	move = { 675, 35 },
	size = { 700, 800 },
	pin = true,
})

-- bitwarden
hl.window_rule({
	name = "bitwarden",
	match = { title = "^(.*Bitwarden.*)$" },
	no_screen_share = true,
	stay_focused = true,
	float = true,
})

-- thunar
hl.window_rule({
	name = "thunar",
	match = { initial_class = "thunar" },
	opacity = 0.88,
})

-- dolphin
hl.window_rule({
	name = "dolphin",
	match = { initial_class = "org.kde.dolphin" },
	opacity = 0.8,
})

-- ark
hl.window_rule({
	name = "ark",
	match = { initial_class = "org.kde.ark" },
	opacity = 0.8,
})

-- lxtask
hl.window_rule({
	name = "lxtask",
	match = { class = "Lxtask" },
	opacity = 0.6,
	float = true,
	size = { 700, 700 },
	move = { "61.1%", "4.2%" },
	pin = true,
})

-- mission center
hl.window_rule({
	name = "missioncenter",
	match = { class = "io.missioncenter.MissionCenter" },
	opacity = 0.7,
	float = true,
	move = { 910, 35 },
	size = { 1000, 530 },
	pin = true,
})

-- tux-manager
hl.window_rule({
	name = "tux-manager",
	match = { class = "tux-manager" },
	opacity = 0.7,
	float = true,
	move = { 1040, 100 },
	size = { 1000, 750 },
	pin = true,
})

-- VScode
hl.window_rule({
	name = "VScode",
	match = { class = "Code" },
	opacity = 0.88,
})

-- pavucontrol
hl.window_rule({
	name = "pavucontrol",
	match = { class = "org.pulseaudio.pavucontrol" },
	float = true,
	move = { 1200, 35 },
	size = { 575, 400 },
	opacity = 0.6,
	pin = true,
})

-- blueman-manager
hl.window_rule({
	name = "blueman-manager",
	match = { class = "blueman-manager" },
	float = true,
	move = { 10, 35 },
	size = { 650, 400 },
	opacity = 0.6,
	pin = true,
})

-- network-manager
hl.window_rule({
	name = "network-manager",
	match = { class = "nm-connection-editor" },
	float = true,
	move = { 10, 35 },
	size = { 650, 400 },
	opacity = 0.6,
})

-- jamesdsp
hl.window_rule({
	name = "jamesdsp",
	match = { class = "jamesdsp" },
	float = true,
	move = { 10, 35 },
	size = { 650, 400 },
	opacity = 0.88,
})

-- mullvad-vpn
hl.window_rule({
	name = "mullvad-vpn",
	match = { class = "Mullvad VPN" },
	move = { 40, 35 },
	opacity = 0.88,
	pin = true,
})

-- hyprdynamicmonitors
hl.window_rule({
	name = "hyprdynamicmonitors",
	match = { title = "hyprdynamicmonitors" },
	float = true,
})

-- INPUT
hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "grp:toggle, f_keys:basic_13-24",
		kb_rules = "",

		follow_mouse = 1,

		force_no_accel = 0,
		accel_profile = "flat",

		touchpad = {
			scroll_factor = 0.2,
			natural_scroll = true,
			disable_while_typing = false,
		},
	},
})

hl.device({
	name = "syna0a00:00-06cb:cf00-touchpad",
	accel_profile = "adaptive",
})

-- hl.cursor({
-- 	no_warps = false,
-- 	persistant_warps = true,
-- })

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
for i = 1, 9 do
	hl.bind("SUPER + " .. i, hs.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + " .. i, hs.dsp.window.move({ workspace = i, follow = false }))
end
