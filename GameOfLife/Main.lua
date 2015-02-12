--# Main
-- The Game Of Life

-- Use this function to perform your initial setup
function setup()
   print("The game of life by John Horton Conway")

   grid = Grid()
end

-- This function gets called once every frame
function draw()
   -- This sets a dark background color 
   background(0, 0, 0, 255)

   -- This sets the line thickness
   strokeWidth(1)

   grid:draw()
   -- Do your drawing here

end

function touched(touch)
   grid:touched(touch)
end