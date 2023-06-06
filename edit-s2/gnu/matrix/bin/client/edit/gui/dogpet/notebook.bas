
#include "windows.bi"

Function getSystemCPUTime(Byref totalTime  As Ulongint, Byref idleTime As Ulongint)As boolean
    Dim As FILETIME ftSysIdle, ftSysKernel, ftSysUser
    If (GetSystemTimes(@ftSysIdle, @ftSysKernel, @ftSysUser))=0 Then Return false
    Dim As  ULARGE_INTEGER sysKernel, sysUser, sysIdle
    sysKernel.HighPart = ftSysKernel.dwHighDateTime
    sysKernel.LowPart = ftSysKernel.dwLowDateTime
    sysUser.HighPart = ftSysUser.dwHighDateTime
    sysUser.LowPart = ftSysUser.dwLowDateTime
    sysIdle.HighPart = ftSysIdle.dwHighDateTime
    sysIdle.LowPart = ftSysIdle.dwLowDateTime
    totalTime = sysKernel.QuadPart + sysUser.QuadPart
    idleTime = sysIdle.QuadPart
    Return true
End Function

Function pipeout(Byval s As String="") Byref As String
    Var f=Freefile
    Dim As String tmp
    Open Pipe s For Input As #f
    s=""
    Do Until Eof(f)
        Line Input #f,tmp
        s+=tmp+Chr(10)
    Loop
    Close #f
    Return s
End Function

Function map(a As Double,b As Double,x As Double,c As Double,d As Double) As Double
    Return (d-c)*(x-a)/(b-a)+c
End Function

Sub Line_To(x1 As Long,y1 As Long,x2 As Long,y2 As Long,d As Single,Byref x As Long=0,Byref y As Long=0,i As Any Ptr=0)
    x=x1+(x2-x1)*d
    y=y1+(y2-y1)*d
End Sub

Sub thick_line(x1 As Long,y1 As Long,x2 As Long,y2 As Long,thickness As Single, colour As Ulong,im As Any Ptr=0)
    If thickness<2 Then
        Line im,(x1,y1)-(x2,y2),colour
    Else
        Var h=Sqr((x2-x1)^2+(y2-y1)^2)
        If h=0 Then h=1e-6
        Var s=(y1-y2)/h
        Var c=(x2-x1)/h
        Line im,(x1+s*thickness/2,y1+c*thickness/2)-(x2+s*thickness/2,y2+c*thickness/2),colour
        Line im,(x1-s*thickness/2,y1-c*thickness/2)-(x2-s*thickness/2,y2-c*thickness/2),colour
        Line im,(x1+s*thickness/2,y1+c*thickness/2)-(x1-s*thickness/2,y1-c*thickness/2),colour
        Line im,(x2+s*thickness/2,y2+c*thickness/2)-(x2-s*thickness/2,y2-c*thickness/2),colour
        Paint im,((x1+x2)/2, (y1+y2)/2), colour, colour
    End If
End Sub

Sub drawline(x As Long,y As Long,angle As Single,lngth As Double,Byref x2 As Long=0,Byref y2 As Long=0)
    angle=angle*Atn(1)/45
    x2=x+lngth*Cos(angle)
    y2=y-lngth*Sin(angle)
End Sub

Sub digits(t As String,x As Long,y As Long,clr As Ulong,sz As Single,gap As Long=1,img As Any Pointer=0)
    x=x-2*sz
    Dim As Single s=Any,c=Any
    Dim As Single  d =Iif(gap, sz/10,0)
    #macro thickline(x1,y1,x2,y2)
    s=(y1-y2)/10
    c=(x2-x1)/10
    Line img,(x1-s,y1-c)-(x2+s,y2+c),clr,bf
    #endmacro
    #macro display(_a,_b,_c,_d,_e,_f,_g)
    x=x+2*sz
    If _a=1 Then :thickline(x+d,y,(x-d+sz),y):End If
    If _b=1 Then :thickline((x+sz),y+d,(x+sz),(y-d+sz)):End If
    If _c=1 Then :thickline((x+sz),(y+d+sz),(x+sz),(y-d+2*sz)):End If
    If _d=1 Then :thickline((x-d+sz),(y+2*sz),x+d,(y+2*sz)):End If ''
    If _e=1 Then :thickline(x,(y-d+2*sz),x,(y+d+sz)):End If
    If _f=1 Then :thickline(x,(y-d+sz),x,y+d):End If
    If _g=1 Then :thickline(x+d,(y+sz),(x-d+sz),(y+sz)):End If
    #endmacro
    For z As Long=0 To Len(t)-1
        Select Case As Const t[z]
        Case 48 :display(1,1,1,1,1,1,0)             '"0"
        Case 49 :display(0,1,1,0,0,0,0)             '"1"
        Case 50 :display(1,1,0,1,1,0,1)             '"2"
        Case 51 :display(1,1,1,1,0,0,1)             '"3"
        Case 52 :display(0,1,1,0,0,1,1)             '"4"
        Case 53 :display(1,0,1,1,0,1,1)             '"5"
        Case 54 :display(1,0,1,1,1,1,1)             '"6"
        Case 55 :display(1,1,1,0,0,0,0)             '"7"
        Case 56 :display(1,1,1,1,1,1,1)             '"8"
        Case 57 :display(1,1,1,1,0,1,1)            '"9"
        Case 58                                     '":"
            Circle img,((x+2*sz),(y+sz/2)),(sz/5),clr,,,,f
            Circle img,((x+2*sz),(y+1.5*sz)),(sz/5),clr,,,,f
            x=x+sz
        Case 45 :display(0,0,0,0,0,0,1)              '"-"
        Case 46                                      '"."
            Circle img,((x+2*sz),(y+1.9*sz)),(sz/5),clr,,,,f
            x=x+sz
        Case 32                                      '" "
            x=x+sz
        End Select
    Next z
End Sub

Sub createdial(i As Any Ptr)
    Circle i,(400,300),265,Rgb(110,110,110),,,,f
    Circle i,(273,443),2,0,,,,f
    Circle i,(524,439),2,0,,,,f
    Dim As Any Ptr i2=Imagecreate(30,30,Rgb(110,110,110))
    thick_line(5,25,25,5,3,Rgb(200,200,200),i2)
    Circle i2,(15-4,5),3,Rgb(200,200,200)
    Circle i2,(15+4,25),3,Rgb(200,200,200)
    Put i,(435-10,345),i2,Pset
    Dim As Long a,b,x,y
    Var z=6
    For n As Single=-40-z To 220+z Step 1.7
        Dim As Long k=map(-40-z,220+z,n,100,0)
        If k Mod 10=0 Then
            drawline(400,300,n,220,a,b)
            Line_To(a,b,400,300,.2,x,y)
            Line i,(a,b)-(x,y),Rgb(0,0,0)
            Line_To(a,b,400,300,-.1,x,y)
            digits(Str(Int(k)),x-8-2,y-5,Rgb(255,255,255),6,0,i)
        End If
        If k Mod 5=0 And n Mod 10<>0  Then
            drawline(400,300,n,220,a,b)
            Line_To(a,b,400,300,.05,x,y)
            Line i,(a,b)-(x,y),Rgb(0,0,0)
        End If
    Next n
    Imagedestroy i2
End Sub

Sub rotateimage(Byref dest As Any Ptr=0,im As Any Ptr,angle As Single,shiftx As Long=0,shifty As Long=0,sc As Single=1,miss As Ulong=Rgb(255,0,255),fixedpivot As boolean=false)
    Static As Integer pitch,pitchs,xres,yres,runflag
    Static As Any Ptr row,rows
    Static As Integer ddx,ddy,resultx,resulty
    Imageinfo im,ddx,ddy,,pitch,row
    If dest=0 Then
    Screeninfo xres,yres,,,pitchS
    rowS=Screenptr
    Else
    If sc<>1 Then
        Dim As Integer x,y
        Imageinfo dest,x,y
        Imagedestroy dest:dest=0: dest=Imagecreate(x*sc,y*sc)
    End If
    Imageinfo dest, xres,yres,,pitchS,rows
    End If
    Dim As Long centreX=ddx\2,centreY=ddy\2
    Dim As Single sx=Sin(angle)
    Dim As Single cx=Cos(angle)
    Dim As Long mx=Iif(ddx>=ddy,ddx,ddy),shftx,shfty
    Var fx=sc*.7071067811865476,sc2=1/sc
    If fixedpivot=false Then
        shiftx+=centreX*sc-centrex
        shiftY+=centrey*sc-centrey
    End If
    For y As Long=centrey-fx*mx+1 To centrey+ fx*mx
        Dim As Single sxcy=Sx*(y-centrey),cxcy=Cx*(y-centrey)
        shfty=y+shifty
        For x As Long=centrex-mx*fx To centrex+mx*fx
            If x+shiftx >=0 Then 'on the screen
                If x+shiftx <xres Then
                    If shfty >=0 Then
                        If shfty<yres Then
                            resultx=sc2*(Cx*(x-centrex)-Sxcy) +centrex:resulty=sc2*(Sx*(x-centrex)+Cxcy) +centrey
                            If resultx >=0 Then 'on the image
                                If resultx<ddx Then
                                    If resulty>=0 Then
                                        If resulty<ddy Then
                                            Dim As Ulong u=*Cast(Ulong Ptr,row+pitch*((resultY))+((resultX)) Shl 2 ) 'point(image)
                                            If u<>miss Then *Cast(Ulong Ptr,rowS+pitchS*(y+shifty)+(x+shiftx) Shl 2)= u 'pset (screen)
                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If
                End If
            End If
        Next x
    Next y
End Sub

Function odometer(v As Long) As Long
    Const pi=4*Atn(1)
    Static As Long s=0
    Static As Any Ptr tmp,hnd
    If tmp=0 Then tmp=Imagecreate(1600,100,Rgb(255,255,255))
    If hnd=0 Then
        hnd=Imagecreate(400,20)
        Var dx=20
        thick_line(dx+5,10,220,10,2,Rgb(200,200,219),hnd)
        Line hnd,(dx,10)-(15+dx,0),Rgb(200,00,00)
        Line hnd,(dx,10)-(15+dx,20),Rgb(200,00,00)
        Line hnd,(15+dx,0)-(15+dx,20),Rgb(200,00,00)
        Paint hnd,(10+dx,10),Rgb(200,00,00),Rgb(200,00,00)
        circle hnd,(230,10),10,rgb(200,200,200),,,.9,f
    End If
    Static As Any Ptr strip
    If strip=0 Then
        strip=Imagecreate(1600,100,Rgb(255,255,255))
        For n As Long=10 To 90 Step 10
            Line strip,(0,n)-(1600,n),Rgb(220,220,220)
        Next n
    End If
    Dim As Long w,h,ctrx,ctry
    Imageinfo hnd,w,h
    ctrx=400-w/2
    ctry=300-h/2
    Dim As Double k=map(100,0,v,-46,226)
    rotateimage(,hnd,k*0.0174533-pi,ctrx,ctry,1,,0)
    Circle(400,300),2,Rgb(0,0,0),,,,f
    digits(Right("000"+Str((v))+"%",4),380-10,350,Rgb(200,200,200),10)
    Var ypos=map(0,100,v,99,0)
    If s>=800 Then
        Get strip,(800,0)-(1600-1,100-1),tmp
        Line strip,(0,0)-(1600,100),Rgb(255,255,255),bf
        For n As Long=10 To 90 Step 10
            Line strip,(0,n)-(1600,n),Rgb(220,220,220)
        Next n
        Put strip,(0,0),tmp,Pset
        s=0
    End If
    thick_line(800+s,100,800+s,ypos,3,Rgb(150,150,150),strip)
    Put (0-s,600),strip,Pset
    s+=5
    For n As Long=10 To 90 Step 10
        digits(Str(n),5,700-n-3,Rgb(0,0,0),3,1)
    Next n
    Return v
End Function

Sub Remove(Text As String,Char As String)
    Var index = 0,asci=Asc(char)
    For i As Integer = 0 To Len(Text) - 1
        If Text[i] <> asci Then Text[index] = Text[i] : index =index+ 1
    Next : Text = Left(Text,index)
End Sub

Sub title()
    Dim As String g
    Var s=pipeout("wmic cpu get maxclockspeed")
    remove(s,Chr(10))
    g+=s
    s=pipeout("wmic cpu get numberofcores")
    remove(s,Chr(10))
    Screenres 800,700,32
    Color ,Rgb(170,170,170)
    Width 800\8,700\14
    Windowtitle g+s+" Close window to finish"
End Sub

Function GetCPU() As Long
    title()
    Static As Any Ptr im
    If im=0 Then
        im=Imagecreate(800,700,Rgb(170,170,170))
        createdial(im)
    End If
    Dim As Ulong interval = 1000
    Dim As ULONGLONG totalPrev = 0, totalCurr = 0
    Dim As ULONGLONG idlePrev = 0, idleCurr = 0
    Dim As ULONGLONG tmp
    Dim As String key
    Dim As Ulong totalCPUUsage = 0
    Dim As Long result = getSystemCPUTime(totalPrev, idlePrev)
    While true
        Sleep(interval)

        key=Inkey
        If (getSystemCPUTime(totalCurr, idleCurr)) Then
            Dim As  LONGLONG total = totalCurr - totalPrev
            If (total > 0) Then
                Dim As  LONGLONG idle = idleCurr - idlePrev
                totalCPUUsage = (100 * (total - idle) / (total))
                Screenlock
                Put(0,0),im,Pset
                odometer(totalCPUUsage)
                Screenunlock
                If key=Chr(27) Or key=Chr(255)+"k" Then Return 0
            End If
            totalPrev = totalCurr
            idlePrev = idleCurr
        End If
    Wend
    Return 0
End Function


End GetCPU()
