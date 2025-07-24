require("bird")
require("pipe")
require("menu")

gameState="menu"

function love.load()
menu:load()   
bird:load()
pipe:load()
score=0
end

function love.update(dt)
   if gameState == "menu" then
       menu:update(dt)
   elseif gameState == "game" then
 bird:update(dt)
 pipe:update(dt)
 love:score()
   end
end

function love.draw()
   if gameState == "game" then
       
   love.graphics.setColor(0.1, 0.2, 0.4)
   love.graphics.rectangle('fill', 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
   bird:draw()
   pipe:draw()
   love.graphics.setColor(1, 1, 1)
    love.graphics.print("Score: "..score, 15,15)
   elseif gameState == "menu" then
  

   menu:draw()
   end
end

function love:score()
   if not pipe.passed1 and bird.x > pipe.x1 + pipe.width then
      score = score + 1
      pipe.passed1 = true
   end
   if not pipe.passed2 and bird.x > pipe.x2 + pipe.width then
      score = score + 1
      pipe.passed2 = true
   end
end

function love.keypressed(key)
   
    
    if key == "space" and gameState == "game" then
        

        bird.grav = -300

    elseif key == "escape" then
        gameState = "menu"
    end
end

function love.mousepressed(x, y, button, istouch)
   
    if gameState == "menu" then
        action = menu:mousepressed(x, y, button)

        if action == "play" then
            gameState = "game"

           
        elseif action == "leaderboard" then
            gameState = "leaderboard"
        elseif action == "exit" then
            love.event.quit()
        end
    end
end


