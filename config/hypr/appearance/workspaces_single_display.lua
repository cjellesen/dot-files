hl.workspace_rule({
    workspace = "1",
    default_name = "Free",
    monitor = "HDMI-A-2"
})

hl.workspace_rule({
    workspace = "2",
    default_name = "Firefox",
    monitor = "HDMI-A-2"
})

hl.workspace_rule({
    workspace = "3",
    default_name = "QGIS",
    monitor = "HDMI-A-2"
})

hl.workspace_rule({
    workspace = "4",
    default_name = "Bitwarden",
    monitor = "HDMI-A-2"
})

hl.workspace_rule({
    workspace = "5",
    default_name = "Steam",
    monitor = "HDMI-A-2"
})

hl.workspace_rule({
    workspace = "6",
    default_name = "Pycharm",
    monitor = "HDMI-A-2"
})

hl.workspace_rule({
    workspace = "7",
    default_name = "Rider",
    monitor = "HDMI-A-2"
})

hl.workspace_rule({
    workspace = "8",
    monitor = "HDMI-A-2"
})

hl.workspace_rule({
    workspace = "9",
    monitor = "HDMI-A-2"
})

hl.workspace_rule({
    workspace = "0",
    default_name = "Steam Games",
    monitor = "HDMI-A-2"
})

hl.window_rule({
    name = "Firefox",
    workspace = "2 silent",
    match = { class = "^(firefox)$" }
})

hl.window_rule({
    name = "Qgis",
    workspace = "3 silent",
    match = { class = "^(QGIS - )$" }
})

hl.window_rule({
    name = "Bitwarden",
    workspace = "4 silent",
    match = { class = "^(Bitwarden)$" }
})

hl.window_rule({
    name = "Steam",
    workspace = "5 silent",
    match = { class = "^(steam)$" }
})

hl.window_rule({
    name = "Jetbrains Pycharm",
    workspace = "6 silent",
    match = { class = "^(jetbrains-pycharm)$" }
})

hl.window_rule({
    name = "Jetbrains Rider",
    workspace = "7 silent",
    match = { class = "^(jetbrains-rider)$" }
})

hl.window_rule({
    name = "Steam Apps",
    workspace = "0 silent",
    match = { class = "World of Warcraft" },
    fullscreen = true,
    maximize = true
})
