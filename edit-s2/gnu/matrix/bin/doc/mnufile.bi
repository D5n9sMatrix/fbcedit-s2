' freebasic mnufile
#ifdef __FB_WIN32__
	#cmdline "mnufile.inc"
#endif
'#Region "Form"
	#include once "mff/Form.bi"
	#include once "mff/Menus.bi"
	#include once "mff/ReBar.bi"
	#include once "mff/ImageList.bi"
	
	Using My.Sys.Forms
	
	Type MDIFormType Extends Form
		Declare Static Sub _mnuFileOpen_Click(ByRef Sender As MenuItem)
		Declare Sub mnuFileOpen_Click(ByRef Sender As MenuItem)
		Declare Static Sub _mnuEditCopy_Click(ByRef Sender As MenuItem)
		Declare Sub mnuEditCopy_Click(ByRef Sender As MenuItem)
		Declare Static Sub _mnuEditCut_Click(ByRef Sender As MenuItem)
		Declare Sub mnuEditCut_Click(ByRef Sender As MenuItem)
		Declare Static Sub _mnuFileExit_Click(ByRef Sender As MenuItem)
		Declare Sub mnuFileExit_Click(ByRef Sender As MenuItem)
		Declare Static Sub _mnuFileNew_Click(ByRef Sender As MenuItem)
		Declare Sub mnuFileNew_Click(ByRef Sender As MenuItem)
		Declare Constructor
		
		Dim As MainMenu MainMenu1
		Dim As MenuItem mnuFile, mnuFileNew, mnuFileOpen, mnuFileSave, mnuFileSaveAs, mnuFileBar1, mnuFileBar2, mnuFileClose, mnuFileSaveAll, mnuFileBar3, mnuFileProperties, mnuFilePrintSetup, mnuFilePrintPreview, mnuFilePrint, mnuFileBar4, mnuFileSend, mnuFileBar5, mnuFileExit
		Dim As MenuItem mnuEdit, mnuEditUndo, mnuRedo, mnuEditCopy, mnuEditCut, mnuEditPaste, mnuEditBar1, mnuEditPasteSpecial, mnuEditBar2, mnuEditDSelectAll, mnuEditInvertSelection
		Dim As MenuItem mnuView, mnuViewToolbar, mnuViewStatusBar, mnuViewBar1, mnuViewLargeIcons, mnuViewSmallIcons, mnuViewList, mnuViewDetails, mnuViewBar2, mnuViewArrangeIcons, mnuVAIByName, mnuVAIByType, mnuVAIBySize, mnuVAIByDate, mnuViewLineUpIcons, mnuViewBar3, mnuViewContinue , mnuViewOptions
		Dim As MenuItem mnuHelp, mnuHelpContent, mnuHelpAbout, mnuHelpSearch, mnuHelpBar1
		Dim As MenuItem mnuWindow, mnuWindowNewWindow, mnuWindowCascade, mnuWindowTileHorizontal, mnuWindowTileVertical, mnuWindowArrangeIcons, mnuWindowBar1
		Dim As ReBar ReBar1
		Dim As ImageList ImageList1
	End Type
	
	Constructor MDIFormType
		' MDIForm
		With This
			.Name = "MDIForm"
			.Text = "MDIMain"
			.Designer = @This
			.Menu = @MainMenu1
			.FormStyle = FormStyles.fsMDIForm
			#ifdef __USE_GTK__
				This.Icon.LoadFromFile(ExePath & "VisualFBEditor.ico")
			#else
				This.Icon.LoadFromResourceID(1)
			#endif
			'.WindowState = WindowStates.wsMaximized
			.Caption = "MDIMain"
			.SetBounds 0, 0, 350, 319
		End With
		' ImageList1
		With ImageList1
			.Name = "ImageList1"
			.ImageWidth = 16
			.ImageHeight = 16
			.SetBounds 116, 70, 16, 16
			.Designer = @This
			.Add "New ", "New"
			.Add "About", "About"
			.Add "Cut", " Cut"
			.Add "Exit", "Exit"
			.Add "File", "File"
			.Add "Open", "Open"
			.Add "Paste", "Paste"
			.Add "Save", "Save"
			.Add "SaveAll", "SaveAll"
			.Parent = @This
		End With
		' MainMenu1
		With MainMenu1
			.Name = "MainMenu1"
			.SetBounds 81, 69, 16, 16
			.Designer = @This
			.Parent = @This
		End With
		' mnuFile
		With mnuFile
			.Name = "mnuFile"
			.Designer = @This
			.Caption = "&File"
			.ParentMenu = @MainMenu1
		End With
		' mnuFileNew
		With mnuFileNew
			.Name = "mnuFileNew"
			.Designer = @This
			.Caption = "&New" & !"\tCtrl+N"
			.ImageKey = "New"
			.onClick = @_mnuFileNew_Click
			.Parent = @mnuFile
		End With
		' mnuFileOpen
		With mnuFileOpen
			.Name = "mnuFileOpen"
			.Designer = @This
			.Caption = "&Open" & !"\tCtrl+O"
			.ImageKey = "Open"
			.onClick = @_mnuFileOpen_Click
			.Parent = @mnuFile
		End With
		' mnuFileClose
		With mnuFileClose
			.Name = "mnuFileClose"
			.Designer = @This
			.Caption = "&Close"
			.Parent = @mnuFile
		End With
		' mnuFileBar1
		With mnuFileBar1
			.Name = "mnuFileBar1"
			.Designer = @This
			.Caption = "-"
			.Parent = @mnuFile
		End With
		' mnuFileSave
		With mnuFileSave
			.Name = "mnuFileSave"
			.Designer = @This
			.Caption = "Save"  & !"\tCtrl+S"
			.ImageKey = "Save"
			.Parent = @mnuFile
		End With
		' mnuFileSaveAs
		With mnuFileSaveAs
			.Name = "mnuFileSaveAs"
			.Designer = @This
			.Caption = "Save &As..."
			.ImageKey = "SaveAs"
			.Parent = @mnuFile
		End With
		' mnuFileSaveAll
		With mnuFileSaveAll
			.Name = "mnuFileSaveAll"
			.Designer = @This
			.Caption = "Save A&ll"
			.Parent = @mnuFile
		End With
		' mnuFileBar2
		With mnuFileBar2
			.Name = "mnuFileBar2"
			.Designer = @This
			.Caption = "-"
			.Parent = @mnuFile
		End With
		' mnuFileProperties
		With mnuFileProperties
			.Name = "mnuFileProperties"
			.Designer = @This
			.Caption = "Propert&ies"
			.Parent = @mnuFile
		End With
		' mnuFileBar3
		With mnuFileBar3
			.Name = "mnuFileBar3"
			.Designer = @This
			.Caption = "-"
			.Parent = @mnuFile
		End With
		' mnuFilePrintSetup
		With mnuFilePrintSetup
			.Name = "mnuFilePrintSetup"
			.Designer = @This
			.Caption = "Print Set&up..."
			.Parent = @mnuFile
		End With
		' mnuFilePrintPreview
		With mnuFilePrintPreview
			.Name = "mnuFilePrintPreview"
			.Designer = @This
			.Caption = "Print Pre&view"
			.MenuIndex = 11
			.Parent = @mnuFile
		End With
		' mnuFilePrint
		With mnuFilePrint
			.Name = "mnuFilePrint"
			.Designer = @This
			.Caption = "&Print..." & !"\tCtrl+P"
			.Parent = @mnuFile
		End With
		' mnuFileBar4
		With mnuFileBar4
			.Name = "mnuFileBar4"
			.Designer = @This
			.Caption = "-"
			.Parent = @mnuFile
		End With
		' mnuFileSend
		With mnuFileSend
			.Name = "mnuFileSend"
			.Designer = @This
			.Caption = "Sen&d..."
			.Parent = @mnuFile
		End With
		' mnuFileBar5
		With mnuFileBar5
			.Name = "mnuFileBar5"
			.Designer = @This
			.Caption = "-"
			.Parent = @mnuFile
		End With
		' mnuFileExit
		With mnuFileExit
			.Name = "mnuFileExit"
			.Designer = @This
			.Caption = "E&xit"
			.ImageKey = "Exit"
			.onClick = @_mnuFileExit_Click
			.Parent = @mnuFile
		End With
		' mnuEdit
		With mnuEdit
			.Name = "mnuEdit"
			.Designer = @This
			.Caption = "&Edit"
			.ParentMenu = @MainMenu1
		End With
		' mnuRedo
		With mnuRedo
			.Name = "mnuRedo"
			.Designer = @This
			.Caption = "&Redo"
			.Parent = @mnuEdit
		End With
		' mnuEditUndo
		With mnuEditUndo
			.Name = "mnuEditUndo"
			.Designer = @This
			.Caption = "&Undo"
			.Parent = @mnuEdit
		End With
		' mnuEditBar1
		With mnuEditBar1
			.Name = "mnuEditBar1"
			.Designer = @This
			.Caption = "-"
			.Parent = @mnuEdit
		End With
		With mnuEditCut
			.Name = "mnuEditCut"
			.Designer = @This
			.Caption = "Cu&t"
			.ImageKey = "Cut"
			.onClick = @_mnuEditCut_Click
			.Parent =  @mnuEdit
		End With
		' mnuEditCopy
		With mnuEditCopy
			.Name = "mnuEditCopy"
			.Designer = @This
			.Caption = "&Copy"
			.ImageKey = "Copy"
			.onClick = @_mnuEditCopy_Click
			.Parent = @mnuEdit
		End With
		' mnuEditPaste
		With mnuEditPaste
			.Name = "mnuEditPaste"
			.Designer = @This
			.Caption = "&Paste"
			.ImageKey = "Paste"
			.Parent = @mnuEdit
		End With
		' mnuEditPasteSpecial
		With mnuEditPasteSpecial
			.Name = "mnuEditPasteSpecial"
			.Designer = @This
			.Caption = "Paste &Special..."
			.Parent = @mnuEdit
		End With
		' mnuEditBar2
		With mnuEditBar2
			.Name = "mnuEditBar2"
			.Designer = @This
			.Caption = "-"
			.Parent = @mnuEdit
		End With
		' mnuEditDSelectAll
		With mnuEditDSelectAll
			.Name = "mnuEditDSelectAll"
			.Designer = @This
			.Caption = "Select &All"
			.Parent = @mnuEdit
		End With
		' mnuEditInvertSelection
		With mnuEditInvertSelection
			.Name = "mnuEditInvertSelection"
			.Designer = @This
			.Caption = "&Invert Selection"
			.Parent = @mnuEdit
		End With
		' mnuView
		With mnuView
			.Name = "mnuView"
			.Designer = @This
			.Caption = "&View"
			.ParentMenu = @MainMenu1
		End With
		With mnuViewToolbar
			.Name = "mnuViewToolbar"
			.Caption         =   "&Toolbar"
			.Designer = @This
			.Parent = @mnuView
		End With
		With mnuViewStatusBar
			.Name = "mnuViewStatusBar"
			.Caption         =   "Status &Bar"
			.Designer = @This
			.Parent = @mnuView
		End With
		With mnuViewBar1
			.Name = "mnuViewBar1"
			.Caption         =   "-"
			.Designer = @This
			.Parent = @mnuView
		End With
		With mnuViewLargeIcons
			.Name = "mnuViewLargeIcons"
			.Caption         =   "Lar&ge Icons"
			.Designer = @This
			.Parent = @mnuView
		End With
		With mnuViewSmallIcons
			.Name = "mnuViewSmallIcons"
			.Caption         =   "S&mall Icons"
			.Designer = @This
			.Parent = @mnuView
		End With
		With mnuViewList
			.Name = "mnuViewList"
			.Caption         =   "&List"
			.Designer = @This
			.Parent = @mnuView
		End With
		With mnuViewDetails
			.Name = "mnuViewDetails"
			.Caption         =   "&Details"
			.Designer = @This
			.Parent = @mnuView
		End With
		With mnuViewBar2
			.Name = "mnuViewBar2"
			.Caption         =   "-"
			.Designer = @This
			.Parent = @mnuView
		End With
		With mnuViewArrangeIcons
			.Name = "mnuViewArrangeIcons"
			.Caption         =   "Arrange &Icons"
			.Designer = @This
			.Parent = @mnuView
		End With
		With mnuVAIByName
			.Name = "mnuVAIByName"
			.Caption         =   "by &Name"
			.Designer = @This
			.Parent = @mnuViewArrangeIcons
		End With
		With mnuVAIByType
			.Name = "mnuVAIByType"
			.Caption         =   "by &Type"
			.Designer = @This
			.Parent = @mnuViewArrangeIcons
		End With
		With mnuVAIBySize
			.Name = "mnuVAIBySize"
			.Caption         =   "by Si&ze"
			.Designer = @This
			.Parent = @mnuViewArrangeIcons
		End With
		With mnuVAIByDate
			.Name = "mnuVAIByDate"
			.Caption         =   "by &Date"
			.Designer = @This
			.Parent = @mnuViewArrangeIcons
		End With
		With mnuViewLineUpIcons
			.Name = "mnuViewLineUpIcons"
			.Caption         =   "Li&ne Up Icons"
			.Designer = @This
			.Parent = @mnuView
		End With
		With mnuViewBar3
			.Name = "mnuViewBar3"
			.Caption         =   "-"
			.Designer = @This
			.Parent = @mnuView
		End With
		With mnuViewContinue
			.Name = "mnuViewContinue"
			.Caption         =   "&Continue"
			.Designer = @This
			.Parent = @mnuView
		End With
		With mnuViewOptions
			.Name = "mnuViewOptions"
			.Caption         =   "&Options..."
			.Designer = @This
			.Parent = @mnuView
		End With
		
		With mnuWindow
			.Name = "mnuWindow"
			.Caption         =   "&Window"
			.Designer = @This
			.Parent = @MainMenu1
		End With
		With mnuWindowNewWindow
			.Name = "mnuWindowNewWindow"
			.Caption         =   "&New Window"
			.Designer = @This
			.Parent = @mnuWindow
		End With
		With mnuWindowCascade
			.Caption         =   "&Cascade"
			.Designer = @This
			.Parent = @mnuWindow
		End With
		With mnuWindowTileHorizontal
			.Name = "mnuWindowTileHorizontal"
			.Caption         =   "Tile &Horizontal"
			.Designer = @This
			.Parent = @mnuWindow
		End With
		With mnuWindowTileVertical
			.Name = "mnuWindowTileVertical"
			.Caption         =   "Tile &Vertical"
			.Designer = @This
			.Parent = @mnuWindow
		End With
		With mnuWindowArrangeIcons
			.Name= "mnuWindowArrangeIcons"
			.Caption         =   "&Arrange Icons"
			.Designer = @This
			.Parent = @mnuWindow
		End With
		With mnuWindowBar1
			.Name= "mnuWindowBar1"
			.Caption         =   "-"
			.Designer = @This
			.Parent = @mnuWindow
		End With
		' mnuHelp
		With mnuHelp
			.Name = "mnuHelp"
			.Designer = @This
			.Caption = "&Help"
			.ParentMenu = @MainMenu1
		End With
		' mnuHelpContent
		With mnuHelpContent
			.Name = "mnuHelpContent"
			.Designer = @This
			.Caption = "&Contents"
			.Parent = @mnuHelp
		End With
		' mnuHelpSearch
		With mnuHelpSearch
			.Name = "mnuHelpSearch"
			.Designer = @This
			.Caption = "&Search For Help On..."
			.Parent = @mnuHelp
		End With
		' mnuHelpBar1
		With mnuHelpBar1
			.Name = "mnuHelpBar1"
			.Designer = @This
			.Caption = "-"
			.Parent = @mnuHelp
		End With
		' mnuHelpAbout
		With mnuHelpAbout
			.Name = "mnuHelpAbout"
			.Designer = @This
			.Caption = "About"
			.ImageKey = "About"
			.Parent = @mnuHelp
		End With
		' ReBar1
		With ReBar1
			.Name = "ReBar1"
			.Text = "ReBar1"
			.SetBounds 6, 4, 324, 18
			.Designer = @This
			.Parent = @This
		End With
		
	End Constructor
	
	Private Sub MDIFormType._mnuFileNew_Click(ByRef Sender As MenuItem)
		*Cast(MDIFormType Ptr, Sender.Designer).mnuFileNew_Click(Sender)
	End Sub
	
	Private Sub MDIFormType._mnuFileExit_Click(ByRef Sender As MenuItem)
		*Cast(MDIFormType Ptr, Sender.Designer).mnuFileExit_Click(Sender)
	End Sub
	
	Private Sub MDIFormType._mnuEditCut_Click(ByRef Sender As MenuItem)
		*Cast(MDIFormType Ptr, Sender.Designer).mnuEditCut_Click(Sender)
	End Sub
	
	Private Sub MDIFormType._mnuEditCopy_Click(ByRef Sender As MenuItem)
		*Cast(MDIFormType Ptr, Sender.Designer).mnuEditCopy_Click(Sender)
	End Sub
	
	Private Sub MDIFormType._mnuFileOpen_Click(ByRef Sender As MenuItem)
		*Cast(MDIFormType Ptr, Sender.Designer).mnuFileOpen_Click(Sender)
	End Sub
	
	Dim Shared MDIForm As MDIFormType
	
	#ifndef _NOT_AUTORUN_FORMS_
		#define _NOT_AUTORUN_FORMS_
		
		MDIForm.Show
		
		App.Run
	#endif
'#End Region

#include once "Form2.frm"

Private Sub MDIFormType.mnuFileOpen_Click(ByRef Sender As MenuItem)
	Form2.Show MDIForm
End Sub

Private Sub MDIFormType.mnuEditCopy_Click(ByRef Sender As MenuItem)
	MsgBox "Place Copy Code here!"
End Sub

Private Sub MDIFormType.mnuEditCut_Click(ByRef Sender As MenuItem)
	MsgBox "Place Cut Code here!"
End Sub

Private Sub MDIFormType.mnuFileExit_Click(ByRef Sender As MenuItem)
	This.ModalResult = ModalResults.OK
	This.CloseForm
End Sub

Private Sub MDIFormType.mnuFileNew_Click(ByRef Sender As MenuItem)
	MsgBox "Place New Code here!"
End Sub
