; Launch or switch to Mini Micro and then send the commands to reset, load a file, and then run it.
; The first argument needs to be the path to a folder you have mounted in Mini Micro.
; In Visual Studio Code, ${workspaceFolder} can be used to pass in the workspace folder.
; The second argument should be the path to the file you want to open.
; In Visual Studio Code, ${file} cab be used to pass the path to the current file.
; The third argument must be the path to Mini Micro.

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.


; Alert the user if he doesn't provide the first three required launch arguments.
arg1 = %1% 
arg2 = %2% 
arg3 = %3% 
if (arg1 == "")
{
    MsgBox % "You must provide the path to the folder you have mounted in Mini Micro as the first launch argument."
    ExitApp, 1
}
if (arg2 == "")
{
    MsgBox % "You must provide the path to the file you want to launch in Mini Micro as the second launch argument."
    ExitApp, 1
}
if (arg3 == "")
{
    MsgBox % "You must provide the path to Mini Micro as the third launch argument."
    ExitApp, 1
}

; Launch Mini Micro if it isn't open, otherwise switch to it. 
Process, Exist, Mini Micro.exe
if (ErrorLevel == 0)
{
    Run, "%arg3%" %4%
}
else
{
    WinActivate, Mini Micro
}

; Wait until the Mini Micro window is active.
WinWaitActive, Mini Micro
; Find the path to the file in Mini Micro by using the file path and folder path.
folderPath = %arg1%
fullPath = %arg2%
filePath := StrReplace(fullPath, folderPath)
filePath := StrReplace(filePath, "\", "/")

; Send the reset command and then the load file and run commands.
Send, reset{enter}load "%5%%filePath%"{enter}run{enter}