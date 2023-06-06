Private Sub Form1Type.CommandButton1_Click(ByRef Sender As Control)
	MariaDBBox1.Open("test", "root", "111")
	MariaDBBox1.AddField "MyGuests", "image", "BLOB", "0"
	MariaDBBox1.AddItemUtf "MyGuests", "id = 6, firstname = 'ff', lastname = 'fff'"
	Dim As String ImageBinary = LoadFile("Add.png")
	MariaDBBox1.UpdateByteUtf "MyGuests", "id = 6", "image", StrPtr(ImageBinary), Len(ImageBinary)
	Dim As String rs()
	MariaDBBox1.FindOneByteUtf("MyGuests", "id = 6", rs(), "image")
	If UBound(rs) > -1 Then
		SaveFile "AddCopy.png", rs(0)
		Picture1.Graphic = "AddCopy.png"
	End If
	MariaDBBox1.Close
End Sub
