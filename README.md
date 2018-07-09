# Example project for Amiga assembly debugging
Example of vscode workspace for Amiga Assembly building and debugging.
The binaries are build for Osx.

![Debugging sesion](images/debugSession.gif)

## Setup VSCode
- Clone this repository
- Install the 0.7.0 Amiga Assembly vscode extension from the vsix file
- Launch VSCode
- type F1 and select the option "Extension: Install from VSIX..."
## Build the assembly file
- Open the 'gencode.s' file
- Click on 'Build' in the bottom status bar 
## Debug the application
- Add a breakpoint to the file
- Type F5 to start debugging

## Build for Windows of Linux
- Build [VASM](http://sun.hasenbraten.de/vasm/index.php?view=main)
- Build [VLINK](http://sun.hasenbraten.de/vlink/index.php?view=main)
- Build a modified version of [Fs-UAE](https://github.com/prb28/fs-uae)
- Modify the settings and the launch configuration to this new binaries

## Commands
### Memory dump
In the debug command field type
```
m address,size[,wordSizeInBytes,rowSizeInWords]
```
example :
```
m 5850,10,2,4
```
will print :
```
01fc 0000 0100 0200 | ........
```

