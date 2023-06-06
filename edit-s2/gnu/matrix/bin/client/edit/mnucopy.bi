#ifdef __FB_WIN32__
	#cmdline "Form1.rc"
#endif
'#Region "Form"
	#include once "mff/Form.bi"
	#include once "mff/CommandButton.bi"
	#include once "mff/ImageList.bi"
	
	Using My.Sys.Forms
	
	Type Form2Type Extends Form
		Declare Static Sub _CommandButton1_Click(ByRef Sender As Control)
		Declare Sub CommandButton1_Click(ByRef Sender As Control)
		Declare Static Sub _Form_Click(ByRef Sender As Control)
		Declare Sub Form_Click(ByRef Sender As Control)
		Declare Static Sub _CommandButton1_KeyPress(ByRef Sender As Control, Key As Integer)
		Declare Sub CommandButton1_KeyPress(ByRef Sender As Control, Key As Integer)
		Declare Static Sub _CommandButton1_KeyUp(ByRef Sender As Control, Key As Integer, Shift As Integer)
		Declare Sub CommandButton1_KeyUp(ByRef Sender As Control, Key As Integer, Shift As Integer)
		Declare Constructor
		
		Dim As CommandButton CommandButton1
		Dim As ImageList ImageList1
	End Type
	
	Constructor Form2Type
		' Form2
		With This
			.Name = "Form2"
			.Text = "Form2"
			.FormStyle = FormStyles.fsMDIChild
			#ifdef __USE_GTK__
				This.Icon.LoadFromFile(ExePath & "VisualFBEditor.ico")
			#else
				This.Icon.LoadFromResourceID(1)
			#endif
			.Designer = @This
			.onClick = @_Form_Click
			.SetBounds 0, 0, 350, 300
		End With
		' CommandButton1
		With CommandButton1
			.Name = "CommandButton1"
			.Text = "CommandButton1"
			.TabIndex = 0
			.SetBounds 83, 220, 133, 29
			.Designer = @This
			.OnClick = @_CommandButton1_Click
			.OnKeyPress = @_CommandButton1_KeyPress
			.OnKeyUp = @_CommandButton1_KeyUp
			.Parent = @This
		End With
		' ImageList1
		With ImageList1
			.Name = "ImageList1"
			.SetBounds 141, 104, 16, 16
			.Designer = @This
			.Parent = @This
		End With
	End Constructor
	
	Private Sub Form2Type._CommandButton1_KeyUp(ByRef Sender As Control, Key As Integer, Shift As Integer)
		*Cast(Form2Type Ptr, Sender.Designer).CommandButton1_KeyUp(Sender, Key, Shift)
	End Sub
	
	Private Sub Form2Type._CommandButton1_KeyPress(ByRef Sender As Control, Key As Integer)
		*Cast(Form2Type Ptr, Sender.Designer).CommandButton1_KeyPress(Sender, Key)
	End Sub
	
	Private Sub Form2Type._Form_Click(ByRef Sender As Control)
		*Cast(Form2Type Ptr, Sender.Designer).Form_Click(Sender)
	End Sub
	
	Private Sub Form2Type._CommandButton1_Click(ByRef Sender As Control)
		*Cast(Form2Type Ptr, Sender.Designer).CommandButton1_Click(Sender)
	End Sub
	
	Dim Shared Form2 As Form2Type
	
	#ifndef _NOT_AUTORUN_FORMS_
		#define _NOT_AUTORUN_FORMS_
		
		Form2.Show
		
		App.Run
	#endif
'#End Region

'#include once "Form3.frm"

Private Sub Form2Type.CommandButton1_Click(ByRef Sender As Control)
	'Form3.Show MDIForm
End Sub

Private Sub Form2Type.Form_Click(ByRef Sender As Control)
	MsgBox "This is form2"
	'Form3.Show MDIForm
End Sub

Private Sub Form2Type.CommandButton1_KeyPress(ByRef Sender As Control, Key As Integer)
	
End Sub

Private Sub Form2Type.CommandButton1_KeyUp(ByRef Sender As Control, Key As Integer, Shift As Integer)
	
End Sub
