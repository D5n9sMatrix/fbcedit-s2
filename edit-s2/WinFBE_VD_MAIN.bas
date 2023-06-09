#Define UNICODE
#Define _WIN32_WINNT &h0602
#Include Once "windows.bi"
#Include Once "Afx\CWindow.inc"
#define CODEGEN_FORM
#define CODEGEN_RICHEDIT
#define CODEGEN_TEXTBOX
#define CODEGEN_MAINMENU
#Include once "WinFormsX\WinFormsX.bi"
Using Afx

' WINFBE_CODEGEN_START

Declare Function frmMain_MainMenu_Click( ByRef sender As wfxMenuItem, ByRef e As EventArgs ) As LRESULT
Declare Function frmMain_MainMenu_Popup( ByRef sender As wfxMenuItem, ByRef e As EventArgs ) As LRESULT

type frmMainType extends wfxForm
   private:
      temp as byte
   public:
      declare static function FormInitializeComponent( byval pForm as frmMainType ptr ) as LRESULT
      declare constructor
      ' Controls
      RichEdit1 As wfxRichEdit
end type


function frmMainType.FormInitializeComponent( byval pForm as frmMainType ptr ) as LRESULT
   dim as long nClientOffset

   dim ncm As NONCLIENTMETRICS
   ncm.cbSize = SizeOf(ncm)
   SystemParametersInfo(SPI_GETNONCLIENTMETRICS, SizeOf(ncm), @ncm, 0)
   nClientOffset = AfxUnScaleY(ncm.iMenuHeight)  ' holds the height of the mainmenu

   pForm->MainMenu.MenuItems.Clear
   pForm->MainMenu.Parent = pForm
   dim mnuFile as wfxMenuItem = wfxMenuItem("File", "mnuFile", "", 0, 0)
   dim mnunewfile as wfxMenuItem = wfxMenuItem("new file", "mnunewfile", "Ctrl+N", 0, 0)
   dim mnunewproject as wfxMenuItem = wfxMenuItem("new project", "mnunewproject", "Ctrl+Shift+N", 0, 0)
   dim mnuopenfile as wfxMenuItem = wfxMenuItem("open file", "mnuopenfile", "Ctrl+O", 0, 0)
   dim mnuopenproject as wfxMenuItem = wfxMenuItem("open project", "mnuopenproject", "Ctrl+Shift+O", 0, 0)
   dim mnusavefile as wfxMenuItem = wfxMenuItem("save file", "mnusavefile", "Ctrl+S", 0, 0)
   dim mnusaveas as wfxMenuItem = wfxMenuItem("save as", "mnusaveas", "Ctrl+Shift+S", 0, 0)
   dim mnuexit as wfxMenuItem = wfxMenuItem("exit", "mnuexit", "Ctrl+Q", 0, 0)
   dim mnuedit as wfxMenuItem = wfxMenuItem("edit", "mnuedit", "", 0, 0)
   dim mnuundo as wfxMenuItem = wfxMenuItem("undo", "mnuundo", "Ctrl+Z", 0, 0)
   dim mnuredo as wfxMenuItem = wfxMenuItem("redo", "mnuredo", "Ctrl+Y", 0, 0)
   dim mnuselect as wfxMenuItem = wfxMenuItem("select", "mnuselect", "Ctrl+A", 0, 0)
   dim mnucopy as wfxMenuItem = wfxMenuItem("copy", "mnucopy", "Ctrl+C", 0, 0)
   dim mnupaste as wfxMenuItem = wfxMenuItem("paste", "mnupaste", "Ctrl+V", 0, 0)
   dim mnufind as wfxMenuItem = wfxMenuItem("find", "mnufind", "Ctrl+F", 0, 0)
   dim mnureplace as wfxMenuItem = wfxMenuItem("replace", "mnureplace", "Ctrl+Shift+F", 0, 0)
   dim mnudebug as wfxMenuItem = wfxMenuItem("debug", "mnudebug", "", 0, 0)
   dim mnurun as wfxMenuItem = wfxMenuItem("run", "mnurun", "Ctrl+R", 0, 0)
   dim mnucompile as wfxMenuItem = wfxMenuItem("compile", "mnucompile", "Ctrl+M", 0, 0)
   dim mnumake as wfxMenuItem = wfxMenuItem("make", "mnumake", "Ctrl+Shift+M", 0, 0)
   dim mnutest as wfxMenuItem = wfxMenuItem("test", "mnutest", "Ctrl+T", 0, 0)
   dim mnuhelp as wfxMenuItem = wfxMenuItem("help", "mnuhelp", "", 0, 0)
   dim mnuabout as wfxMenuItem = wfxMenuItem("about", "mnuabout", "Ctrl+H", 0, 0)
   mnuFile.MenuItems.Add(mnunewfile)
   mnuFile.MenuItems.Add(mnunewproject)
   mnuFile.MenuItems.Add(mnuopenfile)
   mnuFile.MenuItems.Add(mnuopenproject)
   mnuFile.MenuItems.Add(mnusavefile)
   mnuFile.MenuItems.Add(mnusaveas)
   mnuFile.MenuItems.Add(mnuexit)
   pForm->MainMenu.MenuItems.Add(mnuFile)
   mnuedit.MenuItems.Add(mnuundo)
   mnuedit.MenuItems.Add(mnuredo)
   mnuedit.MenuItems.Add(mnuselect)
   mnuedit.MenuItems.Add(mnucopy)
   mnuedit.MenuItems.Add(mnupaste)
   mnuedit.MenuItems.Add(mnufind)
   mnuedit.MenuItems.Add(mnureplace)
   pForm->MainMenu.MenuItems.Add(mnuedit)
   mnudebug.MenuItems.Add(mnurun)
   mnudebug.MenuItems.Add(mnucompile)
   mnudebug.MenuItems.Add(mnumake)
   mnudebug.MenuItems.Add(mnutest)
   pForm->MainMenu.MenuItems.Add(mnudebug)
   mnuhelp.MenuItems.Add(mnuabout)
   pForm->MainMenu.MenuItems.Add(mnuhelp)
   pForm->MainMenu.OnPopup = @frmMain_MainMenu_Popup
   pForm->MainMenu.OnClick = @frmMain_MainMenu_Click
   pForm->Controls.Add(ControlType.MainMenu, @(pForm->MainMenu))

   pForm->Name = "frmMain"
   pForm->Text = "Form1"
   pForm->SetBounds(10,10,500,300)
   pForm->RichEdit1.Parent = pForm
   pForm->RichEdit1.Name = "RichEdit1"
   pForm->RichEdit1.SetBounds(7,28-nClientOffset,2800,600)
   pForm->Controls.Add(ControlType.RichEdit, @(pForm->RichEdit1))
   Application.Forms.Add(ControlType.Form, pForm)
   function = 0
end function

constructor frmMainType
   InitializeComponent = cast( any ptr, @FormInitializeComponent )
   this.FormInitializeComponent( @this )
end constructor

dim shared frmMain as frmMainType

' WINFBE_CODEGEN_END

' ========================================================================================
' WinFBE - FreeBASIC Editor (Windows 32/64 bit)
' Visual Designer auto generated project
' ========================================================================================

' Main application entry point.
' Place any additional global variables or #include files here.

' For your convenience, below are some of the most commonly used WinFBX library
' include files. Uncomment the files that you wish to use in the project or add
' additional ones. Refer to the WinFBX Framework Help documentation for information
' on how to use the various functions.

' #Include Once "Afx\AfxFile.inc"
' #Include Once "Afx\AfxStr.inc"
' #Include Once "Afx\AfxTime.inc"
' #Include Once "Afx\CIniFile.inc"
' #Include Once "Afx\CMoney.inc"
' #Include Once "Afx\CPrint.inc"


Application.Run(frmMain)

#include once "Z:\home\denis\FreeBasic\fbcedit-s2\edit-s2\frmMain.inc"

