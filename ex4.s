.data
	 n .word 10

.text
.global main
main:
	ldr r1, =n
	ldr r0, [r1]
	bl fib0
	bl exit
fib0:
	cmp r0, #1
	bgt fib
	move r0, #1
	bx lr

fib:
        sub sp, sp, #8
        str lr, [sp]
	cmp r0, #2
	ble fin

	sub r0, #1
	bl fib
depil:
	add r0, r1, r2
	mov r2, r1
	mov r1, r0
	ldr lr, [sp]
	add sp, sp, #8
	bx lr

fin:
	str r1, #1
	str r2, #1
	b depil
