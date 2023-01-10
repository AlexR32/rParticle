local Particle = {}
Particle.__index = Particle

function Particle.new(Object)
    local Self = setmetatable({},Particle)
    Self.Object = Object
    Self.Dead = false
    Self.MaxAge = 1
    Self.Ticks = 0
    Self.Age = 0

    Self.Position = Vector2.zero
    Self.Velocity = Vector2.zero

    return Self
end

function Particle.Update(Self,Delta,OnUpdate)
    if Self.Age >= Self.MaxAge and Self.MaxAge > 0 then 
        Self:Destroy() return
    end

    Self.Ticks += 1
    Self.Age += Delta

    OnUpdate(Self,Delta)
    Self.Object.Position = UDim2.fromOffset(
        Self.Position.X,Self.Position.Y
    )
end

function Particle.Destroy(Self)
    Self.Dead = true
    Self.Object:Destroy()
end

return Particle
