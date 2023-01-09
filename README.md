# Launch in MiniMicro
This is a [Visual Studio Code](https://code.visualstudio.com/) [task](https://code.visualstudio.com/docs/editor/tasks#vscode) and an [AutoHotkey](https://www.autohotkey.com/) script to enable easy launching of a script in [MiniMicro](https://miniscript.org/MiniMicro/) on Windows.

## The script
The [autohotkey script](LaunchInMiniMicro.ahk) (or the [compiled executable](LaunchInMiniMicro.exe) of it) tries to launch or switch to Mini Micro, and then send the commands to reset, load the file, and then run it.

### Launch Arguments
The first argument needs to be the path to a folder you have mounted in Mini Micro. In Visual Studio Code, `${workspaceFolder}` can be used to pass in the workspace folder.

The second argument should be the path to the file you want to open. In Visual Studio Code, `${file}` can be used to pass the path to the current file.

The third argument must be the path to Mini Micro.

The fourth argument is optional and can be used to pass launch arguments to Mini Micro when opening it. When using VSCode, it is recommended to automatically mount either the usr or usr2 folder. Here are some example launch arguments for Mini Micro: `"-scale 1 -screen-fullscreen 1 -usr2 ${workspaceFolder}"`

The fifth argument is also optional and it lets you choose which disk to look in, for example: `/usr2`

## The task
The [VSCode task](tasks.json) can be used to automatically run the script. 
The `command` key in the task should be set to the path to where the script is stored locally.
In the `args` key, the third argument should be set to the path to Mini Micro.