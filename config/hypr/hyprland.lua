------------------
---- MONITORS ----
------------------
hl.monitor({
    output = "HDMI-A-2",
    mode = "7680x2160@120.00Hz",
    position = "0x0",
    scale = 1
})

-- Dual Display
-- hl.monitor({
--     output = "DP-1",
--     mode = "2560x1440@120Hz",
--     position = "0x0",
--     scale = 1
-- })
-- hl.monitor({
--     output = "DP-3",
--     mode = "2560x1440@120Hz",
--     position = "-2560x0",
--     scale = 1
-- })

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user enable --now hyprpolkitagent.service")
    hl.exec_cmd("systemctl --user enable --now pipewire.service")
    hl.exec_cmd("systemctl --user enable --now wireplumber.service")
    hl.exec_cmd("systemctl --user enable --now pipewire-pulse.service")
    hl.exec_cmd("systemctl --user restart pipewire.service")
    hl.exec_cmd("systemctl --user start xdg-desktop-portal-hyprland.service")
    hl.exec_cmd("systemctl --user start dunst.service")
    hl.exec_cmd("uwsm app -- waybar")
    hl.exec_cmd("uwsm app -- hyprpaper")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

require("env_var")

---------------
---- INPUT ----
---------------

require("input/input_definition")
require("input/key_bindings")

--------------------
---- APPEARENCE ----
--------------------

require("appearance/config")
require("appearance/animations")
require("appearance/workspaces_single_display")
-- If using a dual display setup - Remember to adjust the display names
-- require("~/.config/hypr/workspaces_dual_display.conf")
