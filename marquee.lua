
-- The monitor on which to display the text.
local monitor = peripheral.wrap("right")
-- The delay between marquee updates.
local delay = 0.5
-- String that separtes the text when it repeats.
local sepStr = " "

-- Initial monitor configuration.
monitor.setTextScale(5)
monitor.setCursorBlink(false)

-- Get text to display.
term.write("Text to display: ")
local text = read()

-- Create the repeating text unit.
local monitorCharLength, _ = monitor.getSize()

-- Repeating text unit must be at least twice the size of text
-- so there are no gaps when it scrolls.
local repeatingText = text .. sepStr .. text

-- Expand the repeating text unit so that it is longer than
-- the length of the monitor by at least a text unit's length.
-- This will give an smooth, unbroken marquee effect.
while string.len(repeatingText) <= monitorCharLength + string.len(text) do
    repeatingText = repeatingText .. sepStr .. text
end

-- Write the repeating text unit at a negative offset on each tick
-- to give the marquee effect.
while true do
    for i = 1, -string.len(text) - string.len(sepStr) + 2, -1 do
      monitor.clear()
      monitor.setCursorPos(i, 1)
      monitor.write(repeatingText)
      sleep(delay)
    end
end