

screen 20
Type matrix
    As Double e(Any,Any)
End Type


Sub setsize(m As matrix,d1 As Long,d2 As Long)
    Redim m.e(1 To d1,1 To d2)
End Sub

Sub show(z As matrix)
    For n As Long=1 To Ubound(z.e,1)
        For m As Long=1 To Ubound(z.e,2)
            Print z.e(n,m);" ";
        Next m
        Print
    Next n
End Sub

Dim As matrix z(1 To 5) 'ARRAY OF MATRICES

Dim as	Integer n,nx,ny
n=1
nx=8
ny=6
setsize(z(n),nx,ny)
n=2
nx=6
ny=3
setsize(z(n),nx,ny)
'
n=1
    Print "matrix ";n
    show(z(n))
    Print
'
n=2
    Print "matrix ";n
    show(z(n))
    Print
'
sleep()



end


