-- Importing libraries used for drawCircleAtPoint and crankIndicator
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/object"
import "CoreLibs/timer"

import "Classes/Ring"
import "libraries/LDtk"
import "gameScene"

-- Localizing commonly used globals
local pd <const> = playdate
local gfx <const> = playdate.graphics
local ldtk <const> = LDtk



local ring = Ring(120,120,50,60)
GameScene()
-- playdate.update function is required in every project!
function pd.update()
    -- Clear screen
    -- gfx.clear()
    gfx.sprite.update()
    pd.timer.updateTimers()
    local crankDelta = pd.getCrankChange()
    ring:update(crankDelta)
    ring:draw()
    
end
