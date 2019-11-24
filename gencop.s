  SECTION    gencop,code

  xref       test1
  xref       SubPartPreCalc_IntroStart
init:
  movem.l    d0-a6,-(sp)
  move.l     4.w,a6                       ; execbase
  clr.l      d0    
  jsr        test1    
  jsr        SubPartPreCalc_IntroStart              
  movem.l    (sp)+,d0-a6
  rts

  SECTION    gencopchip,data_c
;  dcb.w      511,2

  SECTION    gencoppublic,data
  dc.w       2
  dc.w       3
  dc.w       4
 
  SECTION    gencop,code
 ; dcb.w      511,2

  ds.w       2
  ds.w       3
  ds.w       4

 