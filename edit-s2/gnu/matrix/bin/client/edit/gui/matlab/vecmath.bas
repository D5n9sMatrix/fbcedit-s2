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
    redim V3.v(0 to ub1)
'
        for j=0 to ub1
             s=0
         for i=0 to ub2
             x=V1.v(i)
             y=M1.m(j,i)
             s=s+x*y
         next i
          V3.v(j)=s
      next j
 '
end sub
