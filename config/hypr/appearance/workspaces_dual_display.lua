--@param config table
function AddWorkSpaceRules(config)
    config.workspace_rules({
        workspace = "1",
        default_name = "Free",
        monitor = "DP-1"
    })

    config.workspace_rules({
        workspace = "2",
        default_name = "Firefox",
        monitor = "DP-3"
    })

    config.workspace_rules({
        workspace = "3",
        default_name = "QGIS",
        monitor = "DP-3"
    })

    config.workspace_rules({
        workspace = "4",
        default_name = "Bitwarden",
        monitor = "DP-3"
    })

    config.workspace_rules({
        workspace = "5",
        default_name = "Steam",
        monitor = "DP-3"
    })

    config.workspace_rules({
        workspace = "6",
        default_name = "Pycharm",
        monitor = "DP-1"
    })

    config.workspace_rules({
        workspace = "7",
        default_name = "Rider",
        monitor = "DP-1"
    })

    config.workspace_rules({
        workspace = "8",
        monitor = "DP-3"
    })

    config.workspace_rules({
        workspace = "9",
        monitor = "DP-3"
    })

    config.workspace_rules({
        workspace = "0",
        default_name = "Steam Games",
        monitor = "DP-1"
    })
end

--@param config table
function AddWindowRules(config)
    config.window_rule({
        name = "Firefox",
        workspace = "2 silent",
        match = { class = "^(firefox)$" }
    })

    config.window_rule({
        name = "Qgis",
        workspace = "3 silent",
        match = { class = "^(QGIS - )$" }
    })

    config.window_rule({
        name = "Bitwarden",
        workspace = "4 silent",
        match = { class = "^(Bitwarden)$" }
    })

    config.window_rule({
        name = "Steam",
        workspace = "5 silent",
        match = { class = "^(steam)$" }
    })

    config.window_rule({
        name = "Jetbrains Pycharm",
        workspace = "6 silent",
        match = { class = "^(jetbrains-pycharm)$" }
    })

    config.window_rule({
        name = "Jetbrains Rider",
        workspace = "7 silent",
        match = { class = "^(jetbrains-rider)$" }
    })

    config.window_rule({
        name = "Steam Apps",
        workspace = "0 silent",
        match = { class = "^(World of Warcraft)$" }
    })
end
