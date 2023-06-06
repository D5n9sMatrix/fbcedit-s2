#include "glslstyle.bi"

' port of the "Business Card Ray-tracer" as shader

' https://www.shadertoy.com/view/MsX3Wf

dim shared as real iGlobalTime ' shader playback time (in seconds)
dim shared as vec3  iResolution ' viewport resolution (in pixels)
dim shared as vec4  iMouse      ' mouse pixel coords. xy: current (if MLB down), zw: click

const as integer raysPerPixel = 1 ' 64
const as real PI          = 3.14159265359
const as real inv_256     = 0.00390625
const as real PI_2_DIV_64 = 0.09817477042
const as real PI_2_DIV_3  = 2.*PI/3.

function funcT(o as vec3, d as vec3, byref t as single, n as vec3) as integer
  t=1000.0f
  dim as integer m
  dim as real p=-o.z/d.z
  if (.01f<p) then
    t=p
    n=vec3(0,0,1)
    m=1
  end if

  dim as vec2 sphere = vec2(10.0f,2.0f*sinf(iGlobalTime))
  dim as vec3 p2 = o + vec3(-sphere.x,0.,-sphere.y-4.0f)
  dim as real b = dot(p2,d)
  dim as real c = dot(p2,p2) - 1.0f
  dim as real q = b*b-c
  if (q>0.0f) then
    dim as real s=-b-sqrtf(q)
    if (s<t andalso s>0.01f) then
      t=s
      n=normalize(p2+d*t)
      m=2
    end if
  end if
  return m
end function

function funcR(uv as vec2) as real
  return fract(sinf(dot(normalize(uv.xy) ,vec2(12.9898f,78.233f))) * 43758.5453f)
end function


sub mainImage(fragColor as vec4, fragCoord as vec2)
  dim as vec2 uv = fragCoord.xy / iResolution.xy                  ' some optimization here to do
  dim as vec3 g = normalize(vec3(-10.0f,-16.0f,0.0f))             '  Camera direction
  dim as vec3 a = normalize(cross(g,vec3(0.0f,0.0f,1.0f)))*0.002f '  Camera up vector...Seem Z is pointing up :/ WTF !
  dim as vec3 b = normalize(cross(a,g))*0.002f                    '  The right vector, obtained via traditional cross-product
  dim as vec3 c = (a+b) * -256.0f + g                             '  WTF ? See https:' news.ycombinator.com/item?id=6425965 for more.
  ' Reuse the vector class to store not XYZ but a RGB pixel color
  dim as vec3  p = vec3(13.0f,13.0f,13.0f)                        '  Default pixel color is almost pitch black
  dim as real ratio =  64.0f/raysPerPixel

  ' Cast 64 rays per pixel (For blur (stochastic sampling) and soft-shadows.
  for k as integer=1 to raysPerPixel
    dim as real factor = 2.0f*PI/raysPerPixel
    dim as vec2 rand0 = vec2(fabs(cosf(k*factor)),fabs(sinf(k*factor)))
    dim as vec3 t=a*(funcR(uv+0.05f*rand0)-.5f)*99.0f + b*(funcR(0.06f*rand0)-.5)*99.0f
    dim as vec3 o = vec3(17.0f,16.0f,8.0f)+t
    dim as vec3 d = normalize(t*-1.0f + (a*(funcR(0.07f*rand0)+fragCoord.x) + b*(fragCoord.y+funcR(0.08f*rand0))+c)*16.0f)
    dim as vec3 cumulated_color = vec3(0.0f)
    dim as real   ts = any
    dim as vec3    ns = any
    dim as integer ms = funcT(o,d,ts,ns)
    dim as real attenuationFactor = 1.0f

    for i as integer = 0 to 1 ' Max recursivity - 3 bounces 
      dim as real fs = i
      if (0=ms) then
       ' No sphere found and the ray goes upward: Generate a sky color 
        cumulated_color= cumulated_color + attenuationFactor * vec3(0.7f,0.6f,1.0f)*pow(1.-d.z,4.0f)
        attenuationFactor = 0.0f
      end if
      ' A sphere was maybe hit.
      dim as vec2 rand0 = vec2(fabs(cosf(fs*PI_2_DIV_3)),fabs(sinf(fs*PI_2_DIV_3)))
      '  h = intersection coordinate
      dim as vec3 hs = o + d*ts
      '  'l' = direction to light (with random delta for soft-shadows).
      dim as vec3 ls = normalize(vec3(9.0f+funcR(uv+0.05f*rand0),9.0f+funcR(0.06f*rand0),16.0f)+hs*-1.0f)
      '  r = The half-vector
      dim as vec3 rs = d+ns*(dot(ns,d)*-2.0f)

      ' Calculated the lambertian factor
      dim as real bs=dot(ls,ns)

      ' Calculate illumination factor (lambertian coefficient > 0 or in shadow)?
      if (bs<0.0f orelse funcT(hs,ls,ts,ns) <>0) then bs=0.0f

      '  Calculate the color 'p' with diffuse and specular component
      dim as real ps
      if (bs <> 0.0f) then ps = pow(dot(ls,rs),99.0f)
     
      if (ms=1) then
        hs=hs*0.2f ' No sphere was hit and the ray was going downward: Generate a floor color
        dim as real cond = ceil(hs.x + iGlobalTime) + ceil(hs.y+iGlobalTime)
        ' if odd
        if (fract(cond/2.0f) = 0.0f) then
          cumulated_color = cumulated_color + attenuationFactor * vec3(3.0f,1.0f,1.0f) * (bs*0.2f+0.1f)
        else
          cumulated_color = cumulated_color + attenuationFactor * vec3(3.0f,3.0f,3.0f) * (bs*0.2f+0.1f)
        end if
        attenuationFactor = 0.0f
      end if
      cumulated_color += attenuationFactor*vec3(ps)
      attenuationFactor *= 0.5f
      o = hs
      d = rs
      ms=funcT(hs,rs,ts,ns)
    next

    p= (ratio*cumulated_color*3.5f + p)
  next
 
  fragColor = vec4(inv_256*p, 1.0f)
end sub

'
' main
'
dim as vec2 fragCoord
dim as vec4 fragColor

screenres 320,320/16*9,32


dim as integer scr_w,scr_h,scr_pitch,frames,mx,my,mb,fps
screeninfo scr_w,scr_h,,,scr_pitch
scr_pitch shr=2
iResolution.x=scr_w
iResolution.y=scr_h
dim as double tLast=timer()
while inkey()=""
  screenlock
  dim as ulong ptr row=screenptr()
  for y as integer= scr_h-1 to 0 step -1
    fragCoord.y=y
    dim as ulong ptr pixel=row
    for x as integer=0 to scr_w-1
      fragCoord.x=x
      mainImage(fragColor, fragCoord)
      pixel[x] = fragColor
    next
    row+=scr_pitch
  next
  screenunlock
  sleep 1
  frames+=1
  iGlobalTime+=1/3
  if mod(frames,10) = 0 then
    var tNow=Timer()
    fps = 10/(tNow-tLast)
    windowtitle "fps: " & fps
    tLast=tNow
  end if
wend
