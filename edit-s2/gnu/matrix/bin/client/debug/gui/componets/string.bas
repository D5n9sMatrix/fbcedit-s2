'#Region "Form"
	#if defined(__FB_WIN32__) AndAlso defined(__FB_MAIN__)
		#cmdline "Form1.rc"
	#endif
	#include once "mff/Form.bi"
	#include once "mff/CommandButton.bi"
	
	Using My.Sys.Forms
	
	Type Form1Type Extends Form
		Declare Static Sub _cmdSetTextToTag_Click(ByRef Sender As Control)
		Declare Sub cmdSetTextToTag_Click(ByRef Sender As Control)
		Declare Static Sub _cmdGetTextFromTag_Click(ByRef Sender As Control)
		Declare Sub cmdGetTextFromTag_Click(ByRef Sender As Control)
		Declare Constructor
		
		Dim As CommandButton cmdSetTextToTag, cmdGetTextFromTag
	End Type
	
	Constructor Form1Type
		' Form1
		With This
			.Name = "Form1"
			.Text = "Form1"
			.Designer = @This
			.SetBounds 0, 0, 350, 300
		End With
		' cmdSetTextToTag
		With cmdSetTextToTag
			.Name = "cmdSetTextToTag"
			.Text = "Set text to Tag"
			.TabIndex = 0
			.Caption = "Set text to Tag"
			.SetBounds 94, 62, 156, 37
			.Designer = @This
			.OnClick = @_cmdSetTextToTag_Click
			.Parent = @This
		End With
		' cmdGetTextFromTag
		With cmdGetTextFromTag
			.Name = "cmdGetTextFromTag"
			.Text = "Get Text from Tag"
			.TabIndex = 1
			.Caption = "Get Text from Tag"
			.SetBounds 96, 141, 157, 40
			.Designer = @This
			.OnClick = @_cmdGetTextFromTag_Click
			.Parent = @This
		End With
	End Constructor
	
	Private Sub Form1Type._cmdGetTextFromTag_Click(ByRef Sender As Control)
		*Cast(Form1Type Ptr, Sender.Designer).cmdGetTextFromTag_Click(Sender)
	End Sub
	
	Private Sub Form1Type._cmdSetTextToTag_Click(ByRef Sender As Control)
		*Cast(Form1Type Ptr, Sender.Designer).cmdSetTextToTag_Click(Sender)
	End Sub
	
	Dim Shared Form1 As Form1Type
	
	#ifdef __FB_MAIN__
		Form1.Show
		
		App.Run
	#endif
'#End Region

Private Sub Form1Type.cmdSetTextToTag_Click(ByRef Sender As Control)
	Form1.Tag = @"My Text"
End Sub

Private Sub Form1Type.cmdGetTextFromTag_Click(ByRef Sender As Control)
	If Form1.Tag <> 0 Then
		MsgBox *Cast(WString Ptr, Form1.Tag)
	Else
		MsgBox "Tag is null"
	End If
End Sub