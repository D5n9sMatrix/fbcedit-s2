const decplaces=3
#define gap(x) string(5*decplaces-len(x)," ")

#define roundresult(x,N) rtrim(rtrim(left(str((x)+(.5*sgn((x)))/(10^(N))),instr(str((x)+(.5*sgn((x)))/(10^(N))),".")+(N)),"0"),".")
#define Cround(x,N) iif(roundresult(x,N)="","0",roundresult(x,N))
Type matrix 
      Dim As Double element(Any,Any)
      Declare Operator Cast() As String
      Declare Constructor(As Long,As Long)
      declare constructor
      declare sub set(as long,as long,as double)
      declare operator +=(as matrix) 
End Type

sub matrix.set(r as long,c as long,x as double)
this.element(r,c)=x
end sub

Operator matrix.cast() As String 'for printing
Dim As String ans,comma
For a As Integer=1 To Ubound(this.element,1)
      For b As Integer=1 To Ubound(this.element,2)
            If b=Ubound(this.element,2) Then comma="" Else comma=","
            Var q=Str(Cround(element(a,b),decplaces))
            ans=ans+q+comma+gap(q)
      Next b
      ans=ans+Chr(10)
Next a
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
For r As Integer=1 To rows
      For c As Integer=1 To columns
            ans.element(r,c)=m1.element(r,c)+m2.element(r,c)
      Next c
Next r
Operator= ans
End Operator

operator matrix.+=(m as matrix)
this= this+m
end operator

Constructor matrix (r As Long,c As Long)
Redim element(1 To r,1 To c)
End Constructor

constructor matrix
end constructor

randomize
dim as long lim=1000

dim as matrix m(1 to lim)     'ARRAY OF MATRICES

for n as long=1 to lim
       m(n)=matrix(2,2)
      for z1 as long=1 to 2
            for z2 as long=1 to 2
            m(n).set(z1,z2,(200*(rnd-rnd)))
      next z2
next z1
if n < 6 or n>lim-5 then
print "matrix ";n
      print m(n)
else
      locate csrlin-1
      print "------------------"
      end if
next n
print

dim as matrix tot=matrix(2,2)
for n as long=1 to lim
      tot+=m(n)
next
print "All added up"
print tot
sleep

 