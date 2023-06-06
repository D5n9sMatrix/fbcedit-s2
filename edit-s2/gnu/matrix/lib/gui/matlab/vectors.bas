


' As I [ dodicat ] suggested before, why not an array of matrices,
' which index themselves by 'their array   position.
' (I use array of matrix 1 to whatever, but 0 to whatever
'  would be OK) 

'  modified for array of vectors .


screen 20
'
'
Type vector
    As Double e(Any)
End Type


declare sub initial_V(v As vector)
declare Sub setsize_V(v As vector,d1 As Long)
declare Sub show_V(v As vector)
declare sub prt2v(v as vector, w as vector)

'
' ----------------------------------------------------------------------
'

Dim As vector v(1 To 5) 'ARRAY OF VECTORS

Dim as	Integer n,nx,i ,j
n=1
nx=8
setsize_V(v(n),nx)
n=2
nx=6
setsize_V(v(n),nx)
'
n=1
initial_V(v(n))
    Print "vector ";n
    show_V(v(n))
    Print
'
n=2
initial_V(v(n))

    Print "vector ";n
    show_V(v(n))
    Print
'
'sleep()

n=2
i=3
j=1
print "v(";n;")(";i;")"
print ( v(n).e(i) )
n=1
i=5
j=3
print "v(";n;")(";i;")"
print ( v(n).e(i) )
print
prt2v(v(1), v(2))
'
sleep()

end
'
' ----------------------------------------------------------------------
'
sub prt2v(v as vector, w as vector)
'
'   print element from different vectors
'
   print "v(2)"
   print ( v.e(2) )
   print "w(3)"
   print ( w.e(3) )

end sub
'
'
Sub setsize_V(v As vector,d1 As Long)
    Redim v.e(1 To d1)
End Sub
'
Sub show_V(v As vector)
'
'
'    
         For n As Long=1 To Ubound(v.e,1)
            Print v.e(n)
        Next n
        Print
    
End Sub
'
sub initial_V(v As vector)

dim as integer ix,lx   
'
'   sequential data for v( , )
' 
    lx=Ubound(v.e,1)
   
     for ix=1 to lx
         v.e(ix)=ix
     next ix
 '
end sub
'
'
