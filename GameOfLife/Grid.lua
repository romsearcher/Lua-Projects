--# Grid
Grid = class()

function Grid:init()
   -- you can accept and set parameters here
   self.squares = {}

   --size = 70
   ancho = 100
   height = 75

   --ancho = 200
   --height = 150

   for i=1,ancho do
       self.squares[i] = {}
       for j=1,height do
           self.squares[i][j] = Square(0,i,j)
       end
   end 

   done = false

   self:initialState()
   --self:gosperGliderGun()
   --self:acorn()

   --done = true
end

function Grid:draw()
   -- Codea does not automatically call this method
   for i=1,ancho do
       for j=1,height do
           num = self.squares[i][j]
           self:checkState(num,i,j)
       end
   end

   if done then 
       for i=1,ancho do
           for j=1,height do
               num = self.squares[i][j]
               num:changeState()
           end
       end
   end

   for i=1,ancho do
       for j=1,height do
           num = self.squares[i][j]
           num:draw()
       end
   end
end

function Grid:checkState(cell,ipos,jpos)
   liveCount = 0
   deadCount = 0

   if ipos - 1 >= 1 and jpos - 1 >= 1 and ipos + 1 <= ancho and jpos + 1 <= height then  
       for p=ipos-1,ipos+1 do
           for q=jpos-1,jpos+1 do
               if p ~= ipos or q ~= jpos then 
                   if self.squares[p][q]:giveState() == 1 then
                       liveCount = liveCount + 1
                   else
                       deadCount = deadCount + 1
                   end
               end
           end
       end
       --print ("final sum: ".. liveCount + deadCount)

       if cell:giveState() == 0 then
           if liveCount == 3 then
               cell:newGen(1)
           end
       else
           if liveCount < 2 then
               cell:newGen(0)
           elseif liveCount >= 2 and liveCount <= 3 then
               -- viveeee
           elseif liveCount > 3 then
               cell:newGen(0)
           end
       end    
   end
end

function Grid:acorn()
   local offsetx = 75
   local offsety = 30
   local cords = {{2,1},{3,1},{3,3},{5,2},{6,1},{7,1},{8,1}}

   for index,t in ipairs(cords) do
       --print ("t1: "..t[1].." - "..t[2])
       self:on(t[1] + offsetx, t[2] + offsety)
   end

   done = true
end

function Grid:gosperGliderGun()
   --Coords

   local offsetx = 15
   local offsety = 30
   local cords = {{2,5},{2,6},{3,5},{3,6},{12,4},{12,5},{12,6},{13,3},{13,7},{14,2},{14,8},{15,2},{15,8},{16,5},{17,3},{17,7},{18,4},{18,5},{18,6},{19,5},{22,6},{22,7},{22,8},{23,6},{23,7},{23,8},{24,5},{24,9},{26,4},{26,5},{26,9},{26,10},{36,7},{36,8},{37,7},{37,8}}

   --local cords = {{2,5},{2,6},{3,5},{3,6}}

   for index,t in ipairs(cords) do
       --print ("t1: "..t[1].." - "..t[2])
       self:on(t[1] + offsetx, t[2] + offsety)
   end

   done = true
end

function Grid:on(i,j)
   self.squares[i][j]:initial(1)
   self.squares[i][j]:newGen(1)
end

function Grid:initialState()
   --1000
   local times = 1000
   for i=0,times do
       ir = math.random(2,ancho)
       jr = math.random(2,height)
       self.squares[ir][jr]:initial(1)
       --self.squares[ir][jr]:newGen(1)
   end

   done = true
end

function Grid:touched(touch)
   -- Codea does not automatically call this method
   x = math.floor(touch.x)
   y = math.floor(touch.y)

   --self.squares[x][y]:newGen(1)

   --print("here: " .. x .. "-" .. y)
end