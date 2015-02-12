--# Square
Square = class()

function Square:init(x,xcoord,ycoord)
   -- you can accept and set parameters here
   width = 10
   -- states: dead: 0, alive: 1
   self.state = x
   self.x = xcoord
   self.y = ycoord
   self.nextGen = 0
end

function Square:draw()
   -- Codea does not automatically call this method
   if self.state == 0 then
       fill(128, 128, 129, 98)
   else
       fill(93, 253, 4, 255)
   end
   rect(self.x * width, self.y * width, width, width)
end

function Square:initial(i)
   self.state = i
end

function Square:changeState()
   self.state = self.nextGen
end

function Square:newGen(nextv)
   self.nextGen = nextv
end

function Square:giveState()
   return self.state
end

function Square:touched(touch)
   -- Codea does not automatically call this method
end