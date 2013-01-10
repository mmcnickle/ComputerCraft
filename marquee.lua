local monitor = peripheral.wrap("right")
local delay = 0.5

-- Initial monitor configuration
monitor.setTextScale(5)
monitor.setCursorBlink(false)

-- Get text to display
term.write("Text to display: ")
local text = read()

while true do
    for i = 1, -string.len(text) + 1, -1 do
      monitor.clear()
      monitor.setCursorPos(i, 1)
      monitor.write(text .. " " .. text)
      sleep(delay)
    end
end