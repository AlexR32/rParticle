local Particle = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/AlexR32/rParticle/master/Particle.lua"))()
local RunService = game:GetService("RunService")

local ParticleEmitter = {}
ParticleEmitter.__index = ParticleEmitter

local function SpawnParticle(ParentObject,ParticleObject,OnSpawn)
    local NewParticle = Particle.new(ParticleObject:Clone())
    NewParticle.Object.Parent = ParentObject
    OnSpawn(NewParticle) return NewParticle
end

function ParticleEmitter.new(ParentObject,ParticleObject)
    local Self = setmetatable({},ParticleEmitter)

    Self.ParentObject = ParentObject
    Self.ParticleObject = ParticleObject
    Self.OnUpdate = function() end
    Self.OnSpawn = function() end
    Self.ElapsedTime = 0
    Self.Particles = {}
    Self.SpawnRate = 5
    Self.Dead = false

    Self.Connection = RunService.RenderStepped:Connect(function(Delta)
        for Index,Particle in ipairs(Self.Particles) do
            if Particle.Dead then 
                table.remove(Self.Particles,Index)
            else
                Particle:Update(Delta,Self.OnUpdate)
            end
        end

        Self.ElapsedTime += Delta
        if Self.SpawnRate > 0 and not Self.Dead then
            while Self.ElapsedTime >= 1 / Self.SpawnRate do
                Self.ElapsedTime -= 1 / Self.SpawnRate
                Self:Emit(1)
            end
        end
    end)

    return Self
end

function ParticleEmitter.Emit(Self,Count)
    if Count < 1 then return end
    for Index = Count,1,-1 do
        table.insert(
            Self.Particles,
            SpawnParticle(
                Self.ParentObject,
                Self.ParticleObject,
                Self.OnSpawn
            )
        )
    end
end

function ParticleEmitter.Destroy(Self)
    if Self.Dead then
        error('Cannot Destroy Dead ParticleEmitter')
        return
    end

    Self.Dead = true

    for Index,Particle in ipairs(Self.Particles) do
        if Particle then Particle:Destroy() end
    end
    if Self.Connection then
        Self.Connection:Disconnect()
    end
end

return ParticleEmitter
