local mainMod = "SUPER"

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + CTRL + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + CTRL + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + j", hl.dsp.window.move({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + F4", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float())

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Set programs that you use
local terminal = "kitty"
local fileManager = "dolphin"
local menu = "wofi --show drun"
local editor = "nvim"
local screenLock = "hyprlock"
local audio = "wiremix"
local bluetooth = "bluetui"
local wifi = "impala"
local resourceManager = "desktop"
local processManager = "htop"

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("uwsm app -- " .. terminal))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("uwsm app -- " .. terminal .. " " .. editor))

hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("uwsm app -- " .. menu))

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("uwsm app -- " .. fileManager .. " " .. "$HOME"))

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("uwsm app -- " .. screenLock))

hl.bind(mainMod .. " + S", hl.dsp.exec_cmd('uwsm app -- grim -g "$(slurp)" - | uwsm app -- swappy -f -'))

hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("uwsm app -- wlogout --protocol layer-shell"))

hl.bind(mainMod .. " + CTRL + A", hl.dsp.exec_cmd("uwsm app -- " .. terminal .. " " .. audio))

hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd("uwsm app -- " .. terminal .. " " .. bluetooth))

hl.bind(mainMod .. " + CTRL + W", hl.dsp.exec_cmd("uwsm app -- " .. terminal .. " " .. wifi))

hl.bind(mainMod .. " + CTRL + P", hl.dsp.exec_cmd("uwsm app -- " .. terminal .. " " .. processManager))

hl.bind(mainMod .. " + CTRL + R", hl.dsp.exec_cmd("uwsm app -- " .. terminal .. " " .. resourceManager))

hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("uwsm stop"))
