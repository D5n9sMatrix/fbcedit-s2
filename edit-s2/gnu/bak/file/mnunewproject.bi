Private Sub Form4Type.GridFill(Order As String)
	Dim As Long ret, x, y
	Dim As String ls()
	With Grid1
		.Rows.Clear
		.Columns.Add "Id", , 150
		.Columns.Add "Name", , 150	
	End With
	ret = Form1.db.SQLFind("SELECT id, name FROM persons ORDER BY " + Order, ls())
	If UBound(ls) < 0 Then Exit Sub
		Open "Debug4.txt" For Output As #1
	    Print #1, "Ubound(ls) = " + Str$(UBound(ls))
	 	Print #1, "Ubound(ls, 2) = " + Str$(UBound(ls, 2))	
		Print #1, ""
	 	For y = 0 To UBound(ls)
	 		For x = 0 To UBound(ls, 2)
	 			Print #1, "x = " + Str$(x)
	 		    Print #1, "y = " + Str$(y)
	 			Print #1, "ls(" + Str$(y) + "," + Str$(x) + ") = " + Str$(ls(y, x))
	 		Next
	 	Next
		Close #1
		For y = 1 To UBound(ls)
			With Grid1
				.Rows.Add ls(y, 0)
				' Here I want to add the second column, that is, ls(y, 1)
			End With
		Next	
End Sub
