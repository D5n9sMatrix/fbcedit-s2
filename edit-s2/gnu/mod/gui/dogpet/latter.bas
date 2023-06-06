Function SplitString(StringToSplit As String = "", array() As String) As UInteger
	Dim As String text = StringToSplit 'remind StringToSplit as working copy
	Dim As UInteger b = 1, e = 1 'pointer to text, begin and end
	Dim As UInteger x 'counter
	
	ReDim Array(0) 'reset array
	
	Do Until e = 0
		x += 1
		ReDim Preserve array(x) 'create new array element
		e = InStr(e + 1, text, " ") 'set end pointer to next space
		array(x) = Mid(text, b, e - b) 'cut text between the pointers and write it to the array
		b = e + 1 'set begin pointer behind end pointer for the next word
	Loop
	
	Return x 'return number of words
End Function

ReDim As String StringArray(0)

Print SplitString("The big brown fox jumped over the lazy dog", StringArray())

Print
For x As Integer = 1 To UBound(StringArray)
	Print stringArray(x)
Next

Sleep