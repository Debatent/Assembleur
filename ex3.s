.data
	n:.word 10

.text
.global main
main:
	ldr r1, =n
	ldr r2, [r1]
	mov r0, r2
	bl sumI
	bl exit

sumI: // quand on appelle sum depuis le main, r0 = r2 = nbr dont on veut la somme inferieure
	sub  sp, sp, #8
	str lr, [sp]
	b sum
sum:
	cmp r0, #0
	ble sum0
	sub sp, sp, #8
	str r0, [sp]
	sub r0, #1
	b sum
depil:
	ldr r0, [sp]
	add sp, sp, #8
	add r1, r1, r0
	cmp r2, r0
	bgt depil
	b endfunc
sum0:
	sub sp, sp, #8
        str r0, [sp]
	mov r1, #0 //r1 va etre la somme
	cmp r2, r0
	bgt depil
endfunc:
	mov r0, r1
	ldr lr, [sp]
	add sp, sp, #8
	bx lr
