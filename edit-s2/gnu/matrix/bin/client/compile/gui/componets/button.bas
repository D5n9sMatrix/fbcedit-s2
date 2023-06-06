#ifdef __FB_WIN32__
	#cmdline "Form1.rc"
#endif
'#Region "Form"
	#include once "mff/Form.bi"
	#include once "mff/Menus.bi"
	#include once "mff/CommandButton.bi"
	#include once "mff/ImageList.bi"
	
	Using My.Sys.Forms
	
	Type Form3Type Extends Form
		Declare Static Sub _Form_Click(ByRef Sender As Control)
		Declare Sub Form_Click(ByRef Sender As Control)
		Declare Static Sub _CommandButton1_Click(ByRef Sender As Control)
		Declare Sub CommandButton1_Click(ByRef Sender As Control)
		Declare Constructor
		
		Dim As MainMenu MainMenuForm3
		Dim As MenuItem mnuFile, MenuItem2, MenuItem3, MenuItem4, mnuEdit, MenuItem6, MenuItem7, MenuItem8, MenuItem9
		Dim As CommandButton CommandButton1
		Dim As ImageList ImageList1
	End Type
	
	Constructor Form3Type
		' Form3
		With This
			.Name = "Form3"
			.Text = "Form3"
			.FormStyle = FormStyles.fsNormal
			#ifdef __USE_GTK__
				This.Icon.LoadFromFile(ExePath & "VisualFBEditor.ico")
			#else
				This.Icon.LoadFromResourceID(1)
			#endif
			.Designer = @This
			.OnClick = @_Form_Click
			.SetBounds 0, 0, 350, 300
		End With
		' MainMenuForm3
		With MainMenuForm3
			.Name = "MainMenuForm3"
			.SetBounds 28, 233, 14, 15
			.Designer = @This
			.Parent = @This
		End With
		' mnuFile
		With mnuFile
			.Name = "mnuFile"
			.Designer = @This
			.Caption = "&File"
			.ParentMenu = @MainMenuForm3
		End With
		' MenuItem2
		With MenuItem2
			.Name = "MenuItem2"
			.Designer = @This
			.Caption = "&New"
			.Parent = @mnuFile
		End With
		' MenuItem3
		With MenuItem3
			.Name = "MenuItem3"
			.Designer = @This
			.Caption = "&Open"
			.Parent = @mnuFile
		End With
		' MenuItem4
		With MenuItem4
			.Name = "MenuItem4"
			.Designer = @This
			.Caption = "&Close"
			.Parent = @mnuFile
		End With
		' mnuEdit
		With mnuEdit
			.Name = "mnuEdit"
			.Designer = @This
			.Caption = "&Edit"
			.ParentMenu = @MainMenuForm3
		End With
		' MenuItem6
		With MenuItem6
			.Name = "MenuItem6"
			.Designer = @This
			.Caption = "&Copy"
			.Parent = @mnuEdit
		End With
		' MenuItem7
		With MenuItem7
			.Name = "MenuItem7"
			.Designer = @This
			.Caption = "Cut(&C)"
			.Parent = @mnuEdit
		End With
		' MenuItem8
		With MenuItem8
			.Name = "MenuItem8"
			.Designer = @This
			.Caption = "Paste(&P)"
			.Parent = @mnuEdit
		End With
		' CommandButton1
		With CommandButton1
			.Name = "CommandButton1"
			.Text = "CommandButton1"
			.TabIndex = 0
			.SetBounds 124, 217, 108, 28
			.Designer = @This
			.OnClick = @_CommandButton1_Click
			.Parent = @This
		End With
		' MenuItem9
		With MenuItem9
			.Name = "MenuItem9"
			.Designer = @This
			.Caption = "MenuItem9"
			.Parent = @mnuEdit
		End With
		' ImageList1
		With ImageList1
			.Name = "ImageList1"
			.SetBounds 54, 231, 16, 16
			.Designer = @This
			.Parent = @This
		End With
	End Constructor
	
	Private Sub Form3Type._CommandButton1_Click(ByRef Sender As Control)
		*Cast(Form3Type Ptr, Sender.Designer).CommandButton1_Click(Sender)
	End Sub
	
	Private Sub Form3Type._Form_Click(ByRef Sender As Control)
		*Cast(Form3Type Ptr, Sender.Designer).Form_Click(Sender)
	End Sub
	
	Dim Shared Form3 As Form3Type
	
	#ifndef _NOT_AUTORUN_FORMS_
		#define _NOT_AUTORUN_FORMS_
		
		Form3.Show
		
		App.Run
	#endif
'#End Region

'#include once "Form4.frm"
Private Sub Form3Type.Form_Click(ByRef Sender As Control)
	
End Sub

Private Sub Form3Type.CommandButton1_Click(ByRef Sender As Control)
	MsgBox "This is form3"
	'Form4.Show MDIForm
End Sub

