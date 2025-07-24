pipe={}

function pipe:load()
    self.passed1=false
    self.passed2=false
    self.width = 52
    self.spaceHeight = 125
    self.x1 = love.graphics.getWidth() + 200
    self.y1 = 0
    self.x2= love.graphics.getWidth() + 500
    self.y2 = 0
    self.spaceY1 =love.math.random(54, love.graphics.getHeight() - self.spaceHeight - 54 )
    self.spaceY2 = love.math.random(54, love.graphics.getHeight() - self.spaceHeight - 54 )

end


function pipe:update(dt)
    self:move(dt,'x1')
    self:move(dt, 'x2')  
end

function pipe:draw()
    

    function drawPipe(x,space)
    love.graphics.setColor(.37, .82, .28)
    love.graphics.rectangle('fill', x, 0, self.width, space)
    love.graphics.rectangle('fill', x, space + self.spaceHeight, self.width, love.graphics.getHeight())
    end
    
    drawPipe(self.x1, self.spaceY1)
    drawPipe(self.x2, self.spaceY2) 
   
end     
 

function pipe:move(dt,xmov)
   if xmov == 'x1' then
        self.x1 = self.x1 - 100 * dt
        if self.x1 < -self.width then
            self.x1 = love.graphics.getWidth()
            self.spaceY1 = love.math.random(54, love.graphics.getHeight() - self.spaceHeight - 54)  
            self.passed1 = false
        end
    elseif xmov == 'x2' then
        self.x2 = self.x2 - 100 * dt
        if self.x2 < -self.width then
            self.x2 = love.graphics.getWidth()
            self.spaceY2 = love.math.random(54, love.graphics.getHeight() - self.spaceHeight -54)
            self.passed2 = false
        end
    end
end


