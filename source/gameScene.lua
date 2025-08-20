local pd <const> = playdate
local gfx <const> = playdate.graphics

local ldtk <const> = LDtk

ldtk.load("levels/test3.ldtk", false)

class("GameScene").extends()

function GameScene:init() 
    self:goToLevel("Level_0")
end

function GameScene:goToLevel(levelName)
    if not levelName then return end

    self.levelName = levelName

    gfx.sprite.removeAll()

    for layerName, layer in pairs(ldtk.get_layers(levelName)) do
        if layer.tiles then
            local tilemap = ldtk.create_tilemap(levelName, layerName)

            local layerSprite = gfx.sprite.new()
            layerSprite:setTilemap(tilemap)
            layerSprite:moveTo(0, 0)
            layerSprite:setCenter(0, 0)
            layerSprite:setZIndex(layer.zIndex)
            layerSprite:add()

            local emptyTiles = ldtk.get_empty_tileIDs(levelName, "Solid", layerName)
            if emptyTiles then
                printTable(emptyTiles)
                gfx.sprite.addWallSprites(tilemap, emptyTiles)
            else
                print("No empty tiles found")
            end
        end
    end
end