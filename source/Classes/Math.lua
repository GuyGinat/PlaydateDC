trigCache = {}

function pointOnCircle(cx, cy, radius, angle)
    local key = math.floor(angle - 90) % 360
    if not trigCache[key] then
        trigCache[key] = {
            cos = math.cos(math.rad(key)),
            sin = math.sin(math.rad(key))
        }
    end
    local x, y = trigCache[key].cos, trigCache[key].sin    
    return cx + x * radius,
           cy + y * radius
end
