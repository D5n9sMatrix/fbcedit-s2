

Function tally (somestring As String,partstring As String,arr() As Long) As Long
    redim arr(1 to len(somestring)\2+1)
    Dim As long i,j,ln,lnp,count
    ln=Len(somestring)
    lnp=Len(partstring)
    count=0
    i=-1
    Do
        i+=1
        If somestring[i] <> partstring[0] Then Goto skip
        If somestring[i] = partstring[0] Then
            For j=0 To lnp-1
                If somestring[j+i]<>partstring[j] Then Goto skip
            Next j
        End If
        count+=1
        arr(count)=i+1
        i=i+lnp-1
        skip:
    Loop Until i>=ln-1
    redim preserve arr(1 to count) 
    Return count
End Function


Function splitstring(somestring As String,partstring As String,a() As String) As Long
    Redim As Long x()
    Var t= tally(somestring,partstring,x()),lps=Len(partstring)
    If t=0 Or Len(somestring)=0 Or lps=0 Then Return 0
    Redim a(1 To t+1)
    a(1)=Mid(somestring,1,x(1)-1)
    For n As Long=1 To Ubound(x)-1
        a(n+1)= Mid(somestring,x(n)+lps,x(n+1)-x(n)-lps)
    Next n
    a(Ubound(a))=Mid(somestring,x(Ubound(x))+lps)
    Return t+1
End Function

Dim As String g="123 456 789 345666abcd45600"
Dim As String delim="456 789 345"
Redim As String s()

For n As Long=1 To 22
    g+=g  'inflate the string
Next

Print "Length of string ";Len(g)
Print
Dim As Double t=Timer
Var n=splitstring(g,delim,s())
If n Then
    Print Timer-t;"   seconds "
    Print
    print "index","value"

    For n As Long=Lbound(s) To 10
        Print n, s(n)
    Next
    Print ". . ."
    Print ". . ."
    For n As Long=Ubound(s) -10 To Ubound(s)
        Print n,s(n)
    Next
    Print
    Print "array dimensions ";Lbound(s);"  to  ";Ubound(s)
End If
Sleep
 