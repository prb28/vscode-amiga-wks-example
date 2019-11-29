
  ;Changing section to gencop makes everything work again
  ;SECTION    gencop,CODE      
  SECTION    randomsection,CODE_C

  xdef       SubPartStart
  
SubPartStart:	
  xdef       SubPartPreCalc_IntroStart

SubPartPreCalc_IntroStart:	
  move.w     #0,d0
  move.w     #0,d0
  move.w     #0,d0
  move.w     #0,d0
  move.w     #0,d0
  bne.s      .exit                        ;already done

  movem.l    d2-d7/a2-a6,-(sp)            ;save
	
  movem.l    (sp)+,d2-d7/a2-a6            ;restore
.exit:
  rts

;Controller_Info:
;  dcb.b      512,5                              ;Init all to zero by default
;  EVEN

