VERSION 5.00
Begin VB.Form helpf 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "����"
   ClientHeight    =   5085
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   5505
   Icon            =   "helpf.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5085
   ScaleWidth      =   5505
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  '����ȱʡ
   Begin VB.Timer Timer1 
      Left            =   4920
      Top             =   4080
   End
   Begin VB.ListBox List1 
      Appearance      =   0  'Flat
      Height          =   4170
      ItemData        =   "helpf.frx":424A
      Left            =   360
      List            =   "helpf.frx":425A
      TabIndex        =   0
      Top             =   480
      Width           =   1335
   End
   Begin VB.Label Label6 
      BackStyle       =   0  'Transparent
      Caption         =   "C-- �����и��ô�������Կ۵��ո���Ϊ��������֧��"
      BeginProperty Font 
         Name            =   "����"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2160
      TabIndex        =   6
      Top             =   4080
      Width           =   2775
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "..."
      BeginProperty Font 
         Name            =   "����"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   2280
      TabIndex        =   5
      Top             =   2520
      Width           =   2535
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "ʵ��"
      BeginProperty Font 
         Name            =   "����"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2160
      TabIndex        =   4
      Top             =   2160
      Width           =   615
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "..."
      BeginProperty Font 
         Name            =   "����"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   2280
      TabIndex        =   3
      Top             =   600
      Width           =   2535
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "����"
      BeginProperty Font 
         Name            =   "����"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2160
      TabIndex        =   2
      Top             =   240
      Width           =   615
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "�����б�"
      BeginProperty Font 
         Name            =   "����"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   360
      TabIndex        =   1
      Top             =   240
      Width           =   1215
   End
End
Attribute VB_Name = "helpf"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim times As Integer

Private Sub Form_Load()
Timer1.Interval = 5000
times = 2
Timer1.Enabled = True
End Sub


Private Sub List1_Click()
If List1.Selected(0) = True Then
Let Label3.Caption = "say����" + Chr(13) + "  ��ʾ��Ϣ����ͬ������˼���׶�"
Let Label5.Caption = "say#" + Chr(34) + "helloworld" + Chr(34) + Chr(13) + "�����helloworld"
End If
If List1.Selected(1) = True Then
Let Label3.Caption = "wait����" + Chr(13) + "  ��ִͣ�����ֱ���������������"
Let Label5.Caption = "wait#" + Chr(13) + "�����Wait for any key..."
End If
If List1.Selected(2) = True Then
Let Label3.Caption = "sleep����" + Chr(13) + "  ��ʱִ����һ���������Ϊ��λ��"
Let Label5.Caption = "sleep#" + Chr(34) + "3" + Chr(34) + Chr(13) + "�������ʱ3��ִ����һ������"
End If
If List1.Selected(3) = True Then
Let Label3.Caption = "exit����" + Chr(13) + "  ����ִ�����" + Chr(13) + "ע�⣬��������ؼӣ����򱨴�"
Let Label5.Caption = "exit#"
End If
End Sub

Private Sub Timer1_Timer()
Call ds
End Sub

Private Sub ds()
If times = 2 Then
Let Label6.Caption = "��ѷ�����ṩ��ȫ��γ̣���֤�������� 1 ����������"
Let times = times + 1
GoTo ano
End If
If times = 3 Then
Let Label6.Caption = "ȫ���� 97% ��ҵ��С��ض�������C--"
Let times = times + 1
GoTo ano
End If
If times = 4 Then
Let Label6.Caption = "�ź������ 100% �ļ�������� C--"
Let times = times + 1
GoTo ano
End If
If times = 5 Then
Let Label6.Caption = "�˰汾��������������ʵ�� �ź��� ��ʿ�ڹ�Ԫǰ������"
Let times = times + 1
GoTo ano
End If
If times = 5 Then
Let Label6.Caption = "C-- ��������������Σ�յļ��㻷���¹�������Ϸ"
Let times = times + 1
GoTo ano
End If
Let times = 2
Let Label6.Caption = "C-- �����и��ô��������Կ۵��ո���Ϊ��������֧��"
ano:
End Sub
