.data 
	a1:.word 1
	a2:.word 2

.global main
main:
	bl permute

permute:
	sub sp, sp, #8
	str lr, [sp]

	sub sp, sp, #8

	ldr r2, =a1
	ldr r1, [r2]
	str r1, [sp]

	ldr r2, =a2
	ldr r0, [r2]
	str r0, a1

	ldr r1, [sp]
	str r1, a2

	add sp, sp, #8


	ldr lr, [sp]
	add sp, sp, #8

	bl exit
