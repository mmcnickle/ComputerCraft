local arg = {...}

local rowLength = arg[1]
local blockNum = arg[2]

local TORCH_SLOT = 1

mine(rowLength, blockNum)

function layTorch()
  turtle.select(TORCH_SLOT)
  turtle.placeDown()
end

function digAll()
  turtle.digUp()

  while turtle.detect() do
    turtle.dig()
    sleep(0.8)
  end

  turtle.digDown()
end

function clearRow(length)
  for i = 1, length, 1 do
    digAll()
    turtle.forward()
  end
end

function rightTurn()
  turtle.turnRight()
  digAll()
  turtle.forward()
  turtle.turnRight()
end

function leftTurn()
  turtle.turnLeft()
  digAll()
  turtle.forward()
  turtle.turnLeft()
end

function mine(rowLength, blockNum)
  for i = 1, blockNum, 1 do
    if i > 1 then
      leftTurn()
    end

    for j = 1, rowlength, 1 do
      digAll()
      turtle.forward()

      if i % 2 == 1 and j % 5 == 0 then
        layTorch()
      end

      if i % 2 == 0 and (j == 3 or j == 8) then
        layTorch()
      end
    end
    rightTurn()
    for j = 1, rowlength, 1 do
      digAll()
      turtle.forward()
    end
  end

  -- Return home.
  turtle.turnRight()
  for i = 1, blockNum * 2, 1 do
    turtle.forward()
  end
  turtle.turnRight()
end

