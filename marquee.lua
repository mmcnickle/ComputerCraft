local monitor = peripheral.wrap("right")

-- Initial monitor configuration
monitor.setTextScale(5)

local text = "Hello, world!"

for i = 1, -string.len(text), -1 do
  monitor.clear()
  monitor.setCursorPos(i, 1)
  monitor.write(text)
  sleep(0.5)
end
