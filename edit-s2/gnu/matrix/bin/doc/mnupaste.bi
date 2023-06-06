1 24 "Manifest.xml"
1 ICON "VisualFBEditor.ico"
New PNG ".\Resources\New.png"
About PNG ".\Resources\About.png"
Cut PNG ".\Resources\Cut.png"
Exit PNG ".\Resources\Exit.png"
File PNG ".\Resources\File.png"
Open PNG ".\Resources\Open.png"
Paste PNG ".\Resources\Paste.png"
Save PNG ".\Resources\Save.png"
SaveAll PNG ".\Resources\SaveAll.png"

#define APP_TITLE_STR               "\0"
#define VER_FILEDESCRIPTION_STR     "\0"

#define VER_FILEVERSION             0,0,0,106
#define VER_FILEVERSION_STR         "0.0.0.106\0"

#define VER_LEGALCOPYRIGHT_STR      "\0"

#define VER_INTERNALNAME_STR        "\0"
#define VER_ORIGINALFILENAME_STR    "\0"
#define VER_PRODUCTNAME_STR         "\0"

#define VER_PRODUCTVERSION          0,0,0,0
#define VER_PRODUCTVERSION_STR      "0.0.0\0"
#define VER_COMPANYNAME_STR         "\0"

VS_VERSION_INFO VERSIONINFO
FILEVERSION     VER_FILEVERSION
PRODUCTVERSION  VER_PRODUCTVERSION
FILEOS          VOS__WINDOWS32
FILETYPE        VFT_APP
FILESUBTYPE     VFT2_UNKNOWN
BEGIN
    BLOCK "StringFileInfo"
    BEGIN
        BLOCK "040904E4"
        BEGIN
        	VALUE "ApplicationTitle", APP_TITLE_STR
            VALUE "FileDescription",  VER_FILEDESCRIPTION_STR
            VALUE "FileVersion",      VER_FILEVERSION_STR
            VALUE "InternalName",     VER_INTERNALNAME_STR
            VALUE "LegalCopyright",   VER_LEGALCOPYRIGHT_STR
            VALUE "OriginalFilename", VER_ORIGINALFILENAME_STR
            VALUE "ProductName",      VER_PRODUCTNAME_STR
            VALUE "ProductVersion",   VER_PRODUCTVERSION_STR
            VALUE "CompanyName",      VER_COMPANYNAME_STR
        END
    END
    BLOCK "VarFileInfo"
    BEGIN
        /* The following line should only be modified for localized versions.     */
        /* It consists of any number of WORD,WORD pairs, with each pair           */
        /* describing a language,codepage combination supported by the file.      */
        /*                                                                        */
        /* For example, a file might have values "0x409,1252" indicating that it  */
        /* supports English language (0x409) in the Windows ANSI codepage (1252). */
        VALUE "Translation", 0x409, 1252
    END
END
