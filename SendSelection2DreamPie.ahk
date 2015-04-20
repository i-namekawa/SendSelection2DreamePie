;
; SendSelecion2DreamPie Version: 1.0
; Language:       English
; Platform:       Win9x/NT
; Author:         https://github.com/i-namekawa
;
; Script Function:
;   Send and execute the selected text to DreamPie by F9
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance ignore
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


ActivateDreampie()
{
    IfWinExist DreamPie ahk_class gdkWindowToplevel
    {
    WinActivate, DreamPie
    WinWaitActive, DreamPie
    }
}

F9::
WinGetActiveTitle, editor
old_clipboard = %clipboard%

Send, ^c
ActivateDreampie()
send, {tab}
; WinActivate gdkWindowChild2
Send, ^a
Send, {Del}
Send, ^v
Send, ^{Enter}

WinActivate, %editor%,
clipboard = %old_clipboard%
return


