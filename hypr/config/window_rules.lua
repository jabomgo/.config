local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})


-- Popups discretos (waybar / waypaper)
local function popup(class, w, h, x, y)
  hl.window_rule({
    name = "popup-" .. class,
    match = { class = class },
    float = true,
    size = { w, h },
    move = { x, y },
  })
end

-- Blur da Waybar
hl.layer_rule({
    name = "blur-waybar",
    match = { namespace = "waybar" },
    blur = true,
})

hl.window_rule({ name = "popup-waypaper", match = { class = "^waypaper$" }, float = true, center = true, size = { 900, 600 } })
popup("^org.pulseaudio.pavucontrol$", "700", "450", "monitor_w-window_w-12", "46")
popup("^nm-connection-editor$", "520", "420", "monitor_w-window_w-12", "46")
popup("^gsimplecal$", "260", "240", "(monitor_w-window_w)/2", "46")

-- Kitty: opaco quando focado, levemente transparente quando não
hl.window_rule({ name = "kitty-inactive-opacity", match = { class = "^kitty$" }, opacity = "0.95 0.80" })
