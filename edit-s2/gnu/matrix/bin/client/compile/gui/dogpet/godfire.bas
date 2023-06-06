'#cmdline "-gen gcc -Wc -O2"
Function tally (somestring As const String,partstring As const String,arr() As Long) As Ulong
    Dim As Long i=-1,ln=Len(somestring),lnp=Len(partstring),count=0
     Redim arr(1 To ln)
    Do
        i+=1
        If somestring[i] <> partstring[0] Then continue do
        If somestring[i] = partstring[0] Then
            For j as long=0 To lnp-1
                If somestring[j+i]<>partstring[j] Then continue do
            Next j
        End If
        count+=1
        arr(count)=i+1
        i=i+lnp-1
    Loop Until i>=ln-1
    Redim Preserve arr(1 To count)
    Return count
End Function

Function splitstring(somestring As const String,partstring As const String,a() As String) As Long
    Redim As Long x()
    Var t= tally(somestring,partstring,x()),lps=Len(partstring)
    If t=0 Or Len(somestring)=0 Or lps=0 Then Return 0
    Redim a(1 To t+1)
    a(1)=Mid(somestring,1,x(1)-1)
    For n As Long=1 To Ubound(x)-1
        a(n+1)= Mid(somestring,x(n)+lps,x(n+1)-x(n)-lps)
    Next n
    a(Ubound(a))=Mid(somestring,x(Ubound(x))+lps)
    Return (t+1)=0
End Function

#include once "fbc-int/array.bi"

Function split(Byref s As Const String, result() As String, Byref delimiter As Const String = ",") As Integer
   
    Dim As Integer i
    Dim As String sindex = Mki(1)
    Dim As Integer used = Sizeof(Integer)
    Dim As Integer Ptr pindex = Cptr(Integer Ptr Ptr, @sindex)[0]
    Dim As Integer Ptr pused = Cptr(Integer Ptr, @sindex) + 1
    Dim As Integer Ptr pallocated = Cptr(Integer Ptr, @sindex) + 2
   
    If delimiter = "" Then Return 1  '' supplied delimiter empty
   
    Do
        Dim As Integer n = Instr(pindex[i], s, delimiter)
        If n = 0 Then Exit Do
        i += 1
        If used + Sizeof(Integer) > *pallocated Then
            *pused = used
            sindex &= Mki(n + Len(delimiter))
            pindex = Cptr(Integer Ptr Ptr, @sindex)[0]
        Else
            pindex[i] = n + Len(delimiter)
        End If
        used += Sizeof(Integer)
    Loop
   
    If i = 0 Then Return 2  '' no delimiter found in string
   
    If Ubound(result) - Lbound(result) < i Then
        Dim As Const FBC.FBARRAY Ptr pd = FBC.ArrayConstDescriptorPtr(result())
        If (pd->flags And FBC.FBARRAY_FLAGS_FIXED_LEN) Then Return 3  '' supplied fix-len result array() too small
        Redim Preserve result(Lbound(result) To Lbound(result) + i)
    End If
   
    For j As Integer = 0 To i - 1
        result(Lbound(result) + j) = Mid(s, pindex[j], pindex[j + 1] - pindex[j] - Len(delimiter))
    Next j
    result(Lbound(result) + i) = Mid(s, pindex[i])
    Return 0  '' OK
   
End Function


Dim As String g="123 456 789 345666abcd45600"
Dim As String delim="456 789 345"
Redim As String s(0)

For n As Long=1 To 23
    g+=g  'inflate the string
Next

Print "Length of string ";Len(g)
Print
Dim As Double t=Timer
Var n=splitstring(g,delim,s())

If n=0 Then
    Print Timer-t;"   seconds "
    Print
    print "index","value"

    For n As Long=Lbound(s) To 5
        Print n, s(n)
    Next
    Print ". . ."
    Print ". . ."
    For n As Long=Ubound(s) -5 To Ubound(s)
        Print n,s(n)
    Next
    Print
    Print "array dimensions ";Lbound(s);"  to  ";Ubound(s)
End If
print "___________________________________________"

redim s(0)
 t=Timer
 n=split(g,s(),delim)
If n=0 Then
    Print Timer-t;"   seconds "
    Print
    print "index","value"

    For n As Long=Lbound(s) To 5
        Print n, s(n)
    Next
    Print ". . ."
    Print ". . ."
    For n As Long=Ubound(s) -5 To Ubound(s)
        Print n,s(n)
    Next
    Print
    Print "array dimensions ";Lbound(s);"  to  ";Ubound(s)
End If

Sleep
 