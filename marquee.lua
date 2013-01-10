args = {...}

local monitor = peripheral.wrap("right")
local delay = 0.5

-- Initial monitor configuration
monitor.setTextScale(5)
monitor.setCursorBlink(false)

local text = args[1]

for i = 1, -string.len(text) + 1, -1 do
  monitor.clear()
  monitor.setCursorPos(i, 1)
  monitor.write(text .. " " .. text)
  sleep(delay)
end
