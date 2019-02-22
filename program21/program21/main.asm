; program21.asm
.INCLUDE "m328Pdef.inc"
.DEF	VAR_A = R16
.DEF	VAR_B = R17
.DEF	VAR_CL = R18
.DEF	VAR_CH = R19
.DEF	BASE = R20
.DEF	EXPONENT = R21
.DEF	RESULT_L = R22
.DEF	RESULT_H = R23
.CSEG
.ORG	0x0000
	rjmp	RESET
RESET:
MAIN:	ldi	VAR_A, 2
	ldi	VAR_B, 15
	mov	BASE, VAR_A
	mov	EXPONENT, VAR_B
	rcall	POWERS
	movw	VAR_CL, RESULT_L
	mov	VAR_A, VAR_B
END:	rjmp	END
POWERS:	push 	R16 	; kl 
		push 	R17	; kh  		push 		push	R24	; byte 0
		push	R25	; byte 1
		push	R26	; byte 2
		push 	R27	; i

		ldi	R16, 0x01 
		ldi	R17, 0x00 ; clr R17	
;k = 0x0001 = 1
		clr	R27	; i = 0
FOR:	cp	R27, EXPONENT
	brlo	LOOP
	rjmp	ENDFOR

LOOP:	mul	R16, BASE
	movw	R24, R0  ; R25:R24
	clr	R26	; R26 = 0
	mul	R17, BASE ; R1:R0
	add	R25, R0
	adc	R26, R1
	movw	R16, R24	 		
	inc	R27
	rjmp	FOR
ENDFOR: 	movw	RESULT_L, R16

		pop	R27
		pop	R26
		pop	R25
		pop	R24
		pop	R17
		pop	R16

		ret
