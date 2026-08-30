---@module 'hl'

--###############
--## MONITORS ###
--###############

require("monitors")

local terminal = "kitty"
local fileManager = "dolphin"
local menu = "wofi --show drun"

hl.env("XCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("WLR_DRM_NO_ATOMIC", 1)
hl.env("WLR_NO_HARDWARE_CURSORS", 1)

--####################
--## LOOK AND FEEL ###
--####################

hl.config({
    general = {
        gaps_in = 4,
        gaps_out = 8,
        border_size = 2,
        resize_on_border = false,
        allow_tearing = false,
        layout = "master",
        col = {
            -- active_border = "rgba(30a5ffff)",
            active_border = { colors = { "rgba(40ffffff)", "rgba(30a5ffff)" }, angle=45},
            inactive_border = "rgba(59595900)",
        },
    },
    decoration = {
        rounding = 8,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        blur = {
            enabled = false,
            size = 1,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
    animations = {
        enabled = true,
    },
    master = {
        new_on_top = false,
        orientation = "left",
        mfact = 0.5,
    },
    scrolling = {
        direction = "right",
        -- wrap_focus = true,
        -- column_width = 1.0,
        -- explicit_column_widths = "1.0",
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
    },

    --############
    --## INPUT ###
    --############

    input = {
        kb_layout = "us",
        kb_variant = "altgr-intl",
        kb_options = "caps:swapescape",
        -- kb_model = { },
        -- kb_rules = { },
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

--##################
--## KEYBINDINGS ###
--##################

local mainMod = "ALT"

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + space", hl.dsp.window.float())
hl.bind(mainMod .. " + F3", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("noctalia msg panel-toggle control-center"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("noctalia msg panel-toggle calendar"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("noctalia msg panel-toggle wallpaper"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("noctalia msg wallpaper-next"))
hl.bind("SUPER + L", hl.dsp.exec_cmd("noctalia msg session lock"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprctl dispatch dpms off && hyprctl dispatch dpms on"))

-- Move workspace to monitor
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.workspace.move({ monitor="+1" }))
-- Master layout controls
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.layout("swapwithmaster"))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.layout("orientationcycle right left"))
-- Fullscreen
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode="maximized"}))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())
-- Special workspace (scratchpad)
hl.bind(mainMod .. " + minus", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + minus", hl.dsp.window.move({ workspace = "special:magic" }))
-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move focus with mainMod + vim keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- Move to workspace silently with mainMod + SHIFT + CTRL + [0-9]
hl.bind(mainMod .. " + SHIFT + CTRL + 1", hl.dsp.window.move({ workspace = 1, follow=false }))
hl.bind(mainMod .. " + SHIFT + CTRL + 2", hl.dsp.window.move({ workspace = 2, follow=false }))
hl.bind(mainMod .. " + SHIFT + CTRL + 3", hl.dsp.window.move({ workspace = 3, follow = false }))
hl.bind(mainMod .. " + SHIFT + CTRL + 4", hl.dsp.window.move({ workspace = 4, follow = false }))
hl.bind(mainMod .. " + SHIFT + CTRL + 5", hl.dsp.window.move({ workspace = 5, follow = false }))
hl.bind(mainMod .. " + SHIFT + CTRL + 6", hl.dsp.window.move({ workspace = 6, follow = false }))
hl.bind(mainMod .. " + SHIFT + CTRL + 7", hl.dsp.window.move({ workspace = 7, follow = false }))
hl.bind(mainMod .. " + SHIFT + CTRL + 8", hl.dsp.window.move({ workspace = 8, follow = false }))
hl.bind(mainMod .. " + SHIFT + CTRL + 9", hl.dsp.window.move({ workspace = 9, follow = false }))
hl.bind(mainMod .. " + SHIFT + CTRL + 0", hl.dsp.window.move({ workspace = 10, follow = false }))

-- Move/resize windows with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl -p spotify,firefox,vlc next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl -p spotify,firefox,vlc play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl -p spotify,firefox,vlc play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl -p spotify,firefox,vlc previous"), { locked = true })

--#############################
--## WINDOWS AND WORKSPACES ###
--#############################

hl.window_rule({
    name = "tag_pavucontrol",
    match = { class = "^(org.pulseaudio.pavucontrol)$", title = "^(Volume Control)$" },
    tag = "contr",
})

hl.window_rule({
    name = "tag_blueman",
    match = { class = "^(.blueman-manager-wrapped)$", title = "^(Bluetooth Devices)$" },
    tag = "contr",
})

hl.window_rule({
    name = "style_contr_applets",
    match = { tag = "contr" },
    float = true,
    move = "100%-w-50 10%",
})

-- CHANGED: Consolidated 8 broken Flameshot window rules into a single rule
hl.window_rule({
    name = "flameshot_overlay",
    match = { class = "^(flameshot)$" },
    no_anim = true,
    float = true,
    move = "0 0",
    pin = true,
    stay_focused = true,
    border_size = 0,
    rounding = 0,
    fullscreen_state = "0 0",
})

hl.bind("code:107", hl.dsp.exec_cmd("QT_QPA_PLATFORM=wayland flameshot gui"))

-- CHANGED: Consolidated Qalculate (calculator) rules
hl.window_rule({
    name = "qalculate_popup",
    match = { class = "^(qalculate-gtk)$" },
    float = true,
    center = true,
    workspace = "special:calc",
})

hl.bind("code:148", hl.dsp.workspace.toggle_special("calc"))
hl.bind(mainMod .. " + SHIFT + code:148", hl.dsp.window.move({ workspace = "special:calc" }))
hl.bind("code:148", hl.dsp.exec_cmd("qalculate-gtk"))

-- CHANGED: Consolidated Nix-Shell popup rules
hl.window_rule({
    name = "nix_popup",
    match = { class = "^(nix-popup)$" },
    float = true,
    size = "1200 700",
    center = true,
    stay_focused = true,
    workspace = "special:nix-popup",
})

hl.bind(mainMod .. " + SHIFT + code:157", hl.dsp.window.move({ workspace = "special:nix-popup" }))
hl.bind("code:157", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-nix-popup.sh"))

-- CHANGED: Fixed suppress maximize rule
hl.window_rule({
    name = "suppress_maximize_all",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "xwayland_drag_fix",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        fullscreen = false,
    },
    no_focus = true,
})

-- Custom commands & scripts
-- hl.bind("monitoradded", hl.dsp.exec_cmd("~/.config/hypr/scripts/on-monitor-change.sh"))
hl.bind("ALT + SUPER + SHIFT + L", hl.dsp.exec_cmd("firefox -new-window https://www.linkedin.com"))
hl.bind("ALT + SUPER + SHIFT + P", hl.dsp.exec_cmd("firefox -new-window https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPUmafVB2u3w6rt9u4qYe-SjyFxAsqwquDjg&s"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("~/code/emoji/emojipick.py"))

-- Autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("firefox")
    hl.exec_cmd("noctalia")
    hl.exec("moniqued")
end)
