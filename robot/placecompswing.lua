robot = require ("robot")

function place(fn)
  if fn() then return true end
  for i = 1,8 do
    if robot.count(i) > 0 then
      robot.select(i);
      if fn() then return true
      end
    end
  end
  return false, "Unknown error in place()";
end

function wait(fn)
  while not fn() do os.sleep(1) end
end

while true do
  robot.select(1)
  assert(place(robot.place))
  robot.select(16)
  wait(robot.compare)
  robot.select(9)
  assert(robot.swing())
end
