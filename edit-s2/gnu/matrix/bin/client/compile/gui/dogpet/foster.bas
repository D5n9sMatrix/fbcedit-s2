' split or explode by delimiter return elements in array
Function explode(haystack As String = "", delimiter as string, ordinance() As String) As UInteger
    Dim As String text = haystack  'remind explode as working copy
    Dim As UInteger b = 1, e = 1   'pointer to text, begin and end
    Dim As UInteger x              'counter
    ReDim ordinance(0)             'reset array

    Do Until e = 0
      x += 1
      ReDim Preserve ordinance(x)         'create new array element
      e = InStr(e + 1, text, delimiter)   'set end pointer to next space
      ordinance(x) = Mid(text, b, e - b)  'cut text between the pointers and write it to the array
      b = e + 1                           'set begin pointer behind end pointer for the next word
    Loop

    Return x 'nr of elements returned

End Function

' sample code for calling the function explode
ReDim As String ordinance(0)
explode("The big brown fox jumped over; the lazy; dog", ";", ordinance())
print UBound(ordinance)
For x As Integer = 1 To UBound(ordinance)
    Print trim(ordinance(x))
Next

sleep
end
