#define lim 100

dim as double m(lim,lim)
m(0,1)=6 'rows
m(1,0)=8 'columns
'm(0,0)is spare

for r as long=1 to 6
    for c as long=1 to 8
        m(r,c)=int(rnd*50)
    next c
next r



dim as double m2(lim,lim)
m2(0,1)=8 'rows
m2(1,0)=3 'columns

for r as long=1 to 8
    for c as long=1 to 3
        m2(r,c)=int(rnd*50)
    next c
next r


Sub matmult(m1() As Double,m2() As Double,ans() As Double)
      Dim rows As Long=m2(0,1)
      Dim columns As Long=m1(1,0)
      If columns<>rows Then Print "Can't do matmult":Return
      Redim ans(lim,lim)
      Dim rxc As Double
      For r As Long=1 To rows
            For c As Long=1 To columns
                  rxc=0
                  For k As Long = 1 To Ubound(m1,2)
                        rxc=rxc+m1(r,k)*m2(k,c)
                  Next k
                  ans(r,c)=rxc
            Next c
      Next r
      ans(0,1)=m1(0,1)
      ans(1,0)=m2(1,0)
End Sub

Sub show(A() As Double)
        For rows As Long=1 To A(0,1)
            For columns As Long=1 To A(1,0)
                  Print A(rows,columns);" ";
            Next
            Print
      Next      
End Sub


dim as double ans()

matmult(m(),m2(),ans())
show(m())
print "Multiply by"
show(m2())
print "Gives"
show(ans())
sleep



 