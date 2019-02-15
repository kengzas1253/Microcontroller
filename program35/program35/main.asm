.include "m328Pdef.inc"
.def var_a = r16
.def var_b = r17

.cseg
.org 0x00
     rjmp reset
reset:  ldi var_a,0x00 ;input
        out DDRC, var_a
		ldi var_a,0xff  ;output
		out DDRB,var_a

main: in var_a,PINC
      andi var_a, 0b01110000
	  lsr var_a
	  lsr var_a
	  lsr var_a
	  lsr var_a

	  ldi zl,low(TB*2)
	  ldi zh,high(TB*2)
	  clr var_b
      add zl,var_a
	  adc zh,var_b
	  lpm r10,z
	  out PORTB,r10
	  rjmp main

TB: .db 0b00000000, 0b00000001, 0b00000011, 0b00000111
    .db 0b00001111, 0b00011111, 0b00111111, 0b01111111