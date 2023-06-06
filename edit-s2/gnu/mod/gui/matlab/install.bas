Dim Shared As boolean ExtremePivot
const decplaces=20
ExtremePivot=true

#define roundresult(x,N) rtrim(rtrim(left(str((x)+(.5*sgn((x)))/(10^(N))),instr(str((x)+(.5*sgn((x)))/(10^(N))),".")+(N)),"0"),".")
#define Cround(x,N) iif(roundresult(x,N)="","0",roundresult(x,N))
'don't use cround here
Function determinant(matrix() As Double) As Double
      Dim As Long n=Ubound(matrix,1),sign=1
      Dim As Double det=1,s=1
      Dim As Double b(1 To n,1 To n)
      For c As Long=1 To n
            For d As Long=1 To n
                  b(c,d)=matrix(c,d)
            Next d
      Next c
      #macro pivot(num)
      For p1 As Long  = num To n - 1
            For p2 As Long  = p1 + 1 To n  
                  If Abs(b(p1,num))<Abs(b(p2,num)) Then
                        sign=-sign
                        For g As Long=1 To n
                              Swap b(p1,g),b(p2,g)
                        Next g
                  End If
            Next p2
      Next p1
      #endmacro
      If ExtremePivot=false Then :pivot(1): End If
      For k As Long=1 To n-1
            If ExtremePivot=true Then: pivot(k) :End If     
            For row As Long =k To n-1
                  If b(row+1,k)=0 Then Exit For
                  Var f=b(k,k)/b(row+1,k)
                  s=s*f
                  For g As Long=1 To n
                        b((row+1),g)=(b((row+1),g)*f-b(k,g))/f
                  Next g
            Next row
      Next k
      For z As Long=1 To n
            det=det*b(z,z)
      Next z
      Return sign*det
End Function

'CRAMER COLUMN SWAPS
Sub swapcolumn(m() As Double,c() As Double,_new() As Double,column As Long)
      Redim _new(1 To Ubound(m,1),1 To Ubound(m,1))
      For x As Long=1 To Ubound(m,1)
            For y As Long=1 To Ubound(m,1)
                  _new(x,y)=m(x,y)
            Next y
      Next x
      For z As Long=1 To Ubound(m,1)
            _new(z,column)=c(z,1)
      Next z
End Sub

Sub solve(mat() As Double,rhs() As Double,_out() As Double)
      If Ubound(mat,1) <> Ubound(rhs,1) Then  Print "Can't do solve":Return
      Redim _out(Lbound(mat,1) To Ubound(mat,1),1 To 1)
      Redim As Double result(Lbound(mat,1) To Ubound(mat,1),Lbound(mat,1) To Ubound(mat,1))
      Dim As Double maindeterminant=determinant(mat())
      If Abs(maindeterminant) < 1e-12 Then Print "singular":Return 
      For column As Long=1 To Ubound(mat,1)
            swapcolumn(mat(),rhs(),result(),column)
            _out(column,1)= determinant(result())/maindeterminant
      Next
End Sub

Sub matmult(m1() As Double,m2() As Double,ans() As Double)
      Dim rows As Long=Ubound(m1,1)
      Dim columns As Long=Ubound(m2,2)
      If Ubound(m1,2)<>Ubound(m2,1) Then Print "Can't do matmult":Return
      Redim ans(1 To rows,1 To columns)
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
End Sub


Sub show(A() As Double)
        For n As Long=1 To Ubound(A,1)
            For m As Long=1 To Ubound(A,2)
                 ' Print Cround(A(n,m),decplaces);" ";
                  Print A(n,m);" ";
            Next
            Print
      Next      
      End Sub


Dim As Double MainMat(1 To ...,1 To ...)={{2,-1,5,1}, _
                                          {3,2,2,-6}, _
                                          {1,3,3,-1}, _
                                          {5,-2,-3,3}}


Dim As Double rhs(1 To ...,1 To 1)= {{-3}, _
                                    {-32}, _
                                    {-47}, _
                                    {49}}
                                   

Print "Main matrix"
show(MainMat())
Print "Right hand side vector"
show(rhs())

Redim ans() As Double
solve(MainMat(),rhs(),ans())
Print "Solution Main Matrix * (something) = Right hand side vector"
show(ans())

Print
Redim As Double res()
matmult(MainMat(),ans(),res())
Print "Check the right hand side vector is returned"
print "i.e. Matrix * (solution) = Right hand side vector"
show(res())
Print
Dim As Double d1(1 To 3,1 To 5)={ {2,7,9,0,1},_
                                  {0,7,-6,2,7}, _
                                  {9,9,1,-5,2}}
                                        
Dim As Double d2(1 To 5,1 To 3)={ {2,7,9},_
                                  {0,7,-6}, _
                                  {9,9,1}, _
                                  {0,9,0}, _
                                  {6,7,7} }
Print "Matrix 1"
show(d1())
Print "Matrix 2"
show(d2())
print
Redim As Double product()
matmult(d1(),d2(),product())
Print "Product Matrix 1 x Matrix 2"
show(product())
print
Print
erase(product)
matmult(d2(),d1(),product())
Print "Product Matrix 2 x Matrix 1"
show(product())
Print 
Dim As Double a(1 To ...,1 To 1)= {{-3}, _
                                   {-32}, _
                                   {-47.5}, _
                                   {49}, _
                                   {-5.5}, _
                                   {-1}, _
                                   {10}}
Print "matrix a"
show(a())
Print
Dim As Double b(1 To 1,1 To ...)= {{-2,-7.7,21.1,2,0,6,5}}
Print "matrix b"
 show(b())
 Print
 Redim As Double c()
 matmult(a(),b(),c())
 Print "a*b"
 show(c())
 Print
 erase(c)
 matmult(b(),a(),c())
 Print "b*a"
 show(c())
 
Sleep

 