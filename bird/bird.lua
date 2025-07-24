bird={}

function bird:load()
    self.x=62
    self.y=love.graphics.getHeight()/2
    self.height=24
    self.width=34
    self.grav=0
end

function bird:update(dt)
    self.grav = self.grav + 516 * dt
    self.y = self.y + self.grav * dt
    boundry()
    self:collision()
   
end

function love.keypressed(key)
   
   if key=="space" then
      bird.grav= -300
   end 
end

function boundry()
   if bird.y<0 or  bird.y + bird.height > love.graphics.getHeight() then
      love.load()
   end
end

function bird:draw()
    love.graphics.setColor(.87, .84, .27)
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

function bird:collision()
   if self.x + self.width > pipe.x1 and self.x < pipe.x1 + pipe.width and
       (self.y < pipe.spaceY1 or self.y + self.height > pipe.spaceY1 + pipe.spaceHeight) then
         love.load()
   end

     if self.x + self.width > pipe.x2 and self.x < pipe.x2 + pipe.width and
       (self.y < pipe.spaceY2 or self.y + self.height > pipe.spaceY2 + pipe.spaceHeight) then
         love.load()
   end
end



