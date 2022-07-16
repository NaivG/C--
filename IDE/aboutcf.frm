VERSION 5.00
Begin VB.Form aboutcf 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "关于C--"
   ClientHeight    =   5535
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   8895
   Icon            =   "aboutcf.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5535
   ScaleWidth      =   8895
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  '窗口缺省
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3975
      Left            =   240
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "aboutcf.frx":424A
      Top             =   1320
      Width           =   8415
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "创立者：张浩扬 博士"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   5760
      TabIndex        =   2
      Top             =   645
      Width           =   2655
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "C--语言"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   15
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1560
      TabIndex        =   1
      Top             =   600
      Width           =   1215
   End
   Begin VB.Image Image2 
      Height          =   945
      Left            =   4560
      Picture         =   "aboutcf.frx":4E6E
      Stretch         =   -1  'True
      Top             =   240
      Width           =   945
   End
   Begin VB.Image Image1 
      Height          =   945
      Left            =   360
      Picture         =   "aboutcf.frx":90B8
      Stretch         =   -1  'True
      Top             =   240
      Width           =   945
   End
End
Attribute VB_Name = "aboutcf"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

