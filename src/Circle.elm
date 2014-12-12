module Circle where

import List (..)
import Color (..)
import Graphics.Element (..)
import Graphics.Collage (..)
import Signal
import Time (..)

trail = 40
size = 3
areaSize = 400
speedRatio = 32
dist = 5*speedRatio
radius = areaSize/3

area = filled white (square areaSize)

pixel angle = 
  let off = -(areaSize/2) 
      center = areaSize/2 
      maxdist = dist*trail 
      angles = adjust angle (\x -> x + dist) trail 
      rads = map toRad angles 
      cx a = (center + radius*cos(a*3)) + off 
      cy a = (center + radius*sin(a*2)) + off 
      loc a = (cx a, cy a) 
      alpha a = (a - angle)/maxdist 
      col a = rgba 0 0 255 (alpha a) 
      locs = map loc rads 
      colors = map col angles 
      circles = map2 filled colors (repeat trail (circle size))
  in
     group (map2 move locs circles)

toRad angle = (toFloat ((round (angle/speedRatio)) % 360))*pi/180

adjust x by n = case n of
  0 -> []
  _ -> x::(adjust (by x) by (n-1))

drawing angle = (collage areaSize areaSize [area, pixel angle])

main = Signal.map drawing (Signal.foldp (\t x -> x + t) 0 (fps 60))