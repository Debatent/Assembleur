
	ldr r1, =n
	ldr r2, [r1]
	mov r0, r2

	sub  sp, sp, #8
	str lr, [sp]
sum:
	cmp r0, #0
	ble sum0
	sub sp, sp, #8
	str r0, [sp]
	sub r0, #1
	bl sum0
depil:
	add sp, sp, #8
	ldr r0, [sp]
	add r1, r1, r0
	cmp r2, r0
	bgt depil
	bl endfunc
sum0:
	sub sp, sp, #8
        str r0, [sp]
	ldr r1, #0
	cmp r2, r0
	bgt depil
endfunc:
	mov r0, r1
	ldr lr, [sp]
	add sp, sp, #8
	bx lr

