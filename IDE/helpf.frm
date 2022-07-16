VERSION 5.00
Begin VB.Form helpf 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "帮助"
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
   StartUpPosition =   3  '窗口缺省
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
      Caption         =   "C-- 命令有个好处，你可以扣掉空格，因为它根本不支持"
      BeginProperty Font 
         Name            =   "宋体"
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
         Name            =   "宋体"
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
      Caption         =   "实例"
      BeginProperty Font 
         Name            =   "宋体"
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
         Name            =   "宋体"
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
      Caption         =   "详情"
      BeginProperty Font 
         Name            =   "宋体"
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
      Caption         =   "命令列表"
      BeginProperty Font 
         Name            =   "宋体"
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
Let Label3.Caption = "say命令" + Chr(13) + "  显示信息，如同字面意思简单易懂"
Let Label5.Caption = "say#" + Chr(34) + "helloworld" + Chr(34) + Chr(13) + "结果：helloworld"
End If
If List1.Selected(1) = True Then
Let Label3.Caption = "wait命令" + Chr(13) + "  暂停执行命令，直到按下任意键继续"
Let Label5.Caption = "wait#" + Chr(13) + "结果：Wait for any key..."
End If
If List1.Selected(2) = True Then
Let Label3.Caption = "sleep命令" + Chr(13) + "  延时执行下一条命令（以秒为单位）"
Let Label5.Caption = "sleep#" + Chr(34) + "3" + Chr(34) + Chr(13) + "结果：延时3秒执行下一条命令"
End If
If List1.Selected(3) = True Then
Let Label3.Caption = "exit命令" + Chr(13) + "  结束执行命令。" + Chr(13) + "注意，此条命令必加，否则报错。"
Let Label5.Caption = "exit#"
End If
End Sub

Private Sub Timer1_Timer()
Call ds
End Sub

Private Sub ds()
If times = 2 Then
Let Label6.Caption = "疼逊课堂提供了全面课程，保证您可以在 1 分钟内上手"
Let times = times + 1
GoTo ano
End If
If times = 3 Then
Let Label6.Caption = "全国有 97% 企业级小便池都在运行C--"
Let times = times + 1
GoTo ano
End If
If times = 4 Then
Let Label6.Caption = "张浩扬国有 100% 的计算机运行 C--"
Let times = times + 1
GoTo ano
End If
If times = 5 Then
Let Label6.Caption = "此版本看起来弱，但其实是 张浩扬 博士于公元前制作的"
Let times = times + 1
GoTo ano
End If
If times = 5 Then
Let Label6.Caption = "C-- 技术让您可以在危险的计算环境下工作和游戏"
Let times = times + 1
GoTo ano
End If
Let times = 2
Let Label6.Caption = "C-- 命令有个好处，您可以扣掉空格，因为它根本不支持"
ano:
End Sub
