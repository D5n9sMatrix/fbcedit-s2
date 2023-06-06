With Grid1
	.Rows.Add rs(y, 0)  'rs(y, 0) = first column of my result set string array, no errors...
	' here I want to add second column, that is, rs(y, 1)
	' I tried all the possibilities from the example, but I got segmentation errors... 
	.Grid1[y][1].Text = rs(y, 1)  'Error
	.Rows[y][1].Text = rs(y,1)    'Error
	.Cell(y, 1)->Text = rs(y,1)    'Error
End With
