local arg = {...}

local rowLength = arg[1]
local blockNum = arg[2]

local TORCH_SLOT = 1

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

    for j = 1, rowLength, 1 do
      digAll()
      if i % 2 == 1 and (j == 6 or j == 11) then
        layTorch()
      end

      if i % 2 == 0 and (j == 4 or j == 9) then
        layTorch()
      end
      turtle.forward()
    end
    rightTurn()
    for j = 1, rowLength, 1 do
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

mine(rowLength, blockNum)