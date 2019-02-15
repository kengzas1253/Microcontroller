.include "m328Pdef.inc"

.def var_ah = r16
.def var_al = r17
.def var_ch =r18
.def var_cl =r19
.def var_d  =r20

.cseg
.org  0x00
      rjmp main

main:  ldi var_ah,0
       ldi var_al,0
for:   cpi var_al,100
	   brlo loop
	   rjmp endfor
   
loop:  inc var_al 
       add var_cl,var_al
       adc var_ch,var_ah
	   rjmp for

endfor:   ldi zl,low(a)
          ldi  zh,high(a)

		  st z+,var_cl
		  st z+,var_ch

          rjmp end   

end: rjmp end

.dseg
.org 0x100
a: .byte 2

.eseg
