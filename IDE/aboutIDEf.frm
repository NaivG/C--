VERSION 5.00
Begin VB.Form aboutIDEf 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "关于IDE"
   ClientHeight    =   2265
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   3195
   Icon            =   "aboutIDEf.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2265
   ScaleWidth      =   3195
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  '窗口缺省
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "版本号：v1.312beta"
      Height          =   375
      Left            =   720
      TabIndex        =   2
      Top             =   1800
      Width           =   1695
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "C--IDE是一个轻量化、用于高效编写C--文件的IDE。"
      Height          =   495
      Left            =   360
      TabIndex        =   1
      Top             =   1200
      Width           =   2535
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "C--IDE"
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
      TabIndex        =   0
      Top             =   480
      Width           =   1215
   End
   Begin VB.Image Image1 
      Height          =   945
      Left            =   360
      Picture         =   "aboutIDEf.frx":424A
      Stretch         =   -1  'True
      Top             =   120
      Width           =   945
   End
End
Attribute VB_Name = "aboutIDEf"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

