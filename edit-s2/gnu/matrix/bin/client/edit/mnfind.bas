/'
    Split Text Algorithm v2.1 for FreeBasic 

    Author: Nikos Siatras
    https://github.com/nsiatras
'/

' Splits the textToSplit string into multiple Strings, given the delimiter 
' that separates them and adds them to the result array
Sub Split(byref stringToSplit as const String, byref delimeter as const String, result() as String)
	
    Dim lengthOfDelimeter as Integer = len(delimeter)
    Dim indexOfDelimeter as Integer = 1
    Dim delimeterCount as Integer = 0
    Dim offset as Integer
    Dim lastDelimeterIndex as Integer
    
    ' Find how many times the demileter exists in the stringToSplit
    Do
		indexOfDelimeter = InStr(indexOfDelimeter, stringToSplit, delimeter)
		if indexOfDelimeter >0 then
			delimeterCount += 1
			indexOfDelimeter = indexOfDelimeter + lengthOfDelimeter
		else
			Exit Do ' Exit Do Loop
		endif
    Loop
    
    ' The delimeter wasn't found in the string
    if delimeterCount = 0 then
		ReDim result(0)
		result(0) = stringToSplit
		return
    endif
    
    ' Resize the result array according to delimeter size
    ReDim result(delimeterCount)

	' Serial search inside the stringToSplit in order to find the parts 
	' separated by the delimeter and push them to the result() array
    delimeterCount = 0
    offset = 1
    indexOfDelimeter = 1 
    Do
		indexOfDelimeter = InStr(offset, stringToSplit, delimeter)
		if indexOfDelimeter > 0 then
			result(delimeterCount) = Mid(stringToSplit, offset, indexOfDelimeter - offset)
		else
			if lastDelimeterIndex < len (stringToSplit) then
				result(delimeterCount) = Mid(stringToSplit, lastDelimeterIndex + lengthOfDelimeter)
			endif
			return 'Exit the Do Loop and return!
		endif
		lastDelimeterIndex = indexOfDelimeter
		offset = indexOfDelimeter + lengthOfDelimeter
		delimeterCount += 1
    Loop
    
End Sub

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Test Code
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Dim fStringToSplit as String
Dim fSplitParts () as String, tmp as String
Dim i as Integer

fStringToSplit = ",Welcome,to,Free,Basic,!"
Split(fStringToSplit,",",fSplitParts())
     
' Print the fSplitParts
for i = 0 to ubound(fSplitParts)
    print "Part #" & i & " " & fSplitParts(i)
next

print ""

fStringToSplit = "Now<>you<>know<>how<>to<>split<>strings<>!"
Split(fStringToSplit,"<>",fSplitParts())
     
' Print the fSplitParts
for i = 0 to ubound(fSplitParts)
    print "Part #" & i & " " & fSplitParts(i)
next

