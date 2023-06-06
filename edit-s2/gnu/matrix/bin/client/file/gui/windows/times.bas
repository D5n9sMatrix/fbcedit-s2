	Dim As Long ret, x, y
	Dim As String ls(), lsTypes()
	Dim As String Order = "Asc"
	ret = db.FindByte("SELECT id, name FROM persons ORDER BY " + Order, ls(), lsTypes())
	If UBound(ls) < 0 Then Exit Sub
	Open "Debug4.txt" For Output As #1
	Print #1, "Ubound(ls) = " + Str$(UBound(ls))
	Print #1, "Ubound(ls, 2) = " + Str$(UBound(ls, 2))
	Print #1, ""
	With Grid1
		.Columns.Clear
		.Rows.Clear
		For x = 0 To UBound(ls, 2)
			.Columns.Add ls(0, x), , 150, IIf(lsTypes(x) = SQLITE_INTEGER OrElse lsTypes(x) = SQLITE_FLOAT, gcfRight, gcfLeft)
		Next
		For y = 1 To UBound(ls)
			.Rows.Add ls(y, 0)
			For x = 0 To UBound(ls, 2)
				Print #1, "x = " + Str$(x)
				Print #1, "y = " + Str$(y)
				Print #1, "ls(" + Str$(y) + "," + Str$(x) + ") = " + Str$(ls(y, x))
				.Rows[y - 1][x].Text = ls(y, x)
			Next
		Next
	End With
	Close #1