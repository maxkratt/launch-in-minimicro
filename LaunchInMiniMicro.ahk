; LaunchInMiniMicro - this script tries to launch or switch to Mini Micro and then send the commands
; to reset, load a file, and then run it.

; The first argument needs to be the path to a folder you have mounted in Mini Micro.
; In Visual Studio Code, ${workspaceFolder} can be used to pass in the workspace folder.
; The second argument should be the path to the file you want to open.
; In Visual Studio Code, ${file} can be used to pass the path to the current file.
; The third argument must be the path to Mini Micro.
; The fourth argument is optional and can be used to pass launch arguments to Mini Micro when opening it.
; When using VSCode, it is recommended to automatically mount either the usr or usr2 folder. Here are some 
; example launch arguments for Mini Micro: "-scale 1 -screen-fullscreen 1 -usr2 ${workspaceFolder}"
; The fifth argument is also optional and it lets you choose which disk to look in, for example: /usr2

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

; Alert the user if he doesn't provide the first three required launch arguments.
folderPath = %1%
fullPath = %2%
miniMicroPath = %3%
disk = %5%
if (folderPath == "")
{
    MsgBox % "You must provide the path to the folder you have mounted in Mini Micro as the first launch argument."
    ExitApp, 1
}
if (fullPath == "")
{
    MsgBox % "You must provide the path to the file you want to launch in Mini Micro as the second launch argument."
    ExitApp, 1
}
if (miniMicroPath == "")
{
    MsgBox % "You must provide the path to Mini Micro as the third launch argument."
    ExitApp, 1
}
; If the fifth argument is empty, try to load the file from the first user disk.
if (disk == "")
{
    disk = /usr
}

; Launch Mini Micro if it isn't open, otherwise switch to it. 
Process, Exist, Mini Micro.exe
if (ErrorLevel == 0)
{
    Run, "%miniMicroPath%" %4%
}
else
{
    WinActivate, Mini Micro
}

; Wait until the Mini Micro window is active.
WinWaitActive, Mini Micro
; Find the path to the file in Mini Micro by using the file path and folder path.
filePath := StrReplace(fullPath, folderPath)
filePath := StrReplace(filePath, "\", "/")

; Send the reset command and then the load file and run commands.
Send, reset{enter}load "%disk%%filePath%"{enter}run{enter}