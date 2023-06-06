 
Dim Shared As boolean ExtremePivot
const decplaces=6
ExtremePivot=true

#define roundresult(x,N) rtrim(rtrim(left(str((x)+(.5*sgn((x)))/(10^(N))),instr(str((x)+(.5*sgn((x)))/(10^(N))),".")+(N)),"0"),".")
#define Cround(x,N) iif(roundresult(x,N)="","0",roundresult(x,N))
Type vector
      Dim As Double element(Any)
      Declare Operator Cast() As String
End Type

Type matrix 
      Dim As Double element(Any,Any)
      Declare Operator Cast() As String
      Declare Function inverse() As matrix
      Declare Function GaussJordan(As vector) As vector
      Declare Function determinant() As Double
      Declare Function transpose() As matrix
      Declare Function unit(r As Long) As matrix
      Declare Constructor(As Long,As Long)
      declare constructor
      Declare Function vandermonde(() As Double) As matrix
      declare sub set(as long,as long,as double)
End Type

sub matrix.set(r as long,c as long,x as double)
this.element(r,c)=x
end sub

constructor matrix
end constructor

Constructor matrix (r As Long,c As Long)
Redim element(1 To r,1 To c)
End Constructor

Function matrix.unit(r As Long) As matrix
      Dim As matrix m=Type(r,r)
      For z As Long=1 To r
            m.element(z,z)=1
      Next
      Return m
End Function


Operator vector.cast() As String 'for printing
Dim As String ans
ans= "Solution:"+Chr(10)
For n As Integer=1 To Ubound(this.element)
      ans=ans+ Str(Cround(element(n),decplaces))+Chr(10)
Next n
Operator =ans
End Operator

Operator matrix.cast() As String 'for printing
Dim As String ans,comma

#define gap(x) string(2*decplaces-len(x)," ")
For a As Integer=1 To Ubound(this.element,1)
      For b As Integer=1 To Ubound(this.element,2)
         if b=1 then ans+="["
            If b=Ubound(this.element,2) Then comma="" Else comma=","
            Var q=Str(Cround(element(a,b),decplaces))
            ans=ans+q+comma'+gap(q)
            if b=Ubound(this.element,2) then ans+="]"
      Next b
      ans=ans+Chr(10)
Next a

Operator= ans
End Operator

Function matrix.transpose() As matrix
      Dim As matrix b
      Redim b.element(1 To Ubound(this.element,2),1 To Ubound(this.element,1))
      For i As Long=1 To Ubound(this.element,1)
            For j As Long=1 To Ubound(this.element,2) 
                  b.element(j,i)=this.element(i,j)
            Next
      Next
      Return b
End Function

Operator *(m1 As matrix,m2 As matrix) As matrix
Dim rows As Integer=Ubound(m1.element,1)
Dim columns As Integer=Ubound(m2.element,2)
If Ubound(m1.element,2)<>Ubound(m2.element,1) Then
      Print "Can't do multiply"
      Exit Operator
End If
Dim As matrix ans
Redim ans.element(rows,columns)
Dim rxc As Double
For r As Integer=1 To rows
      For c As Integer=1 To columns
            rxc=0
            For k As Integer = 1 To Ubound(m1.element,2)
                  rxc=rxc+m1.element(r,k)*m2.element(k,c)
            Next k
            ans.element(r,c)=rxc
      Next c
Next r
Operator= ans
End Operator

Operator *(m1 As matrix,m2 As vector) As vector
Dim rows As Integer=Ubound(m1.element,1)
Dim columns As Integer=Ubound(m2.element,2)
If Ubound(m1.element,2)<>Ubound(m2.element) Then
      Print "Can't do multiply"
      Exit Operator
End If
Dim As vector ans
Redim ans.element(rows)
Dim rxc As Double
For r As Integer=1 To rows
      rxc=0
      For k As Integer = 1 To Ubound(m1.element,2)
            rxc=rxc+m1.element(r,k)*m2.element(k)
      Next k
      ans.element(r)=rxc
Next r
Operator= ans
End Operator

Operator +(m1 As matrix,m2 As matrix) As matrix
Dim rows As Integer=Ubound(m1.element,1)
Dim columns As Integer=Ubound(m2.element,2)
If Ubound(m1.element,1)<>Ubound(m2.element,1) or Ubound(m1.element,2)<>Ubound(m2.element,2) Then
      Print "Can't do plus"
      Exit Operator
End If
Dim As matrix ans
Redim ans.element(rows,columns)
Dim rxc As Double
For r As Integer=1 To rows
      For c As Integer=1 To columns
            ans.element(r,c)=m1.element(r,c)+m2.element(r,c)
      Next c
Next r
Operator= ans
End Operator

Operator -(m1 As matrix,m2 As matrix) As matrix
Dim rows As Integer=Ubound(m1.element,1)
Dim columns As Integer=Ubound(m2.element,2)
If Ubound(m1.element,1)<>Ubound(m2.element,1) or Ubound(m1.element,2)<>Ubound(m2.element,2) Then
      Print "Can't do minus"
      Exit Operator
End If
Dim As matrix ans
Redim ans.element(rows,columns)
Dim rxc As Double
For r As Integer=1 To rows
      For c As Integer=1 To columns
            ans.element(r,c)=m1.element(r,c)-m2.element(r,c)
      Next c
Next r
Operator= ans
End Operator


Function matrix.GaussJordan(rhs As vector) As vector
      Dim As Integer n=Ubound(rhs.element)
      Dim As vector ans=rhs,r=rhs
      Dim As matrix b=This
      #macro pivot(num)
      For p1 As Integer  = num To n - 1
            For p2 As Integer  = p1 + 1 To n  
                  If Abs(b.element(p1,num))<Abs(b.element(p2,num)) Then
                        Swap r.element(p1),r.element(p2)
                        For g As Integer=1 To n
                              Swap b.element(p1,g),b.element(p2,g)
                        Next g
                  End If
            Next p2
      Next p1
      #endmacro
      If ExtremePivot=false Then :pivot(1): End If
      For k As Integer=1 To n-1
            If ExtremePivot=true Then: pivot(k) :End If             
            For row As Integer =k To n-1
                  If b.element(row+1,k)=0 Then Exit For
                  Var f=b.element(k,k)/b.element(row+1,k)
                  r.element(row+1)=r.element(row+1)*f-r.element(k)
                  For g As Integer=1 To n
                        b.element((row+1),g)=b.element((row+1),g)*f-b.element(k,g)
                  Next g
            Next row
      Next k
      'back substitute 
      For z As Integer=n To 1 Step -1
            ans.element(z)=r.element(z)/b.element(z,z)
            For j As Integer = n To z+1 Step -1
                  ans.element(z)=ans.element(z)-(b.element(z,j)*ans.element(j)/b.element(z,z))
            Next j
      Next    z
      Function = ans
End Function

Function matrix.inverse() As matrix
    If Ubound(element,1)<>Ubound(element,2)  Then
      Print "Can't do inverse"
      return unit(0)
      end if
      Var ub1=Ubound(this.element,1),ub2=Ubound(this.element,2)
      Dim As matrix ans
      Dim As vector temp,null_
      Redim temp.element(1 To ub1):Redim null_.element(1 To ub1)
      Redim ans.element(1 To ub1,1 To ub2)
      For a As Integer=1 To ub1
            temp=null_
            temp.element(a)=1
            temp=GaussJordan(temp)
            For b As Integer=1 To ub1
                  ans.element(b,a)=temp.element(b)
            Next b
      Next a
      Return ans
End Function

Function matrix.determinant() As Double
    If Ubound(element,1)<>Ubound(element,2)  Then
      Print "Can't do determinant"
      Exit function
      end if
      Dim As Integer n=Ubound(this.element,1),sign=1
      Dim As Double det=1,s=1
      
      Dim As Double b(1 To n,1 To n)
      For c As Integer=1 To n
            For d As Integer=1 To n
                  b(c,d)=this.element(c,d)
            Next d
      Next c
      #macro pivot(num)
      For p1 As Integer  = num To n - 1
            For p2 As Integer  = p1 + 1 To n  
                  If Abs(b(p1,num))<Abs(b(p2,num)) Then
                        sign=-sign
                        For g As Integer=1 To n
                              Swap b(p1,g),b(p2,g)
                        Next g
                  End If
            Next p2
      Next p1
      #endmacro
      If ExtremePivot=false Then :pivot(1): End If
      For k As Integer=1 To n-1
            If ExtremePivot =true Then: pivot(k) :End If      
            For row As Integer =k To n-1
                  If b(row+1,k)=0 Then Exit For
                  Var f=b(k,k)/b(row+1,k)
                  s=s*f
                  For g As Integer=1 To n
                        'divide by f here seems ok
                        b((row+1),g)=(b((row+1),g)*f-b(k,g))/f
                  Next g
            Next row
      Next k
      For z As Integer=1 To n
            det=det*b(z,z)
      Next z
      Return sign*det
End Function

Sub Interpolate(x_values() As Double,y_values() As Double,p() As Double)
      Var n=Ubound(x_values)
      Dim As matrix Mat
      Redim mat.element(1 To n,1 To n)
      Dim As vector rhs,ans
      Redim rhs.element(1 To n)
      Redim ans.element(1 To n)
      Redim p(0):Redim p(1 To n)
      For a As Integer=1 To n
            rhs.element(a)=y_values(a)
            For b As Integer=1 To n
                  mat.element(a,b)=x_values(a)^(b-1)
            Next b
      Next a
      'Solve the linear equations
      ans=mat.GaussJordan(rhs)
      For z As Integer=1 To n:p(z)=ans.element(z):Next
      End Sub
      
      
      Sub setmatrix(m As matrix,d() As Double)
            m=Type(Ubound(d,1),Ubound(d,2))
            For n1 As Long=1 To Ubound(d,1)
                  For n2 As Long=1 To Ubound(d,2)
                        m.element(n1,n2)=d(n1,n2)
                  Next
            Next
      End Sub
      'vandermode of x
      Function vandermonde(x_values() As Double,w As Long) As matrix
            Dim As matrix mat
            Var n=Ubound(x_values)
            Redim mat.element(1 To n,1 To w)
            For a As Integer=1 To n
                  For b As Integer=1 To w
                        mat.element(a,b)=x_values(a)^(b-1)
                  Next b
            Next a
            Return mat
      End Function
      
      
      Sub regress(x_values() As Double,y_values() As Double,ans() As Double,n As Long)
            Redim ans(1 To Ubound(x_values))
            Dim As matrix m1= vandermonde(x_values(),n)
            Dim As matrix T=m1.transpose
            Dim As vector y 
            Redim y.element(1 To Ubound(ans))
            For n As Long=1 To Ubound(y_values)
                  y.element(n)=y_values(n)
            Next n
            Dim As vector result=(((T*m1).inverse)*T)*y
            Redim Preserve ans(1 To n)
            For n As Long=1 To Ubound(ans)
                  ans(n)=result.element(n)
            Next n
      End Sub
      
      'Evaluate a polynomial at x
      Function polyeval(Coefficients() As Double,Byval x As Double) As Double
            Dim As Double acc
            For i As Long=Ubound(Coefficients) To Lbound(Coefficients) Step -1
                  acc=acc*x+Coefficients(i)
            Next i
            Return acc
      End Function
      '=========== SET UP A SYSTEM ======================
      
     '=========== SET UP A SYSTEM ======================

      
      Dim As Double d1(1 To 5,1 To 3)={ {1,2,3},_
                                        {4,5,6}, _
                                        {7,8,9}, _
                                        {7,1,3}, _
                                        {5,1,2} }
      Dim As matrix a1,a2
      setmatrix(a1,d1())
      print "matrix 1"
      Print a1
      
      Dim As Double d2(1 To 3,1 To 1)={ {1}, _
                                        {2}, _
                                        {3}}
                                      
                                
      setmatrix(a2,d2())
       print "matrix 2"
      print a2
      print "matrix 1  * matrix 2"
      print a1*a2
      print "----------------------------"
       Dim As Double d3(1 To 1,1 To 3)={ {1,2,3} }
       setmatrix(a1,d3())
       print "matrix 1"
       print a2
       print "matrix 2"
       print a1
       
       print "matrix 1 * matrix 2"
       print a2*a1
       print "matrix 2 * matrix 1"
       print a1*a2
      
      sleep 
 