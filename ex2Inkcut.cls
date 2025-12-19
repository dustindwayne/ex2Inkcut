VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "ex2Inkcut"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Sub Export_to_Inkcut()

    If ActiveSelectionRange.Count = 0 Then
        MsgBox "Please select at least one shape to export.", vbExclamation, "Export SVG for Print"
        Exit Sub
    End If

    Dim svgFilePath As String
    svgFilePath = Environ("TEMP") & "\selected_shapes.svg"

    Dim FilterObject As ExportFilter
    Dim prevUnit As cdrUnit
    prevUnit = ActiveDocument.Unit
    On Error GoTo ExportError ' Error handling

    ActiveDocument.Unit = cdrInch
    Set FilterObject = ActiveDocument.ExportEx(svgFilePath, cdrSVG, cdrSelection)
    With FilterObject
        .TextAsCurves = True
        .width = ActiveSelection.SizeWidth
        .height = ActiveSelection.SizeHeight
        .Units = inches
    End With
    FilterObject.Finish

    ActiveSelection.Outline.Width = 0.005
    ActiveSelection.Outline.Color.HexValue = "#FF0000"

    ActiveDocument.Unit = prevUnit

    Dim inkscapeCmd As String
    inkscapeCmd = "python -m inkcut open " & Chr(34) & svgFilePath & Chr(34)

    Dim shellCmd As String
    shellCmd = "powershell.exe /c " & inkscapeCmd

    Dim wshShell As Object
    Set wshShell = CreateObject("WScript.Shell")
    wshShell.Run shellCmd, 0, True

    Exit Sub

ExportError:
    ActiveDocument.Unit = prevUnit
    MsgBox "Error during export: " & Err.Description, vbCritical, "Export Error"
End Sub

