package.path = "/home/then3lli-nvidia/Documenti/lua/content.lua"
Version = {
    debug = "debug",
    release = "release"
}

Active_version = Version.debug


Section = { -- sections are part of the game, form mainmenu to game itself
    mainmenu = 1,
    game = 2,
    settings = 3
}
Active_section = Section.mainmenu

Gamestate = { -- gamestate declare if the game is playing, or paused. idle is used for ingame menu
    idle = "idle",
    playing = "playing",
    paused = "paused",
    gameover = "gameover"
}
Active_gamestate = Gamestate.idle

-------------------- CORE FUNCTIONS (LOVE) ----------------------
function love.load()
    load_requirements()
    load_window()
    

    love.graphics.setBackgroundColor(0.1, 0.1, 0.1)
    love.graphics.setColor(1, 1, 1)
end

function load_requirements()
    require("content.lua")
   
end
function load_window()
    if Active_version == Version.debug then
        love.window.setTitle(Game_name..Game_version..Game_version_description)
    elseif Active_section == Version.release then
        love.window.setTitle(Game_name)
    end
    
    love.window.setMode(Window_width, Window_height)

end

function love.draw()
    if(Active_section == Section.mainmenu) then
        draw_game_section_mainmenu()
    end
end

function love.update()
    input()
    if Active_section == Section.mainmenu then
        game_section_mainmenu()
        
    end
end

function input()
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end

    if Active_version == Version.debug then
        if love.keyboard.isDown("space") then
            Active_section = Section.game
        elseif love.keyboard.isDown("backspace") then
            Active_section = Section.mainmenu
        end
    end
    
end


---------------- SECTIONS ----------------------
function game_section_mainmenu()
    message = "main menu"
end

function draw_game_section_mainmenu()
    love.graphics.print(message, 400, 300)
end

function game_section_one()
    message = "You are in the first section of the game"
end


