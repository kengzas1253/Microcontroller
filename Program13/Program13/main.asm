;Homework
.include "m328Pdef.inc"
.def var_i  = r16
.def var_j  = r17
.def templ  = r18
.def temph  = r19

.cseg
.org 0x00
     rjmp main
main:   ldi yl,low(SARARY)
        ldi yh,high(SARARY)
		ldi templ,$56    ;0x1F56
		ldi temph,$1F
        clr var_i
		clr var_j
for_i:    cpi var_i,10    ;i<10
         brsh end    ;break when i>=10
	    ;rjmp end.
for_j:    cpi var_j,50
         brlo loop
		 inc var_i
		 clr var_j
         rjmp for_i
		
loop:  st y+, templ
       st y+, temph
       inc var_j
	   adiw x,1
	   rjmp for_j

end:   rjmp end

.dseg
.org 0x100
SARARY: .byte 2*500
