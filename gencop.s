;------------------------------
; Example of file loading
;---------- Includes ----------
               INCDIR     "include"
               INCLUDE    "funcdef.i"
               INCLUDE    "exec/exec_lib.i"
               INCLUDE    "dos/dos_lib.i"
               INCLUDE    "dos/dos.i"
               INCLUDE    "hardware/cia.i"
;---------- Const ----------

CIAA    = $00bfe001
SysBase = 4

init:
               movem.l    d0-a6,-(sp)
               move.l     SysBase,a6                                                               ; execbase

       ; load dos library
               lea        dosname,a1                                                               ;dos.library name string
               jsr        _LVOOldOpenLibrary(a6)                                                   ; opens dos.library and put it in d0
               move.l     d0,(dosaddress)                                                          ; copy lib address to a1
               move.l     d0,a1                                                                    ; copy lib address to a1
        ; set program
        ;        move.l     #progname,d1              ; program name
        ;        move.l     dosaddress,a1
        ;        jsr        -570(a1) 
        ;        tst.l      d0				
        ;        beq        on_error

        ;        move.l     #progdir,d1               ; program dir
        ;        move.l     dosaddress,a1
        ;        jsr        -558(a1) 
        ;        tst.l      d0				
        ;        beq        on_error
;Function offsets from : http://amigadev.elowar.com/read/ADCD_2.1/Includes_and_Autodocs_2._guide/node0550.html

        ; Get GetProgramName
        ;success = GetProgramName(buf, len)
        ;D0                       D1   D2
               move.l     #progname,d1                                                             ; program dir
               move.l     20,d2
               jsr        -576(a1) 
               tst.l      d0				
               beq        on_error


       ; load raw file contents
       ; open the file
               move.l     #filename,d1                                                             ; Path pointer
               move.l     #MODE_OLDFILE,d2                                                         ; Read mode
               move.l     dosaddress,a1
               jsr        _LVOOpen(a1)                                                             ; Open file
               tst.l      d0				
               beq        on_error
       ; read the first byte
               move.l     d0,d1                                                                    ; fileHandler to d1
               move.l     d0,(fileh)                                                               ; fileHandler to save
               move.l     #filecontents,d2                                                         ; buffer address to d2
               move.l     2.l,d3                                                                   ; file length
               move.l     dosaddress,a1
               jsr        _LVORead(a1)                                                             ; Read file
               move.b     -1,d7
               cmp.b      d0,d7				
               beq        on_error
       ; close the file
               move.l     fileh,d1                                                                 ; fileHandler to d1
               move.l     dosaddress,a1
               jsr        _LVOClose(a1)                                                            ; close file

       ; wait for mouse click

******************************************************************	
exit:
              ; closes library
               move.l     dosaddress,a1
               move.l     SysBase,a6                                                               ; execbase
               jsr        _LVOCloseLibrary(a6)                                                     ; closes dos.library in a1
               movem.l    (sp)+,d0-a6
               clr        d0                                                                       ; Return code of the program
               rts                                                                                 ; End

on_error:
       ; calling ioError
               move.l     dosaddress,a1
               jsr        _LVOIoErr(a1)
               jmp        exit

******************************************************************
dosname:
               DOSNAME
               even
fileh:         dc.l       0
dosaddress:    dc.l       0
filename:      dc.b       'file.raw',0
progname:      dc.b       0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
progdir:       dc.b       0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
filecontents:  dc.l       0,0,0,0,0,0
