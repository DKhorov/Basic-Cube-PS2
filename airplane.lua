-- file: airplane.lua
-- Author: Carlos E. Jimenez (cejtok@gmail.com)

SoundSystem.SFXVolume(128)         -- sounds volume: 0 to 128
SoundSystem.reverb(0)              -- sounds echo: 0 to 15
SoundSystem.panoramicSeparation(0) -- Separation LR for sounds : 0 to 128

Music.volume(128) -- music volume: 0 to 128

Music.playFile("music.xm", true) -- ¡necesary for play wav sounds!
Music.stop()                     -- ¡necesary for play wav sounds!

airplane_sound = Sound.load("airplane.wav", true) -- true for repeat
airplane_sound:play()

background = Image.load("background.jpg")  -- load background
screen:blit(0,0, background)               -- put background

airplane = Image.load("airplane.png")  -- load airplane

x  = 176 -- airplane x
y  = 72  -- airplane y
v  = 2 -- speed


while true do

  screen:blit(0,0, background) -- put background

  pad = Controls.read()  -- joystick reading

  if (pad:left()) or (pad:analogX() < -1)
   then x = x  -  v
       if x < 0 then x = 0 end
  end

  if (pad:right()) or (pad:analogX() > 1)
   then x = x  +  v
        if x > 352 then x = 352 end
  end

  if (pad:up()) or (pad:analogY() < -1)
   then y = y  -  v
        if y < 0 then y = 0 end
  end

  if pad:down() or (pad:analogY() > 1)
   then y = y  +  v
        if y > 144 then y = 144 end
  end


  screen:blit(math.floor(x),math.floor(y), airplane, true) -- put airplane

  screen.flip()
  screen.waitVblankStart()

end

