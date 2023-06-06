'
' ----------------------------------------------------------------------
'
function activation(x as single, a as single, lamda as single, choice as integer) as single
'
'   Select from a wide variety of activation functions .
'
' https://www.v7labs.com/blog/neural-networks-activation-functions
'
dim as single y
'
  select case choice
       case 1:
       '  RELU
          y = (sgn(x) + 1)*x*0.5
       
       case 2:
       '  Leaky RELU
          y = (((sgn(x) + 1)/2.2 - 0.1)*abs(x) + 1)*1.5
          
       case 3:
       '  Tanh
          y = (exp(x)-exp(-x))/(exp(x)+exp(-x)) 
       
       case 4:
       '  Binary step function
          y = 1
         if ( x < 0 ) then y = 0 end if
       
       case 5:
       '  Linear
          y = x
       
       case 6:
       '  SELU
          y = lamda*x
         if ( x < 0 ) then
          y = lamda*a*(exp(x) -1)
         end if 
          
       case 7:
       '  ELU
          y = x
         if ( x < 0 ) then 
          y =  a*(exp(x) - 1)
         end if
           
       case 8:
       '  Sigmoid/Logistic
          y = 1/(1 + exp(-x))
       
       case 9:
       '  Parametric ReLU
          y = x
         if ( x < 0 ) then 
          y = a*x 
         end if
          
       case 10:
       '  Softmax
       '  softmax(ly,i) = exp(ly(i))/sum(exp(ly(j)),j,1,n)
          y = 0.1*x
       
       case 11:
       '  Swish
          y = x/(1 + exp(-x))
       
       case 12:
       '  GELU
          y = sqr(2/pi)*(x + 0.044715*x^3)
          y = 0.5*x*(1 + (exp(y) - exp(-y))/(exp(y) + exp(-y)) )
          
       case else :
       '  Sigmoid
          y = 1/(1 + exp(-x))
       
  end select       
'
  return y
'
end function
'
' ----------------------------------------------------------------------
'
function d_activation(x as single, a as single, lamda as single, choice as integer) as single

'
'   Select from a wide variety of derivatives of activation functions .
'
' https://www.v7labs.com/blog/neural-networks-activation-functions
'
dim as single y, y1, y2, y3, y4, y5
'
  select case choice
       case 1:
       '  RELU
          y = 1
         if x < 0 then y = 0 end if 
         
       case 2:
       '  Leaky RELU
          y = 1
         if x < 0 then y = 0.01 end if      
       
       case 3:
       '  Tanh
          y = 1-(exp(x)-exp(-x))^2/(exp(x)+exp(-x))^2
       
       case 4:
       '  Binary step function
       
       case 5:
       '  Linear
          y = 1
          
       case 6:
       '  SELU
          y = lamda
         if ( x < 0 ) then
          y = a*lamda*exp(x)
         end if 
         
       case 7:
       '  ELU
          y = 1
         if ( x < 0 ) then 
          y =  a*exp(x)
         end if
       
       case 8:
       '  Sigmoid/Logistic
          y = exp(-x)/(exp(-x)+1)^2
       
       case 9:
       '  Parametric ReLU
           y = 1
         if ( x < 0 ) then 
           y = a 
         end if
       
       case 10:
       '  Softmax
          y = 0.1
       
       case 11:
       '  Swish
          y = (exp(2*x)+(x+1)*exp(x) )/(exp(2*x)+2*exp(x)+1)
          
       case 12:
       '  GELU
          y1 = 100000*exp((8943*sqr(2/pi)*x^3)/50000+4*sqr(2/pi)*x) 
          y2 = (26829*sqr(2/pi)*x^3+200000*sqr(2/pi)*x+100000)
          y3 = exp((8943*sqr(2/pi)*x^3)/100000+ 2*sqr(2/pi)*x)
          y4 =100000*exp((8943*sqr(2/pi)*x^3)/50000+4*sqr(2/pi)*x)
          y5 = 200000*exp((8943*sqr(2/pi)*x^3)/100000+2*sqr(2/pi)*x)
           y = (y1 + y2*y3)/( y4 + y5 +100000 )
     
       case else :
       '  Sigmoid
           y = exp(-x)/(exp(-x)+1)^2
       
  end select       
'
  return y
'
end function
'
' ----------------------------------------------------------------------
'
 
