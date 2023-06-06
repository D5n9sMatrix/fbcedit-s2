Type Matrix
    Dim As Integer element(Any, Any)
    Declare Sub Resize(Byval n1 As Integer, Byval n2 As Integer)
    Declare Property Ubound(Byval n As Integer) As Integer
End Type

Sub Matrix.Resize(Byval n1 As Integer, Byval n2 As Integer)
    Redim Preserve This.element(n1 - 1, n2 - 1)
End Sub

Property Matrix.Ubound(Byval n As Integer) As Integer
    Return ..Ubound(This.element, n)
End property

'---------------------------------------------------------------

Dim As Matrix indexedMatrix()

' Creating a first matrix (index 0)
Redim Preserve indexedMatrix(Ubound(indexedMatrix) + 1)
' Sizing this first matrix (index 0)
indexedMatrix(0).Resize(2, 3)
' Filling this first matrix (index 0)
For I As Integer = 0 To indexedMatrix(0).Ubound(1)
    For J As Integer = 0 To indexedMatrix(0).Ubound(2)
        indexedMatrix(0).element(I, J) = I * 10 + J + 1
    Next J
Next I

' Adding a seconf matrix (index 1)
Redim Preserve indexedMatrix(Ubound(indexedMatrix) + 1)
' Sizing this second matrix (index 1)
indexedMatrix(1).Resize(4, 5)
' Filling this second matrix (index 1)
For I As Integer = 0 To indexedMatrix(1).Ubound(1)
    For J As Integer = 0 To indexedMatrix(1).Ubound(2)
        indexedMatrix(1).element(I, J) = I * 10 + J + 1
    Next J
Next I

' Printing all indexed matrices
For K As Integer = 0 To Ubound(indexedMatrix)
    For I As Integer = 0 To indexedMatrix(K).Ubound(1)
        For J As Integer = 0 To indexedMatrix(K).Ubound(2)
            Print indexedMatrix(K).element(I, J),
        Next J
        Print
    Next I
    Print
Next K

Sleep
