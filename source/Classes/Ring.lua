import "CoreLibs/object"
import "Math"

local gfx = playdate.graphics

class("Ring").extends()

function Ring:init(x, y, startRadius, endRadius)
    self.x = x
    self.y = y
    self.targetX = x
    self.targetY = y
    self.startRadius = startRadius
    self.endRadius = endRadius
    
    self.circleAngle = 0
    self.circlePointX = 0
    self.circlePointY = 0
    
end


function Ring:update(cranckDelta)
    self.circleAngle = self.circleAngle + cranckDelta
    self.circlePointX, self.circlePointY = pointOnCircle(self.x, self.y, (self.startRadius + self.endRadius) / 2, self.circleAngle)
end

function Ring:draw()
    gfx.drawCircleAtPoint(self.x, self.y, self.startRadius)
    gfx.drawCircleAtPoint(self.x, self.y, self.endRadius)
    gfx.fillCircleAtPoint(self.circlePointX, self.circlePointY, 2)
end

