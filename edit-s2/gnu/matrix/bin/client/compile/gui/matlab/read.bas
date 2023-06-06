

'   Matrix math
'
'  1. dim as Matrix a
'  2. redim a.m( x1 to x2 , y1 to y2 )
'
'  3. dim as Matrix z(z1 to z2)  ?
'  4. redim z.m(w1 to w2)  ?
'
'     Matrix(x , y) ~= redim (0 to x-1, 0 to y-1) ?


' These declarations from :
'  http://www.rosettacode.org/wiki/Matrix_multiplication#FreeBASIC
' That content is available under
'  Content is available under GNU Free Documentation License 1.2 unless otherwise noted.
'
'   Using Geany, Build, Set Build Commands
'
'   Compile                fbc -w all "%f" 
'
'   Execute                "./%e" 
'
' Preliminary results checked using Maxima CAS
'
'
type Matrix
    dim as double m( any , any )
    declare constructor ( )
    declare constructor ( byval x as uinteger , byval y as uinteger )
end type
 
constructor Matrix ( )
end constructor
 
constructor Matrix ( byval x as uinteger , byval y as uinteger )
    redim this.m( x - 1 , y - 1 )
end constructor


type Vector
dim as double v( any )
    declare constructor ( )
    declare constructor ( byval x as uinteger )
end type

constructor Vector ( )
end constructor

constructor Vector ( byval x as uinteger )
    redim this.v( x - 1 )
end constructor

'
' ---------------------------- operators -------------------------------
'
declare operator * ( byref a as Matrix , byref b as Matrix ) as Matrix
declare operator * ( byref a as Matrix , byref b as Vector ) as Vector

declare operator - ( byref a as Matrix , byref b as Matrix ) as Matrix
declare operator + ( byref a as Matrix , byref b as Matrix ) as Matrix
declare operator / ( byref a as Matrix , byref b as Matrix ) as Matrix

'   The rest from luxan, sciwiseg@gmail.com
'
'  Probably need to make this content
'  available under GNU Free Documentation License 1.2 
'
'
' ............................. procedures .............................
'
declare sub prt_z(z() as Matrix, idx as Integer)
declare sub prt_m(z as Matrix)
declare sub Vect_x_Matrix(M1 as Matrix, V1 as Vector, V3 as Vector)
declare sub prt_v(z as Vector)


'
' ----------------------------------------------------------------------
'
'    Matrix of matrices
'
dim as Matrix z(1 to 6)
'
'some garbage matrices for demonstration
dim as Matrix a = Matrix(4 , 2)
a.m(0 , 0) = 1 : a.m(0 , 1) = 0
a.m(1 , 0) = 0 : a.m(1 , 1) = 1
a.m(2 , 0) = 2 : a.m(2 , 1) = 3
a.m(3 , 0) = 0.75 : a.m(3 , 1) = -0.5
'
dim as Matrix M1 = Matrix( 3 , 3 )
M1.m(0 , 0) = 1 : M1.m(0 , 1) = 2 : M1.m(0 , 2) = 3 
M1.m(1 , 0) = 4 : M1.m(1 , 1) = 5 : M1.m(1 , 2) = 6
M1.m(2 , 0) = 7 : M1.m(2 , 1) = 8 : M1.m(2 , 2) = 9
'M1.m(3 , 0) = 3.75 : M1.m(3 , 1) = -2.5 : M1.m(3 , 2) = 1.5
'
dim as Matrix M2 = Matrix( 3 , 3 )
M2.m(0 , 0) = 2 : M2.m(0 , 1) = 4 : M2.m(0 , 2) = 6 
M2.m(1 , 0) = 8 : M2.m(1 , 1) = 10 : M2.m(1 , 2) = 12
M2.m(2 , 0) = 3 : M2.m(2 , 1) = 7 : M2.m(2 , 2) = 9
'M2.m(3 , 0) = 5.0 : M2.m(3 , 1) = -0.5 : M2.m(3 , 2) = 2.5
'
'

z(1)=a
z(2)=M1
z(3)=M2
'z(4)=M2
'

print
print("  M1  ")
prt_m(M1)
print("  M2  ")
prt_m(M2)

'  
'prt_z(z() , 2)
'prt_z(z() , 3)

dim as Matrix eg = M1 * M2
print " M1.M2 "
prt_m(eg)

z(4) = z(2) * z(3)
print "  z(2).z(3)  " 
prt_z(z() , 4)

eg = M1 + M2
print " M1 + M2 "
prt_m(eg)

eg = M1 - M2

print " M1 - M2 "
prt_m(eg)
print

redim  M1.m( 3 , 2 )
M1.m(0 , 0) = 1 : M1.m(0 , 1) = 2 : M1.m(0 , 2) = 3 
M1.m(1 , 0) = 4 : M1.m(1 , 1) = 5 : M1.m(1 , 2) = 6
M1.m(2 , 0) = 7 : M1.m(2 , 1) = 8 : M1.m(2 , 2) = 9
M1.m(3 , 0) = 7 : M1.m(3 , 1) = 1 : M1.m(3 , 2) = 3
z(5) = M1

print("  M1  ")
prt_m(M1)
'
dim as Vector V1 = Vector(3)
V1.v(0)=1:V1.v(1)=2:V1.v(2)=3
print(" V1 ")
prt_v(V1)
dim as Vector V3 = Vector(3)
Vect_x_Matrix(M1, V1 , V3 )
print(" M1.V1 ")
prt_v(V3)

dim as Vector V4 = M1 * V1
prt_v(V4)
'
'
prt_z(z() , 2)
prt_z(z() , 5)

end
'
' ====================================================================
'
operator * ( byref a as Matrix , byref b as Matrix ) as Matrix
'  Only applicable to square matrices or arrays.
' This routine from :
'  http://www.rosettacode.org/wiki/Matrix_multiplication#FreeBASIC
'
    dim as Matrix ret
    dim as uinteger i, j, k
    if ubound( a.m , 2 ) = ubound( b.m , 1 ) and ubound( a.m , 1 ) = ubound( b.m , 2 ) then
        redim ret.m( ubound( a.m , 1 ) , ubound( b.m , 2 ) )
        for i = 0 to ubound( a.m , 1 )
            for j = 0 to ubound( b.m , 2 )
                for k = 0 to ubound( b.m , 1 )
                    ret.m( i , j ) += a.m( i , k ) * b.m( k , j )
                next k
            next j
        next i
    end if
    return ret
end operator
'
'
operator * ( byref a as Matrix , byref b as Vector ) as Vector
'
'   Vector multiplied by a matrix, maybe correct .
'
'
   dim as Vector ret
   dim as uinteger i, j, k
   if ubound( a.m , 2 ) = ubound( b.v , 1 )  then
        redim ret.v( ubound( a.m , 1 ) )
        for i = 0 to ubound( a.m , 1 )
            
                for k = 0 to ubound( b.v , 1 )
                    ret.v( i ) += a.m( i , k ) * b.v( k  )
                next k
            
        next i
    end if   
   return ret
end operator
'
operator - ( byref a as Matrix , byref b as Matrix ) as Matrix
    dim as Matrix ret
    dim as uinteger i, j, k
    if ubound( a.m , 2 ) = ubound( b.m , 1 ) and ubound( a.m , 1 ) = ubound( b.m , 2 ) then
        redim ret.m( ubound( a.m , 1 ) , ubound( b.m , 2 ) )
        for i = 0 to ubound( a.m , 1 )
            for j = 0 to ubound( b.m , 2 )
                ret.m( i , j ) = a.m( i , j ) - b.m( i , j )
            next j
        next i
    end if
    return ret
end operator
 '
operator + ( byref a as Matrix , byref b as Matrix ) as Matrix
    dim as Matrix ret
    dim as uinteger i, j, k
    if ubound( a.m , 2 ) = ubound( b.m , 1 ) and ubound( a.m , 1 ) = ubound( b.m , 2 ) then
        redim ret.m( ubound( a.m , 1 ) , ubound( b.m , 2 ) )
        for i = 0 to ubound( a.m , 1 )
            for j = 0 to ubound( b.m , 2 )
               ret.m( i , j ) = a.m( i , j ) + b.m( i , j )
            next j
        next i
    end if
    return ret
end operator
'
operator / ( byref a as Matrix , byref b as Matrix ) as Matrix
    dim as Matrix ret
    dim as uinteger i, j, k
    dim as double x, y, z
    if ubound( a.m , 2 ) = ubound( b.m , 1 ) and ubound( a.m , 1 ) = ubound( b.m , 2 ) then
        redim ret.m( ubound( a.m , 1 ) , ubound( b.m , 2 ) )
        for i = 0 to ubound( a.m , 1 )
            for j = 0 to ubound( b.m , 2 )
                x = a.m( i , j )
                y = b.m( i , j )
                y = sgn(x)*10^32 ' assume y = 0
             if y <> 0 then z = x/y
                ret.m( i , j ) = z
            next j
        next i
    end if
    return ret
end operator
'
' ......................................................................
'
sub prt_z(z() as Matrix, idx as Integer)
'
'     Matrix of Matrix, index and print .
'
dim as integer i,j
'
'print
for i=0 to ubound(z(idx).m,1)
  for j=0 to ubound(z(idx).m,2)  
    print z(idx).m(i,j);" ";
  next j
  print
next i
print
'  
end sub
'
' ......................................................................
'
sub prt_m(z as Matrix)
'
'  Print elements from rectangular matrix .
'
dim as integer i,j
'

print
print ubound(z.m,1);" ";ubound(z.m,2)
print
for i=0 to ubound(z.m,1)
  for j=0 to ubound(z.m,2)  
    print z.m(i,j);" ";
  next j
  print
next i
print
'  
end sub
'
' ......................................................................
'
sub prt_v(z as Vector)
'
'  Print elements from vector .
'
dim as integer i
'
'print
for i=0 to ubound(z.v,1)
    
    print z.v(i);" ";
  
  
next i
print
print
'  
end sub
'
' ......................................................................
'
sub Vect_x_Matrix(M1 as Matrix, V1 as Vector, V3 as Vector)
'
'     Multiply vector by matrix .
'
dim as integer i,j,k,ub1, ub2,vb1
dim as single x,y,s
    'vb1=ubound(M1.m,1)
    ub1=ubound(M1.m,1)
    ub2=ubound(M1.m,2)
'    
    redim V3.v(0 to ub2+1)
'
        for j=0 to ub2+1
             s=0
         for i=0 to ub1
             x=V1.v(i)
             y=M1.m(j,i)
             s=s+x*y
         next i
          V3.v(j)=s
      next j
 '
end sub
'
' ......................................................................
'


