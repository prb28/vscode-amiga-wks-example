  
  SECTION    test1,code

  xdef       test1
  test1      :
  movem.l    d0-a6,-(sp)
  
  moveq      #0,d0
  moveq      #1,d1
  moveq      #2,d2
  moveq      #3,d3
  moveq      #4,d4
  moveq      #5,d5
  moveq      #6,d6
  moveq      #7,d7
  
  movem.l    (sp)+,d0-a6
  rts

  SECTION    gencopchip,data_c
  dc.w       2
  dc.w       3
  dc.w       4

  SECTION    test1public,data
  dc.w       2
  dc.w       3
  dc.w       4
 
  SECTION    test1publicbss,bss
  ds.w       2
  ds.w       3
  ds.w       4