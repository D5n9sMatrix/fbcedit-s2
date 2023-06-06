Sub Split(byval stringToSplit as String, delimeter as const String, result() as String)
	
	Dim lengthOfDelimeter as Integer = len(delimeter)
	Dim indexOfDelimeter as Integer = Instr(stringToSplit, delimeter)
	Dim counter as Integer = 0
	Dim indexstart as Integer = 1
	print stringToSplit
	while (indexOfDelimeter > 0)

		Redim preserve result(counter+1)
		result(counter) = mid(stringToSplit, indexstart, indexOfDelimeter - indexstart)

		indexstart=indexOfDelimeter + lengthOfDelimeter

		indexOfDelimeter = Instr(indexstart,stringToSplit, delimeter)

		counter += 1
	wend 
	
	result(counter) =  mid(stringToSplit, indexstart)	
End Sub
