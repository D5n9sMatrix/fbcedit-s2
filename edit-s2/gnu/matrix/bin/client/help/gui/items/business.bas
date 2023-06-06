#ifdef __FB_WIN32__
	#cmdline "Form1.rc"
#endif

'#Region "Form"
	#include once "mff/Form.bi"
	#include once "SQLite3Component.bi"
	#include once "mff/ListControl.bi"
	#include once "mff/CommandButton.bi"
	#include once "mff/TextBox.bi"
	#include once "mymodule.bas"
	#include once "mff/Menus.bi"
	
	Using My.Sys.Forms
	
	Type Form1Type Extends Form
		Declare Static Sub _Form_Show(ByRef Sender As Form)
		Declare Sub Form_Show(ByRef Sender As Form)
		Declare Static Sub _cmdInsert_Click(ByRef Sender As Control)
		Declare Sub cmdInsert_Click(ByRef Sender As Control)
		Declare Static Sub _Form_Close(ByRef Sender As Form, ByRef Action As Integer)
		Declare Sub Form_Close(ByRef Sender As Form, ByRef Action As Integer)
		Declare Static Sub _db_ErrorOut(ByRef Sender As SQLite3Component, ErrorTxt As String)
		Declare Sub db_ErrorOut(ByRef Sender As SQLite3Component, ErrorTxt As String)
		Declare Static Function _db_SQLString(ByRef Sender As SQLite3Component, Sql_Utf8 As String) As Long
		Declare Function db_SQLString(ByRef Sender As SQLite3Component, Sql_Utf8 As String) As Long
		Declare Static Sub _cmdDelete_Click(ByRef Sender As Control)
		Declare Sub cmdDelete_Click(ByRef Sender As Control)
		Declare Static Sub _cmdflst_Click(ByRef Sender As Control)
		Declare Sub cmdflst_Click(ByRef Sender As Control)
		Declare Static Sub _MenuItem2_Click(ByRef Sender As MenuItem)
		Declare Sub MenuItem2_Click(ByRef Sender As MenuItem)
		Declare Constructor
		Declare Sub Test()
		
		Dim As SQLite3Component db
		Dim As ListControl ListName
		Dim As CommandButton cmdInsert, cmdflst, cmdDelete
		Dim As TextBox txtName
		Dim As MainMenu MainMenu1
		Dim As MenuItem MenuItem1, MenuItem2
	End Type
	
	Constructor Form1Type
		' Form1
		With This
			.Name = "Form1"
			.Text = "SQLite Tests"
			.Designer = @This
			.OnShow = @_Form_Show
			.OnClose = @_Form_Close
			.DefaultButton = @cmdInsert
			.StartPosition = FormStartPosition.CenterScreen
			.Caption = "SQLite Tests"
			.Menu = @MainMenu1
			.SetBounds 0, -4, 350, 299
		End With
		' db
		With db
			.Name = "db"
			.SetBounds 319, 156, 16, 16
			.Designer = @This
			.OnErrorOut = @_db_ErrorOut
			.OnSQLString = @_db_SQLString
			.Parent = @This
		End With
		' ListName
		With ListName
			.Name = "ListName"
			.Text = "ListControl1"
			.TabIndex = 2
			.Anchor.Top = 1
			.Anchor.Right = 1
			.Anchor.Left = 1
			.Anchor.Bottom = 1
			.Hint = "Names list"
			.SetBounds 16, 17, 296, 108
			.Designer = @This
			.Parent = @This
		End With
		' cmdInsert
		With cmdInsert
			.Name = "cmdInsert"
			.Caption = "Insert"
			.Text = "Insert"
			.Default = True
			.TabIndex = 1
			.Anchor.Right = 0
			.Anchor.Left = 1
			.Anchor.Bottom = 1
			.Hint = "Click to insert a name"
			.SetBounds 43, 182, 69, 25
			.Designer = @This
			.OnClick = @_cmdInsert_Click
			.Parent = @This
		End With
		' txtName
		With txtName
			.Name = "txtName"
			.Text = ""
			.TabIndex = 0
			.Anchor.Right = 1
			.Anchor.Left = 1
			.Anchor.Bottom = 1
			.Hint = "Type name here"
			.SetBounds 18, 137, 294, 26
			.Designer = @This
			.Parent = @This
		End With
		' cmdflst
		With cmdflst
			.Name = "cmdflst"
			.Text = "List"
			.TabIndex = 5
			.BackColor = 16777215
			.ControlIndex = 3
			.Default = True
			.Hint = "Click to open form list"
			.SetBounds 242, 181, 69, 25
			.Designer = @This
			.OnClick = @_cmdflst_Click
			.Parent = @This
		End With
		' cmdDelete
		With cmdDelete
			.Name = "cmdDelete"
			.Text = "Delete"
			.TabIndex = 5
			.Caption = "Delete"
			.SetBounds 144, 182, 64, 24
			.Designer = @This
			.OnClick = @_cmdDelete_Click
			.Parent = @This
		End With
		' MainMenu1
		With MainMenu1
			.Name = "MainMenu1"
			.SetBounds 15, 218, 16, 16
			.Designer = @This
			.Parent = @This
		End With
		' MenuItem1
		With MenuItem1
			.Name = "MenuItem1"
			.Designer = @This
			.Caption = "File"
			.Parent = @MainMenu1
		End With
		' MenuItem2
		With MenuItem2
			.Name = "MenuItem2"
			.Designer = @This
			.Caption = "Open	"
			.onClick = @_MenuItem2_Click
			.Parent = @MenuItem1
		End With
	End Constructor
	
	Private Sub Form1Type._MenuItem2_Click(ByRef Sender As MenuItem)
		*Cast(Form1Type Ptr, Sender.Designer).MenuItem2_Click(Sender)
	End Sub
	
	Private Sub Form1Type._cmdflst_Click(ByRef Sender As Control)
		*Cast(Form1Type Ptr, Sender.Designer).cmdflst_Click(Sender)
	End Sub
	

	Private Sub Form1Type._cmdDelete_Click(ByRef Sender As Control)
		*Cast(Form1Type Ptr, Sender.Designer).cmdDelete_Click(Sender)
	End Sub
	
	Private Function Form1Type._db_SQLString(ByRef Sender As SQLite3Component, Sql_Utf8 As String) As Long
		Return *Cast(Form1Type Ptr, Sender.Designer).db_SQLString(Sender, Sql_Utf8)
	End Function
	
	Private Sub Form1Type._db_ErrorOut(ByRef Sender As SQLite3Component, ErrorTxt As String)
		*Cast(Form1Type Ptr, Sender.Designer).db_ErrorOut(Sender, ErrorTxt)
	End Sub
	
	Private Sub Form1Type._Form_Close(ByRef Sender As Form, ByRef Action As Integer)
		*Cast(Form1Type Ptr, Sender.Designer).Form_Close(Sender, Action)
	End Sub
	
	Private Sub Form1Type._cmdInsert_Click(ByRef Sender As Control)
		*Cast(Form1Type Ptr, Sender.Designer).cmdInsert_Click(Sender)
	End Sub
	
	
	Private Sub Form1Type._Form_Show(ByRef Sender As Form)
		*Cast(Form1Type Ptr, Sender.Designer).Form_Show(Sender)
	End Sub
	
	
	
	Dim Shared Form1 As Form1Type
	
	#ifndef _NOT_AUTORUN_FORMS_
		#define _NOT_AUTORUN_FORMS_
		
		Form1.Show
		
		App.Run
	#endif
'#End Region

Declare Sub Test()
#include once "Form2.frm"
#include once "Form3.frm"


Private Sub Form1Type.Form_Show(ByRef Sender As Form)
    On Error Goto ErrorHandler
    
	
	'If FileExists("database.sqlite") = -1 Then Exit Sub
	'MsgBox ExePath()
	Dim ret As Long
	ret = db.Open(ExePath() + "\database.sqlite")
	'MsgBox "Open " + Str$(ret)
	Test()
	If FileExists("database.sqlite") Then Exit Sub
	ret = db.CreateTable("persons")
	MsgBox "CreateTable " + Str$(ret)
	ret = db.AddField("persons", "id", "integer", , -1)
	MsgBox "AddField id " + Str$(ret)
	db.AddField("persons", "name", "text", , -1)
	MsgBox "AddField name " + Str$(ret)
	db.CreateIndex("persons", "name", "name", -1)
	MsgBox "CreateIndex name " + Str$(ret)
	MsgBox "AddItem " + Str$(ret)
	MsgBox "Errmsg = " + db.ErrMsg
	'ret = db.Exec("INSERT INTO persons (name) VALUES ('FLAVIO');")
	'MsgBox "Exec " + Str$(ret)
	' If db.Open("database.sqlite")  = -1 Then
	'	MsgBox("Create and/or Open Database OK")
	'Else
	'	MsgBox("Create and/or Open Database fails " + db.ErrMsg)
	'	Exit Sub
	'End If
	'If db.CreateTable("persons") = 0 Then
	'	MsgBox("Create Table OK")
	'Else
	'	MsgBox("Create Table fails " + db.ErrMsg)
	'	Exit Sub
	'End If
	'
	'If db.AddField("persons", "id", "integer,primary key", "", 1) Then
	'	MsgBox("Create field 'id' OK")
	'Else
	'	MsgBox("Create field 'id' fails " + db.ErrMsg)
	'	Exit Sub
	'End If
	'
	'If db.AddField("persons", "name", "text,60,unique", , 1) Then
	'	MsgBox("Create field 'name' OK")
	'Else
	'	MsgBox("Create field 'name' fails " + db.ErrMsg)
	'	Exit Sub
	'End If
	
    Exit Sub
ErrorHandler:
    MsgBox ErrDescription(Err) & " (" & Err & ") " & _
        "in line " & Erl() & " (Handler line: " & __LINE__ & ") " & _
        "in function " & ZGet(Erfn()) & " (Handler function: " & __FUNCTION__ & ") " & _
        "in module " & ZGet(Ermn()) & " (Handler file: " & __FILE__ & ") "
	End
End Sub



Private Sub Form1Type.cmdInsert_Click(ByRef Sender As Control)
    On Error Goto ErrorHandler
	Dim As String rs()
	Dim As String xname
	Dim As Long x
	Dim As Long y
	xname = Trim$(UCase(txtName.Text))
	If Len(xname) < 1 Then
		MsgBox "Name is required"
		Exit Sub
	End If
	If db.FindOne("persons", "name = '" + xname + "'", rs(), "name") Then
		For y = 0 To UBound(rs)
			For x = 0 To UBound(rs, 2)
			Next
		Next
		MsgBox "Name already exist"
		Exit Sub
	Else
		If db.Insert("persons", "name = '" + xname + "'") Then
			MsgBox xname + " added"
		Else
			MsgBox "Fail to insert " + xname
		End If
	End If
	'
	Test()
	MsgBox Str(db.Count("persons")) + " record(s)"
	Form1.txtName.Clear
	Form1.txtName.SetFocus
    Exit Sub
ErrorHandler:
    MsgBox ErrDescription(Err) & " (" & Err & ") " & _
        "in line " & Erl() & " (Handler line: " & __LINE__ & ") " & _
        "in function " & ZGet(Erfn()) & " (Handler function: " & __FUNCTION__ & ") " & _
        "in module " & ZGet(Ermn()) & " (Handler file: " & __FILE__ & ") "
End Sub

Private Sub Form1Type.Form_Close(ByRef Sender As Form, ByRef Action As Integer)
	db.Close()
End Sub

Private Sub Form1Type.db_ErrorOut(ByRef Sender As SQLite3Component, ErrorTxt As String)
	'MsgBox "ErrorOut Event: " + ErrorTxt
End Sub

Private Function Form1Type.db_SQLString(ByRef Sender As SQLite3Component, Sql_Utf8 As String) As Long
	'MsgBox "SQLString Event: " + Sql_Utf8	
	Function = False
End Function



Private Sub Form1Type.cmdDelete_Click(ByRef Sender As Control)
    On Error Goto ErrorHandler
	Form3.Show Form1
	Exit Sub
	If ListName.ItemIndex < 0 Then
		MsgBox "Select a name"
		Exit Sub
	Else
		Dim As String xname
		xname = ListName.Item(ListName.ItemIndex)
		db.DeleteItemUtf("persons", "name = '" + xname + "'")
		Test()
		MsgBox xname + " deleted " + " (" + Str(db.Count("persons", "id > 0")) + " record(s)"
		Form1.txtName.Clear
		Form1.txtName.SetFocus
	End If
    Exit Sub
ErrorHandler:
    MsgBox ErrDescription(Err) & " (" & Err & ") " & _
        "in line " & Erl() & " (Handler line: " & __LINE__ & ") " & _
        "in function " & ZGet(Erfn()) & " (Handler function: " & __FUNCTION__ & ") " & _
        "in module " & ZGet(Ermn()) & " (Handler file: " & __FILE__ & ") "
End Sub

Private Sub Form1Type.cmdflst_Click(ByRef Sender As Control)
    On Error Goto ErrorHandler
	Form2.Show Form1
    Exit Sub
ErrorHandler:
    MsgBox ErrDescription(Err) & " (" & Err & ") " & _
        "in line " & Erl() & " (Handler line: " & __LINE__ & ") " & _
        "in function " & ZGet(Erfn()) & " (Handler function: " & __FUNCTION__ & ") " & _
        "in module " & ZGet(Ermn()) & " (Handler file: " & __FILE__ & ") "
End Sub

Private Sub Form1Type.Test()
    On Error Goto ErrorHandler
	Dim As String ls()
	Dim As Long x, y
	ListName.Clear
	If db.Find("persons", "name is NOT NULL", ls(), "name", "name") Then
		For y = 0 To UBound(ls)
			For x = 0 To UBound(ls, 2)
				If y > 0 Then ListName.AddItem(ls(y, x))
			Next
		Next
	End If
    Exit Sub
ErrorHandler:
    MsgBox ErrDescription(Err) & " (" & Err & ") " & _
        "in line " & Erl() & " (Handler line: " & __LINE__ & ") " & _
        "in function " & ZGet(Erfn()) & " (Handler function: " & __FUNCTION__ & ") " & _
        "in module " & ZGet(Ermn()) & " (Handler file: " & __FILE__ & ") "
End Sub

Private Sub Form1Type.MenuItem2_Click(ByRef Sender As MenuItem)
    On Error Goto ErrorHandler
	Form3.Show Form1
    Exit Sub
ErrorHandler:
    MsgBox ErrDescription(Err) & " (" & Err & ") " & _
        "in line " & Erl() & " (Handler line: " & __LINE__ & ") " & _
        "in function " & ZGet(Erfn()) & " (Handler function: " & __FUNCTION__ & ") " & _
        "in module " & ZGet(Ermn()) & " (Handler file: " & __FILE__ & ") "
End Sub