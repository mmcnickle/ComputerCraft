local monitor = peripheral.wrap("right")

local text = "Hello, world!"

local position = 1

for i = 1, string.len(text), -1 do
  monitor.clear()
  monitor.setCursorPos(i, 1)
  monitor.write(text)
  sleep(1)
end
