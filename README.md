# rParticle
Super light weight and highly customizable 2D particle system for Roblox.  
*Forked and remade for other use by **AlexR32***

## Loadstring
```lua
local ParticleEmitter = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/AlexR32/rParticle/master/ParticleEmitter.lua"))()
```


## Documentation / Example
```lua
local ParticleEmitter = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/AlexR32/rParticle/master/ParticleEmitter.lua"))()

ParticleEmitter.rate = 5 -- The number of particles to be emitted per second.
ParticleEmitter.onSpawn = function(particle) -- A callback function called when a particle is spawned.
	-- particle.element -- The GuiObject which this particle represents.
	-- particle.age -- The amount of time in seconds the particle has been alive.
	-- particle.maxAge -- The max amount of time in seconds the particle can be alive.
	-- particle.position -- The location of the particle relative to the hook. (Vector2)
	-- particle.velocity -- This is a placeholder which is intended to be used when writing movement code for particle. (Vector2)
	-- particle:Destroy() -- Destroys the Particle instance
end
ParticleEmitter.onUpdate = function(particle,deltaTime) end -- A callback function called when a particle is updated.
local Emitter = ParticleEmitter.new(hook,particle) -- Creates a new ParticleEmitter instance
-- hook: GuiObject where particle will be parented
-- particle: GuiObject that will act as particle
-- Emitter:Destroy() -- Destroys the ParticleEmitter instance
-- Emitter:Emit(count) -- Emits a particle
-- count: The number of particles to be emitted.
```
