'#Region "Form"
	#if defined(__FB_WIN32__) AndAlso defined(__FB_MAIN__)
		#cmdline "Form1.rc"
	#endif
	#include once "mff/Form.bi"
	#include once "mff/CommandButton.bi"
	
	Using My.Sys.Forms
	
	Type Form1Type Extends Form
		Declare Static Sub _cmdSetArrayToTag_Click(ByRef Sender As Control)
		Declare Sub cmdSetArrayToTag_Click(ByRef Sender As Control)
		Declare Static Sub _cmdGetArrayFromTag_Click(ByRef Sender As Control)
		Declare Sub cmdGetArrayFromTag_Click(ByRef Sender As Control)
		Declare Static Sub _cmdDeleteArray_Click(ByRef Sender As Control)
		Declare Sub cmdDeleteArray_Click(ByRef Sender As Control)
		Declare Constructor
		
		Dim As CommandButton cmdSetArrayToTag, cmdGetArrayFromTag, cmdDeleteArray
	End Type
	
	Constructor Form1Type
		' Form1
		With This
			.Name = "Form1"
			.Text = "Form1"
			.Designer = @This
			.SetBounds 0, 0, 350, 300
		End With
		' cmdSetArrayToTag
		With cmdSetArrayToTag
			.Name = "cmdSetArrayToTag"
			.Text = "Set Array to Tag"
			.TabIndex = 0
			.Caption = "Set Array to Tag"
			.SetBounds 50, 26, 228, 51
			.Designer = @This
			.OnClick = @_cmdSetArrayToTag_Click
			.Parent = @This
		End With
		' cmdGetArrayFromTag
		With cmdGetArrayFromTag
			.Name = "cmdGetArrayFromTag"
			.Text = "Get Array from Tag"
			.TabIndex = 1
			.Caption = "Get Array from Tag"
			.SetBounds 52, 106, 227, 54
			.Designer = @This
			.OnClick = @_cmdGetArrayFromTag_Click
			.Parent = @This
		End With
		' cmdDeleteArray
		With cmdDeleteArray
			.Name = "cmdDeleteArray"
			.Text = "Delete Array"
			.TabIndex = 2
			.Caption = "Delete Array"
			.SetBounds 53, 186, 224, 48
			.Designer = @This
			.OnClick = @_cmdDeleteArray_Click
			.Parent = @This
		End With
	End Constructor
	
	Private Sub Form1Type._cmdDeleteArray_Click(ByRef Sender As Control)
		*Cast(Form1Type Ptr, Sender.Designer).cmdDeleteArray_Click(Sender)
	End Sub
	
	Private Sub Form1Type._cmdGetArrayFromTag_Click(ByRef Sender As Control)
		*Cast(Form1Type Ptr, Sender.Designer).cmdGetArrayFromTag_Click(Sender)
	End Sub
	
	Private Sub Form1Type._cmdSetArrayToTag_Click(ByRef Sender As Control)
		*Cast(Form1Type Ptr, Sender.Designer).cmdSetArrayToTag_Click(Sender)
	End Sub
	
	Dim Shared Form1 As Form1Type
	
	#ifdef __FB_MAIN__
		Form1.Show
		
		App.Run
	#endif
'#End Region

Type Array
	rs(Any, Any) As String
End Type

Private Sub Form1Type.cmdSetArrayToTag_Click(ByRef Sender As Control)
	If Form1.Tag <> 0 Then
		Delete Cast(Array Ptr, Form1.Tag)
	End If
	Dim As Array Ptr arr = New Array
	ReDim arr->rs(5, 5)
	arr->rs(0, 0) = "a"
	arr->rs(4, 3) = "b"
	Form1.Tag = arr
End Sub

Private Sub Form1Type.cmdGetArrayFromTag_Click(ByRef Sender As Control)
	Dim As Array Ptr arr = Form1.Tag
	If arr = 0 Then
		MsgBox "Array not setted to Form1 Tag"
		Exit Sub
	End If
	For i As Integer = 0 To UBound(arr->rs)
		For j As Integer = 0 To UBound(arr->rs, 2)
			Print i, j, arr->rs(i, j)
		Next
	Next
End Sub

Private Sub Form1Type.cmdDeleteArray_Click(ByRef Sender As Control)
	If Form1.Tag = 0 Then
		MsgBox "Array not setted to Form1 Tag"
		Exit Sub
	End If
	Delete Cast(Array Ptr, Form1.Tag)
	Form1.Tag = 0
End Sub