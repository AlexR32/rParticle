# rParticle
Super light weight and highly customizable 2D particle system for Roblox.  
*Forked and remade for other use by **AlexR32***

## Documentation / Example
```lua
local ParticleEmitter = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/AlexR32/rParticle/master/Main.lua"))()

ParticleEmitter.SpawnRate = 5 -- The number of particles to be emitted per second
ParticleEmitter.OnSpawn = function(Particle) -- A callback function called when a particle is spawned
    --Particle.Object -- The GuiObject which this particle represents
    --Particle.Age -- The amount of time in seconds the particle has been alive
    --Particle.MaxAge -- The max amount of time in seconds the particle can be alive
    --Particle.Position -- The location of the particle relative to the hook (Vector2)
    --Particle.Velocity -- This is a placeholder which is intended to be used when writing movement code for particle (Vector2)
    --Particle:Destroy() -- Destroys the Particle instance
end
ParticleEmitter.OnUpdate = function(Particle,DeltaTime) end -- A callback function called when a particle is updated (Connected to RenderStepped event)
local Emitter = ParticleEmitter.new(Parent,Particle) -- Creates a new ParticleEmitter instance
--Parent: GuiObject where particle will be parented
--Particle: GuiObject that will act as particle
--Emitter:Destroy() -- Destroys the ParticleEmitter instance
--Emitter:Emit(Count) -- Emits a particle(s)
--Count: The number of particles to be emitted
```
