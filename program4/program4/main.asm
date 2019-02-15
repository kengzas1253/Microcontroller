.INCLUDE"m328Pdef.inc"
.DEF   var_al = r16
.DEF   var_ah = r17
.DEF   var_b  = r18
.DEF   var_cl = r19
.DEF   var_ch = r20
.DEF   var_d  = r21

.CSEG
.ORG   0x0000
       rjmp RESET

RESET:  ldi  var_b, 220
        ldi  var_d,15
		ldi  var_cl,low(500)
		ldi  var_ch,high(500)

		mul  var_b,var_d
        movw  var_al,r0

		add  var_al,var_cl
		adc  var_ah,var_ch
	
		ldi zl, low(a) ; z = 0x10c
		ldi zh, high(a)

		st z+,var_al
		st z+,var_ah
		st z+,var_b
END:  rjmp END

.dseg
.org 0x010c
a:   .byte 2
b:   .byte 1



