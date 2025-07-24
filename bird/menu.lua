-- menu.lua

 menu = {}

-- =============================================================================
-- 1. Configuration & Setup
-- =============================================================================

-- Define a modern bluish color palette
 colors = {
    background = {0.1, 0.2, 0.4},      -- Dark Slate Blue
    buttonNormal = {0.2, 0.4, 0.7, 0.8}, -- Royal Blue (with some transparency)
    buttonHover = {0.4, 0.6, 0.9, 1.0},  -- Lighter Royal Blue (fully opaque)
    text = {1, 1, 1},                  -- White
    title = {0.8, 0.9, 1.0}            -- Light Cyan
}

-- Button properties
 buttonWidth = 200
 buttonHeight = 50
 buttonPadding = 20 -- Space between buttons

-- =============================================================================
-- 2. Menu Load Function
-- =============================================================================
-- This function is called once to initialize menu assets.
function menu:load()
    -- Get screen dimensions to center the menu
     screenWidth = love.graphics.getWidth()
     screenHeight = love.graphics.getHeight()

    -- Load fonts
    -- Using the default font if you don't have a custom one is fine.
    -- For a better look, download a font like 'Roboto' or 'Lato' and place it in your project folder.
    self.titleFont = love.graphics.newFont(48)
    self.buttonFont = love.graphics.newFont(24)

    -- Define the buttons. We'll store their properties in a table.
    self.buttons = {
        {
            text = "Play",
            x = (screenWidth - buttonWidth) / 2,
            y = screenHeight / 2 - 30,
            width = buttonWidth,
            height = buttonHeight,
            action = "play"
        },
        {
            text = "Leaderboard",
            x = (screenWidth - buttonWidth) / 2,
            y = screenHeight / 2 - 30 + (buttonHeight + buttonPadding),
            width = buttonWidth,
            height = buttonHeight,
            action = "leaderboard"
        },
        {
            text = "Exit",
            x = (screenWidth - buttonWidth) / 2,
            y = screenHeight / 2 - 30 + 2 * (buttonHeight + buttonPadding),
            width = buttonWidth,
            height = buttonHeight,
            action = "exit"
        }
    }
end

-- =============================================================================
-- 3. Menu Update Function
-- =============================================================================
-- This function runs every frame to handle logic, like checking for mouse hover.
function menu:update(dt)
    -- Get mouse position
     mx, my = love.mouse.getPosition()

    -- Check if the mouse is hovering over any button
    for i, button in ipairs(menu.buttons) do
        if mx >= button.x and mx <= button.x + button.width and
           my >= button.y and my <= button.y + button.height then
            button.isHovered = true
        else
            button.isHovered = false
        end
    end
end

-- =============================================================================
-- 4. Menu Draw Function
-- =============================================================================
-- This function runs every frame to draw everything on the screen.
function menu:draw()
    -- Draw a simple blue background
    love.graphics.setBackgroundColor(colors.background)

    -- Draw the game title
    love.graphics.setFont(menu.titleFont)
    love.graphics.setColor(colors.title)
    love.graphics.printf("Flappy Bird", 0, love.graphics.getHeight() / 4, love.graphics.getWidth(), "center")

    -- Draw the buttons
    love.graphics.setFont(menu.buttonFont)
    for i, button in ipairs(menu.buttons) do
        -- Set button color based on whether it's hovered or not
        if button.isHovered then
            love.graphics.setColor(colors.buttonHover)
        else
            love.graphics.setColor(colors.buttonNormal)
        end
        -- Draw the button rectangle
        love.graphics.rectangle("fill", button.x, button.y, button.width, button.height, 10, 10) -- Added rounded corners

        -- Draw the button text
        love.graphics.setColor(colors.text)
        love.graphics.printf(button.text, button.x, button.y + (button.height - menu.buttonFont:getHeight()) / 2, button.width, "center")
    end
end

-- =============================================================================
-- 5. Mouse Press Handler
-- =============================================================================
-- This function checks if a button was clicked and returns the action.
function menu:mousepressed(x, y, button)
    if button == 1 then -- 1 is the left mouse button
        for i, btn in ipairs(menu.buttons) do
            if x >= btn.x and x <= btn.x + btn.width and
               y >= btn.y and y <= btn.y + btn.height then
                return btn.action -- Return the action string (e.g., "play")
            end
        end
    end
    return nil -- Return nil if no button was clicked
end

-- Return the menu table so it can be used by other files
