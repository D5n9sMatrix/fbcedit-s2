Type Vector
    Dim As Integer element(Any)
    Declare Sub Resize(Byval n As Integer)
    Declare Property Ubound() As Integer
End Type

Sub Vector.Resize(Byval n As Integer)
    Redim Preserve This.element(n - 1)
End Sub

Property Vector.Ubound() As Integer
    Return ..Ubound(This.element)
End property

'----------------------------------------------

Dim As Vector indexedVector()

' Creating a first vector (index 0)
Redim Preserve indexedVector(Ubound(indexedVector) + 1)
' Sizing this first vector (index 0)
indexedVector(0).Resize(2)
' Filling this first vector (index 0)
For I As Integer = 0 To indexedVector(0).Ubound
    indexedVector(0).element(I) = I + 1
Next I

' Adding a seconf vector (index 1)
Redim Preserve indexedVector(Ubound(indexedVector) + 1)
' Sizing this second vector (index 1)
indexedVector(1).Resize(3)
' Filling this second vector (index 1)
For I As Integer = 0 To indexedVector(1).Ubound
    indexedVector(1).element(I) = I + 1
Next I

' Printing all indexed vectors
For K As Integer = 0 To Ubound(indexedVector)
    For I As Integer = 0 To indexedVector(K).Ubound
        Print indexedVector(K).element(I),
    Next I
    Print
Next K

Sleep
