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
## Debug the application
- Add a breakpoint to the file
- Type F5 to start debugging

## Build for Windows of Linux
- Build [VASM](http://sun.hasenbraten.de/vasm/index.php?view=main)
- Build [VLINK](http://sun.hasenbraten.de/vlink/index.php?view=main)
- Build a modified version of [Fs-UAE](https://github.com/prb28/fs-uae)
- Download/Build [CAPSTONE](http://www.capstone-engine.org/download.html)
- Modify the settings and the launch configuration to this new binaries

## Commands
### Memory dump
In the debug command field type
```
mm address|${register|symbol}, size[, wordSizeInBytes, rowSizeInWords,ab]
       a: show ascii output, b: show bytes output
```
examples:
```
m 5850,10,2,4
m ${mycopperlabel},10,2,4
```
will print:
```
01fc 0000 0100 0200 | ........
```
### Disassembled Memory dump
```
m address|${register|symbol},size,d
```
example:
```
m ${pc},10,d
```
### Set memory
```
M address|${register|symbol}=bytes
```
examples:
```
M 5c50=0ff534
M ${mycopperlabel}=0ff534
```
