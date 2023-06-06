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
randomize
do
For n As Long=Lbound(z) To Ubound(z)
    setsize(z(n),2+Rnd*4,2+Rnd*4)
Next

For n As Long =Lbound(z) To Ubound(z)
    Print "matrix ";n
    show(z(n))
    Print
Next


For n As Long=Lbound(z) To Ubound(z)-1
    For m As Long=n+1 To Ubound(z)
        If Ubound(z(n).e,2)<>Ubound(z(m).e,1) Then
            color 3
            Print "matrix ";n;" and ";"matrix ";m; " won't multiply"
        Else
            color 15
            Print "matrix ";n;" and ";"matrix ";m; " will  multiply" 
        End If
    Next
Next
color 15

print "Press a key or escape"
sleep
cls
loop until inkey=chr(27)

 