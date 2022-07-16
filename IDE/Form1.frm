VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "C--IDE"
   ClientHeight    =   7575
   ClientLeft      =   150
   ClientTop       =   495
   ClientWidth     =   12750
   FillColor       =   &H00FFFFFF&
   BeginProperty Font 
      Name            =   "����"
      Size            =   10.5
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   7575
   ScaleWidth      =   12750
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "����"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   7215
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   1
      Text            =   "Form1.frx":424A
      Top             =   0
      Width           =   12735
   End
   Begin VB.Label Label1 
      Caption         =   "..."
      BeginProperty Font 
         Name            =   "����"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   60
      TabIndex        =   0
      Top             =   7320
      Width           =   12735
   End
   Begin VB.Menu NIMpopMenu 
      Caption         =   "NIMpopMenu"
      Visible         =   0   'False
      Begin VB.Menu mnuShow 
         Caption         =   "��ʾ����"
      End
      Begin VB.Menu mnuHide 
         Caption         =   "���ش���"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "�˳�����"
      End
   End
   Begin VB.Menu filemenu 
      Caption         =   "�ļ�"
      Begin VB.Menu createCfile 
         Caption         =   "�½�"
         Shortcut        =   ^N
      End
      Begin VB.Menu openCfile 
         Caption         =   "��"
         Shortcut        =   ^O
      End
      Begin VB.Menu saveCfile 
         Caption         =   "����"
         Shortcut        =   ^S
      End
      Begin VB.Menu save2Cfile 
         Caption         =   "���Ϊ"
      End
      Begin VB.Menu menuExit 
         Caption         =   "�˳�"
      End
   End
   Begin VB.Menu inputcom 
      Caption         =   "����"
      Begin VB.Menu inputsay 
         Caption         =   "���� say"
      End
      Begin VB.Menu inputwait 
         Caption         =   "���� wait"
      End
      Begin VB.Menu inputsleep 
         Caption         =   "���� sleep"
      End
      Begin VB.Menu inputexit 
         Caption         =   "���� exit"
      End
   End
   Begin VB.Menu run 
      Caption         =   "����"
      Begin VB.Menu run1 
         Caption         =   "ֱ������"
      End
      Begin VB.Menu run1save 
         Caption         =   "���沢����"
      End
      Begin VB.Menu run2 
         Caption         =   "��������"
      End
   End
   Begin VB.Menu Chelp 
      Caption         =   "����"
   End
   Begin VB.Menu about 
      Caption         =   "����"
      Begin VB.Menu aboutc 
         Caption         =   "����C--"
      End
      Begin VB.Menu aboutIDE 
         Caption         =   "����IDE"
      End
      Begin VB.Menu author 
         Caption         =   "��������"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'����

Option Explicit

'��������
Private Declare Function AnimateWindow Lib "user32" (ByVal hwnd As Long, ByVal dwTime As Long, ByVal dwFlags As Long) As Long
Private Const AW_HOR_POSITIVE = &H1
Private Const AW_HOR_NEGATIVE = &H2
Private Const AW_VER_POSITIVE = &H4
Private Const AW_VER_NEGATIVE = &H8
Private Const AW_CENTER = &H10
Private Const AW_HIDE = &H10000
Private Const AW_ACTIVATE = &H20000
Private Const AW_SLIDE = &H40000
Private Const AW_BLEND = &H80000

'Ӧ������ͼ��
Private Declare Function Shell_NotifyIcon Lib "shell32.dll" Alias "Shell_NotifyIconA" (ByVal dwMessage As Long, lpData As NOTIFYICONDATA) As Long
Private Type NOTIFYICONDATA
        cbSize As Long
        hwnd As Long
        uID As Long
        uFlags As Long
        uCallbackMessage As Long
        hIcon As Long
        szTip As String * 64
End Type
Private Const NIM_ADD = &H0
Private Const NIM_MODIFY = &H1
Private Const NIM_DELETE = &H2
Private Const NIF_MESSAGE = &H1
Private Const NIF_ICON = &H2
Private Const NIF_TIP = &H4
Private Const WM_MOUSEMOVE = &H200
Private Const WM_LBUTTONDBLCLK = &H203
Private Const WM_LBUTTONDOWN = &H201
Private Const WM_LBUTTONUP = &H202
Private Const WM_RBUTTONDBLCLK = &H206
Private Const WM_RBUTTONDOWN = &H204
Private Const WM_RBUTTONUP = &H205
Dim Nid As NOTIFYICONDATA


'������
Dim a
Private txtchange, changebox, titlechange As Boolean


'��дģ��
Dim newf As Integer
Dim Data As String
Dim filelocation As String
   Dim strFilt As String
   Dim strFile As String


'��ģ�� ����API����:
Private Declare Function GetOpenFileName Lib "Comdlg32.dll" Alias "GetOpenFileNameW" _
                             (pOpenfilename As OPENFILENAME) As Long

' дģ�� ����API������
Private Declare Function GetSaveFileName Lib "Comdlg32.dll" Alias "GetSaveFileNameW" _
                         (pOpenfilename As OPENFILENAME) As Long

 ' ��ȡ������
 Private Type OPENFILENAME
    lStructSize      As Long
    hWndOwner        As Long
    hInstance        As Long
    lpstrFilter      As Long
    lpstrCustFilter  As Long
    nMaxCustFilter   As Long
    nFilterIndex     As Long
    lpstrFile        As Long
    nMaxFile         As Long
    lpstrFileTitle   As Long
    nMaxFileTitle    As Long
    lpstrInitialDir  As Long
    lpstrTitle       As Long
    Flags            As Long
    nFileOffset      As Integer
    nFileExtension   As Integer
    lpstrDefExt      As Long
    lCustData        As Long
    lpfnHook         As Long
    lpTemplateName   As Long
End Type

Private Const OFN_HIDEREADONLY   As Long = 4&         ' ���ء�ֻ����ѡ��

Public Function ShowOpen(hWndOwner As Long, FileOpen As String, _
                        Optional Title As String = "�� C-- �ļ�", _
                        Optional Filter As String = "C--�ļ���*.C--��|*.C--", _
                        Optional FilterIndex As Long = 0&, _
                        Optional StartDir As String = vbNullChar, _
                        Optional Flags As Long = OFN_HIDEREADONLY) As Long
      Dim OpenFN  As OPENFILENAME
      Dim strFilt As String
      Dim strName As String
      Dim strTemp As String
 
   strName = String$(264&, 0)
   strTemp = strName
   strFilt = Replace(Replace(Filter & vbNullChar, "|", vbNullChar), ",", vbNullChar)
   OpenFN.lStructSize = 76&
   OpenFN.hWndOwner = hWndOwner
   OpenFN.hInstance = App.hInstance
   OpenFN.lpstrTitle = StrPtr(Title)
   OpenFN.lpstrFilter = StrPtr(strFilt)
   OpenFN.nFilterIndex = FilterIndex
   OpenFN.lpstrDefExt = 5& + StrPtr(strFilt) + InStrB(1&, Filter, "|")
   OpenFN.lpstrInitialDir = StrPtr(StartDir)
   OpenFN.lpstrFile = StrPtr(strName)
   OpenFN.nMaxFile = 256&
   OpenFN.lpstrFileTitle = StrPtr(strTemp)
   OpenFN.nMaxFileTitle = 256&
   OpenFN.Flags = Flags
   If (GetOpenFileName(OpenFN)) Then
      FileOpen = Left$(strName, InStr(1&, strName, vbNullChar) - 1&)
      ShowOpen = 0&
   Else
      ShowOpen = -1&
   End If
End Function

' ���溯����
Public Function ShowSave(hWndOwner As Long, FileOpen As String, _
                        Optional Title As String = "���� C-- �ļ�", _
                        Optional Filter As String = "C--�ļ���*.C--��|*.C--", _
                        Optional FilterIndex As Long = 0&, _
                        Optional StartDir As String = vbNullChar, _
                        Optional Flags As Long = &H806&) As Long
      Dim OpenFN  As OPENFILENAME
      Dim strFilt As String
      Dim strName As String
      Dim strTemp As String
 
   ' ���Ҫ����Ĭ���ļ��������Ҳ������һ��
   strName = FileOpen & vbNullChar & String$(264&, 0)
   strTemp = strName
   strFilt = Replace(Replace(Filter & vbNullChar, "|", vbNullChar), ",", vbNullChar)
   OpenFN.lStructSize = 76&
   OpenFN.hWndOwner = hWndOwner
   OpenFN.hInstance = App.hInstance
   OpenFN.lpstrTitle = StrPtr(Title)
   OpenFN.lpstrFilter = StrPtr(strFilt)
   OpenFN.nFilterIndex = FilterIndex
   OpenFN.lpstrDefExt = 5& + StrPtr(strFilt) + InStrB(1&, Filter, "|")
   OpenFN.lpstrInitialDir = StrPtr(StartDir)
   OpenFN.lpstrFile = StrPtr(strName)
   OpenFN.nMaxFile = 256&
   OpenFN.lpstrFileTitle = StrPtr(strTemp)
   OpenFN.nMaxFileTitle = 256&
   OpenFN.Flags = Flags
   If (GetSaveFileName(OpenFN)) Then
      FileOpen = Left$(strName, InStr(1&, strName, vbNullChar) - 1&)
      ShowSave = 0&
   Else
      ShowSave = -1&
   End If
End Function

''''''''''''''

'������Ϊ

Private Sub Form_Load()
'Ӧ������ͼ��
    If App.PrevInstance Then Unload Me
    Nid.cbSize = Len(Nid)
    Nid.hwnd = hwnd
    Nid.uID = vbNull
    Nid.uFlags = NIF_ICON Or NIF_TIP Or NIF_MESSAGE
    Nid.uCallbackMessage = WM_MOUSEMOVE
    Nid.hIcon = Form1.Icon
    Nid.szTip = "C--IDE" & vbNullChar
    Shell_NotifyIcon NIM_ADD, Nid
'��ʼ��
    Let Label1.Caption = "��ʼ���У����Ժ�..."
    Let changebox = True
    Let newf = 1
    Let Form1.Caption = "C--IDE" + " - " + "Untitled 1.C--"
    Let Text1.Text = "::C--File Create By C--IDE::"
'��ʼ������
    Let changebox = False
    Let txtchange = False
    Let titlechange = False
    Let Label1.Caption = "����"
End Sub


Private Sub Form_Unload(Cancel As Integer)
If txtchange = False Then
GoTo exitp
End If
a = MsgBox("�ļ��ѱ��޸ģ��Ƿ񱣴棿", vbQuestion + vbYesNoCancel)
If a = vbCancel Then
GoTo enderror
End If
If a = vbYes Then
'����
Let Label1.Caption = "�����У����Ժ�..."
If newf = 1 Then
   strFile = "Untitled 1"
   strFilt = "C--�ļ���*.C--��|*.C--" & vbNullChar
       If (ShowSave(Me.hwnd, strFile, , strFilt)) Then
       MsgBox "�û�ȡ����", 64
       GoTo enderror
       Else
       If Dir(strFile) <> "" Then
        Kill strFile
       End If
       Let filelocation = strFile
    Open filelocation For Append As #1
      Print #1, Text1.Text
      Close #1
    Let Form1.Caption = "C--IDE" + " - " + filelocation
    Let newf = 0
    Let txtchange = False
    Let titlechange = False
    Let Label1.Caption = "����"
   End If
  GoTo exitp
Else
    Kill filelocation
    Open filelocation For Append As #1
      Print #1, Text1.Text
      Close #1
      Let Form1.Caption = "C--IDE" + " - " + filelocation
      Let txtchange = False
      Let titlechange = False
      Let Label1.Caption = "����"
End If
Let Label1.Caption = "����"
strFile = " "
strFilt = " "
End If

exitp:
AnimateWindow hwnd, 500, AW_HIDE + AW_BLEND
Shell_NotifyIcon NIM_DELETE, Nid
End

enderror:
Cancel = 1
End Sub

''''''''''''''




'�˵���Ϊ

Private Sub Chelp_Click()
helpf.Show
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim msg As Single
    On Error Resume Next
    msg = X / Screen.TwipsPerPixelX
    Select Case msg
        Case WM_RBUTTONDOWN
        Case WM_RBUTTONUP
            PopupMenu NIMpopMenu
        Case WM_LBUTTONDBLCLK
            Form1.Show
    End Select
End Sub

''''''''''''''

'��ť��Ϊ

Private Sub createCfile_Click()
If txtchange = True Then
a = MsgBox("�ļ��ѱ��޸ģ��Ƿ񱣴棿", vbQuestion + vbYesNoCancel)
If a = vbCancel Then
GoTo newerror
End If
If a = vbYes Then
'����
Let Label1.Caption = "�����У����Ժ�..."
If newf = 1 Then
   strFile = "Untitled 1"
   strFilt = "C--�ļ���*.C--��|*.C--" & vbNullChar
       If (ShowSave(Me.hwnd, strFile, , strFilt)) Then
       MsgBox "�û�ȡ����", 64
       GoTo newerror
       Else
       If Dir(strFile) <> "" Then
        Kill strFile
       End If
       Let filelocation = strFile
    Open filelocation For Append As #1
      Print #1, Text1.Text
      Close #1
    Let Form1.Caption = "C--IDE" + " - " + filelocation
    Let newf = 0
    Let txtchange = False
    Let titlechange = False
    Let Label1.Caption = "����"
   End If
  GoTo newerror
Else
    Kill filelocation
    Open filelocation For Append As #1
      Print #1, Text1.Text
      Close #1
      Let Form1.Caption = "C--IDE" + " - " + filelocation
      Let txtchange = False
      Let titlechange = False
      Let Label1.Caption = "����"
End If
Let Label1.Caption = "����"
strFile = " "
strFilt = " "
End If
End If
    Let changebox = True
    Let newf = 1
    Let Form1.Caption = "C--IDE" + " - " + "Untitled 1.C--"
    Let Text1.Text = "::C--File Create By C--IDE::"
    Let filelocation = " "
    strFile = " "
    strFilt = " "
    Let changebox = False
    Let txtchange = False
    Let titlechange = False
newerror:
Let Label1.Caption = "����"
End Sub




Private Sub openCfile_Click()
If txtchange = True Then
a = MsgBox("�ļ��ѱ��޸ģ��Ƿ񱣴棿", vbQuestion + vbYesNoCancel)
If a = vbCancel Then
GoTo error
End If
If a = vbYes Then
'����
Let Label1.Caption = "�����У����Ժ�..."
If newf = 1 Then
   strFile = "Untitled 1"
   strFilt = "C--�ļ���*.C--��|*.C--" & vbNullChar
       If (ShowSave(Me.hwnd, strFile, , strFilt)) Then
       MsgBox "�û�ȡ����", 64
       GoTo error
       Else
       If Dir(strFile) <> "" Then
        Kill strFile
       End If
       Let filelocation = strFile
    Open filelocation For Append As #1
      Print #1, Text1.Text
      Close #1
    Let Form1.Caption = "C--IDE" + " - " + filelocation
    Let newf = 0
    Let txtchange = False
    Let titlechange = False
    Let Label1.Caption = "����"
   End If
  GoTo error
Else
    Kill filelocation
    Open filelocation For Append As #1
      Print #1, Text1.Text
      Close #1
      Let Form1.Caption = "C--IDE" + " - " + filelocation
      Let txtchange = False
      Let titlechange = False
      Let Label1.Caption = "����"
End If
Let Label1.Caption = "����"
strFile = " "
strFilt = " "
End If
End If
'��ȡ
Let Label1.Caption = "��ȡ�У����Ժ�..."
    strFilt = "C--�ļ���*.C--��|*.C--" & vbNullChar
   If (ShowOpen(Me.hwnd, strFile, , strFilt)) Then
         MsgBox "�û�ȡ����", 64
         GoTo error
   Else
     If Dir(strFile) <> "" Then
       Let changebox = True
        Let filelocation = strFile
        Let Form1.Caption = "C--IDE" + " - " + filelocation
        Let titlechange = False
        Let Text1.Text = ""
        Open filelocation For Input As #1
           Do Until EOF(1)
            Input #1, Data
            Text1.Text = Text1.Text + Data + vbNewLine
            EOF (1)
           Loop
       Close #1
       Let changebox = False
       Let Label1.Caption = "����"
       Let newf = 0
     Else
       MsgBox "�ļ������ڡ�", vbCritical + vbOKOnly
     End If
   End If
error:
Let Label1.Caption = "����"
strFile = " "
strFilt = " "
End Sub



Private Sub saveCfile_Click()
'����
Let Label1.Caption = "�����У����Ժ�..."
If newf = 1 Then
   strFile = "Untitled 1"
   strFilt = "C--�ļ���*.C--��|*.C--" & vbNullChar
       If (ShowSave(Me.hwnd, strFile, , strFilt)) Then
       MsgBox "�û�ȡ����", 64
       GoTo errorsave
       Else
       If Dir(strFile) <> "" Then
        Kill strFile
       End If
       Let filelocation = strFile
    Open filelocation For Append As #1
      Print #1, Text1.Text
      Close #1
    Let Form1.Caption = "C--IDE" + " - " + filelocation
    Let newf = 0
    Let txtchange = False
    Let titlechange = False
    Let Label1.Caption = "����"
   End If
  GoTo errorsave
Else
    Kill filelocation
    Open filelocation For Append As #1
      Print #1, Text1.Text
      Close #1
      Let Form1.Caption = "C--IDE" + " - " + filelocation
      Let txtchange = False
      Let titlechange = False
      Let Label1.Caption = "����"
End If
errorsave:
Let Label1.Caption = "����"
strFile = " "
strFilt = " "
End Sub

Private Sub save2Cfile_Click()
'����
Let Label1.Caption = "�����У����Ժ�..."
    strFilt = "C--�ļ���*.C--��|*.C--" & vbNullChar
    If (ShowSave(Me.hwnd, strFile, , strFilt)) Then
       MsgBox "�û�ȡ����", 64
       GoTo errorsave2
    Else
       If Dir(strFile) <> "" Then
        Kill strFile
       End If
       Let filelocation = strFile
    Open filelocation For Append As #1
      Print #1, Text1.Text
      Close #1
    Let Form1.Caption = "C--IDE" + " - " + filelocation
    Let newf = 0
    Let txtchange = False
    Let titlechange = False
    Let Label1.Caption = "����"
    End If
errorsave2:
Let Label1.Caption = "����"
strFile = " "
strFilt = " "
End Sub


Private Sub run1_Click()
Let Label1.Caption = "���ڳ�������..."
If Dir(App.Path & "\C--.bat") <> "" Then
       If Dir(App.Path & "\temp.c--") <> "" Then
        Kill App.Path & "\temp.c--"
       End If
Open App.Path & "\temp.c--" For Append As #1
      Print #1, Text1.Text
      Close #1
Shell Chr(34) + App.Path & "\C--.bat" + Chr(34) + " file " + App.Path & "\temp.c-- tmp", vbNormalFocus
Let Label1.Caption = "����"
Exit Sub
End If
MsgBox "�޷��ҵ�������", vbCritical + vbOKOnly
Let Label1.Caption = "����"
End Sub


Private Sub run1save_Click()
saveCfile_Click
Let Label1.Caption = "���ڳ�������..."
If Dir(App.Path & "\C--.bat") <> "" Then
    If filelocation <> "" Then
        If Dir(filelocation) <> "" Then
         Shell Chr(34) + App.Path & "\C--.bat" + Chr(34) + " file " + filelocation, vbNormalFocus
         Let Label1.Caption = "����"
        Exit Sub
        End If
    End If
 MsgBox "�ļ������ڡ�", vbCritical + vbOKOnly
 Let Label1.Caption = "����"
        Exit Sub
End If
MsgBox "�޷��ҵ�������", vbCritical + vbOKOnly
Let Label1.Caption = "����"
End Sub

Private Sub run2_Click()
saveCfile_Click
Let Label1.Caption = "���ڳ�������..."
If Dir(App.Path & "\C--.bat") <> "" Then
    If filelocation <> "" Then
        If Dir(filelocation) <> "" Then
         Shell Chr(34) + App.Path & "\C--.bat" + Chr(34) + " file " + filelocation + " write", vbNormalFocus
         Let Label1.Caption = "����"
        Exit Sub
        End If
    End If
 MsgBox "�ļ������ڡ�", vbCritical + vbOKOnly
 Let Label1.Caption = "����"
        Exit Sub
End If
MsgBox "�޷��ҵ�������", vbCritical + vbOKOnly
Let Label1.Caption = "����"
End Sub


Private Sub inputsay_Click()
    Let Text1.Text = Text1.Text + Chr(13) + "say#" + Chr(34) + Chr(34)
End Sub

Private Sub inputwait_Click()
    Let Text1.Text = Text1.Text + Chr(13) + "wait#"
End Sub

Private Sub inputsleep_Click()
    Let Text1.Text = Text1.Text + Chr(13) + "sleep#" + Chr(34) + Chr(34)
End Sub

Private Sub inputexit_Click()
    Let Text1.Text = Text1.Text + Chr(13) + "exit#"
End Sub



Private Sub aboutc_Click()
    aboutcf.Show
End Sub

Private Sub aboutIDE_Click()
    aboutIDEf.Show
End Sub

Private Sub author_Click()
    aboutauthor.Show
End Sub

Private Sub menuExit_Click()
    Unload Me
End Sub

Private Sub mnuExit_Click()
    Unload Me
End Sub

Private Sub mnuHide_Click()
    Form1.Hide
End Sub

Private Sub mnuShow_Click()
    Form1.Show
End Sub

''''''''''''''

Private Sub Text1_Change()
If changebox = False Then
 Let txtchange = True
 If titlechange = False Then
 Me.Caption = Me.Caption & "*"
 Let titlechange = True
 End If
End If
End Sub

